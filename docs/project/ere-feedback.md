# Devolución docente de la primera entrega (17,3/20)

## Decisión práctica para la segunda entrega

**El modelo relacional entregado se mantiene íntegro**. Según la aclaración del equipo tras la devolución presencial, la profesora no pidió modificaciones a sus relaciones, claves ni restricciones para esta fase.

La disminución de nota se relacionó con **elecciones de técnicas de modelado en el ERE**, algunas distintas de las preferidas o indicadas en clase, y con la oportunidad de usar **generalizaciones** para mejorar **extensibilidad y legibilidad**.

La evidencia aportada es **una página escaneada del ERE con anotaciones manuscritas y elementos resaltados** (`CamScanner 19-11-26 12.09(1).pdf`, recibida el 22 de noviembre de 2026). El escaneo no permite transcribir con seguridad todas las notas particulares, por lo que no corresponde atribuir a la profesora recomendaciones específicas que no hayan sido confirmadas.

## Impacto en SDD y TDD

| Elemento | Tratamiento |
|---|---|
| Esquema relacional entregado | **Conservar**: base para especificar tablas, claves y relaciones |
| Restricciones RR del informe | **Conservar**: planificar pruebas de integridad sobre su semántica; revisar solamente el vínculo HU↔RR del mapa |
| ERE | Documentar observaciones y opciones de mejora; **no rediseñar automáticamente** |
| Generalizaciones | Alternativa de modelado conceptual, **no requisito obligatorio de implementación** |
| Pruebas PostgreSQL | **Pueden planificarse desde ahora** con el esquema relacional vigente |
| API / interfaz | Contratos todavía por revisar; FastAPI y React propuestos, alternativa Node.js pendiente |

## Acciones acordadas

1. No modificar `database/schema.sql` durante esta fase de planificación.
2. No reemplazar claves naturales/compuestas por UUID, ni añadir tablas puente o generalizaciones nuevas por iniciativa del agente.
3. Definir especificaciones observables sobre el esquema relacional aprobado y derivar primero pruebas SQL de PK/FK, integridad y transacciones.
4. Conservar las observaciones conceptuales como antecedentes para la defensa, no como bloqueos de implementación.
5. Si aparece una contradicción **concreta** entre un requisito y el modelo relacional, documentarla y discutirla antes de cambiar la estructura.

[Mapa de trazabilidad](../requirements/traceability.md) · [SDD](../development/sdd-guide.md) · [TDD](../development/tdd-guide.md)
