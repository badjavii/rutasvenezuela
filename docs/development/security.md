# Contrato transversal de seguridad

Estado: propuesta para revisión del equipo. No se añaden capacidades SDD ni se altera el modelo relacional. Las pruebas del [catálogo de seguridad](../testing/security-cases.csv) se encuentran planificadas, no ejecutadas.

## 1. Frontera de confianza

Next.js reúne presentación y aplicación; únicamente el servidor se conecta a PostgreSQL con `app_rv`. El navegador no recibe credenciales SQL, no selecciona el rol efectivo ni establece la identidad de la transacción. Server Components y Client Components no acceden directamente al gestor: pasan por funciones de aplicación y `server/db`. Los módulos de acceso a datos son exclusivos del servidor.

No se utiliza Supabase Auth, API automática ni RLS. PostgreSQL confía en el contexto que fija el servidor autenticado. Una variable personalizada no es un secreto ni una prueba criptográfica: una conexión con capacidad de ejecutar SQL arbitrario puede modificarla. La filtración de la contraseña de `app_rv` o de la clave de firma rompe esta frontera. La verificación HMAC en PostgreSQL no forma parte de esta fase.

## 2. Sesión y autenticación inicial

Cada operación protegida verifica la firma, expiración y estructura de la cookie en el servidor. La cookie usa HttpOnly, Secure en HTTPS, SameSite y duración limitada; no contiene contraseñas ni secretos del gestor. No aceptar la identidad ni el rol desde formularios. Revalidar la existencia y asociación de la cuenta con el actor; la política de revocación inmediata de sesiones válidas todavía debe acordarse (no inventar atributos del modelo).

Se propone un rol técnico `rol_autenticacion`, NOLOGIN, sin privilegios de tablas. `app_rv` puede asumirlo explícitamente solo mediante un flujo de servidor separado de `conActor`, para verificar credenciales llamando a `fn_iniciar_sesion`. La rutina debe devolver exclusivamente los datos mínimos de identidad y rol, nunca el hash, con error genérico para credenciales inválidas. El servidor limita intentos de autenticación y emite la cookie únicamente después de éxito. El registro público, si lo exige la especificación, tendrá un permiso y una rutina explícitos; no se concede por defecto. Acordar firma, vencimiento y revocación con el equipo antes de implementar.

## 3. Contexto de ejecución

`conActor(sesion, operacion)` es el único acceso protegido a datos. Toma una conexión del pool y ejecuta todas las instrucciones en ese mismo cliente.

```sql
BEGIN;
SET LOCAL ROLE rol_visitante;
SELECT set_config('app.id_cuenta', $1, true);
-- Ejecutar una rutina autorizada con parámetros enlazados.
COMMIT;
```

El rol se obtiene de una lista blanca estática del servidor, no de una cadena aportada por el navegador. El ejemplo usa un rol fijo; el identificador de cuenta es un parámetro de la consulta. En cualquier error se ejecuta ROLLBACK antes de devolver el cliente al pool. Si el rollback falla, descartar la conexión. No usar pool.query para una secuencia transaccional. No usar SET ROLE o set_config con alcance de sesión.

Las membresías de `app_rv` en PostgreSQL 17 deben verificarse con INHERIT FALSE, SET TRUE y ADMIN FALSE; comprobar que no tenga acceso a `rv_owner` ni privilegios ajenos. `NOINHERIT` por sí solo no sustituye la verificación de las opciones de membresía.

## 4. Identidad y autorización por registro

`fn_cuenta_actual()` obtiene la identidad mediante:

```sql
NULLIF(current_setting('app.id_cuenta', true), '')
```

Rechazar valor ausente, vacío, no entero, fuera de rango o que no corresponda a una cuenta existente antes de usarlo. Las funciones `fn_visitante_actual()`, `fn_guia_actual()`, `fn_comercio_actual()`, `fn_ente_actual()`, `fn_funcionario_actual()` y `fn_administrador_actual()` resuelven la clave natural por las relaciones CUENTA del modelo. Rechazar si el tipo de actor no coincide. En SECURITY DEFINER, current_user es el propietario de la rutina, no el rol del actor; no utilizarlo como prueba de identidad. La entrada a la rutina se limita mediante GRANT EXECUTE y la función de identidad comprueba la relación correspondiente.

Cada operación valida pertenencia o competencia mediante las relaciones existentes: CREA (rutas), REALIZA (recorridos), ADQUIERE (credenciales), CONTRATA_VISITANTE / CONTRATA_GUIA, SIRVE y GENERA cuando corresponda. Para funcionarios, usar PERTENECE_A, COMPETENCIA y la ubicación alcanzada por AFECTA_HITO o AFECTA_TRAMO, conforme al requisito concreto. No generalizar una regla de propiedad a operaciones que el modelo permita a terceros.

La comprobación de autorización y la escritura deben ser atómicas: usar un predicado de autorización en la propia mutación o bloquear y revalidar las filas relevantes si la operación exige varios pasos. No confiar en un SELECT previo separado que permita cambios concurrentes de propiedad o competencia. Las consultas también filtran registros privados. Un rechazo no debe revelar datos de otro actor ni provocar efectos parciales.

## 5. Privilegios y rutinas

- `rv_owner` NOLOGIN posee los objetos. Los roles de actor no tienen permisos directos de lectura o modificación sobre tablas ni CREATE en esquemas de confianza.
- Cada operación se expone por una función o procedimiento expresamente autorizado. Las funciones auxiliares internas no reciben GRANT EXECUTE a actores si no es necesario.
- Las rutinas SECURITY DEFINER fijan `search_path = rutasvzla, pg_temp` y califican los objetos cuando corresponda; las extensiones se referencian desde un esquema de confianza. Revocar EXECUTE de PUBLIC para las rutinas y otorgarlo solo a las firmas y roles requeridos. Verificar privilegios efectivos, no solo las sentencias de creación.
- El SQL usa parámetros enlazados. Para identificadores dinámicos imprescindibles, lista blanca y format('%I', ...); para valores, EXECUTE ... USING. No concatenar datos del usuario.
- Las rutinas no hacen COMMIT ni ROLLBACK internamente: la transacción pertenece a conActor. Los errores se traducen a respuestas seguras sin exponer consultas, credenciales o mensajes internos sensibles.

## 6. Responsabilidades y TDD

Valeria define autenticación y las funciones de resolución de cuenta/actor en actores-identidades. Cada integrante implementa la autorización por registro en sus rutinas, a partir de las reglas de su capacidad. El equipo revisa conjuntamente la función conActor, la lista blanca de roles y el manejo de sesiones.

Escribir primero las pruebas del [catálogo transversal](../testing/security-cases.csv), verificar RED, implementar y comprobar GREEN. Las pruebas SQL de identidad/privilegios deben ejecutarse como app_rv real o usando SET SESSION AUTHORIZATION en una instancia desechable, no únicamente como superusuario. El catálogo no añade HU ni RR académicas. No se exige terminar el contrato para crear las tablas; sí aprobarlo antes de implementar las rutinas protegidas.

## Referencias técnicas

- [PostgreSQL 17: SET ROLE](https://www.postgresql.org/docs/17/sql-set-role.html)
- [PostgreSQL 17: CREATE FUNCTION](https://www.postgresql.org/docs/17/sql-createfunction.html)
- [PostgreSQL 17: funciones de información](https://www.postgresql.org/docs/17/functions-info.html)
- [Next.js: autenticación](https://nextjs.org/docs/app/guides/authentication)
- [node-postgres: transacciones](https://node-postgres.com/features/transactions)
