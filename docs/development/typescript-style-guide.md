# Convenciones de TypeScript y Next.js

El objetivo es que cualquier integrante pueda leer, modificar y defender el código de presentación y aplicación. Estas reglas se aplican al código propio y a sus pruebas, no a dependencias ni archivos generados. Los nombres de código se escriben en inglés; los nombres físicos de PostgreSQL conservan el relacional en español.

## 1. Funciones y control de flujo

- Usar declaraciones function con nombre, incluyendo async function para operaciones asíncronas. Prohibir funciones flecha, expresiones de función anónimas e IIFE en código propio.
- Declarar los manejadores de eventos fuera del JSX; pasar el nombre de la función como propiedad. Usar funciones nombradas también para callbacks de map, filter, reduce y pruebas. Preferir for...of y pasos intermedios si mejoran la lectura.
- Usar if/else, guard clauses, switch y retornos explícitos; evitar operadores ternarios, secuencias de operadores booleanos que oculten acciones y cadenas largas de métodos.
- Una función tiene una responsabilidad; si crece hasta mezclar validación, consulta y presentación, separarla. Evitar patrones, clases y abstracciones sin necesidad demostrable.

```tsx
"use client";

import { useState } from "react";

export default function IncidentCounter() {
  const [count, setCount] = useState<number>(0);

  function increment(previousCount: number): number {
    return previousCount + 1;
  }

  function handleIncrement(): void {
    setCount(increment);
  }

  return <button onClick={handleIncrement}>Incidencias: {count}</button>;
}
```

## 2. Tipos y datos

- Activar strict en tsconfig.json; no usar any, @ts-ignore, aserciones no nulas o conversiones forzadas para silenciar errores.
- Tipar parámetros, retornos de funciones exportadas (incluidas promesas) y estructuras de entrada y salida. Se admite inferencia local cuando es evidente, y retorno inferido de componentes React cuando evita tipos dependientes de la versión de React.
- Usar unknown para datos externos y estrechar el tipo mediante validación en el servidor. No asumir que TypeScript valida datos en ejecución.
- Usar const por defecto y let cuando cambie el valor. No usar var. Nombres expresivos y sin abreviaciones arbitrarias.
- Evitar tipos condicionales, genéricos avanzados, decoradores, metaprogramación y encadenamiento innecesario. Utilizar tipos e interfaces simples y funciones claras; cualquier excepción requiere justificación y revisión.
- Usar async/await y try/catch; evitar cadenas de promesas anidadas. No ocultar fallos con catches vacíos. Los errores de infraestructura no deben exponer secretos.

## 3. Límites arquitectónicos

- Un proyecto Next.js con App Router; presentación en app/ y components/, aplicación en server/actions/ y acceso al gestor exclusivamente en server/db/.
- Server Actions exportadas con async function; validar entrada y sesión. Los componentes no importan el controlador PostgreSQL ni ejecutan consultas; consumen funciones de aplicación.
- No trasladar las reglas de integridad o autorización del negocio a TypeScript. PostgreSQL es la autoridad. La capa de aplicación autentica, valida formato, establece contexto y traduce errores.
- Parametrizar consultas y separar código exclusivo del servidor. Usar directivas de cliente solo cuando son necesarias. No introducir un framework HTTP adicional.

## 4. Control automático al inicializar web/

Configurar el ESLint compatible con la versión fijada de Next.js y TypeScript. Combinar sus reglas recomendadas con la configuración propia en los archivos .ts y .tsx. Las siguientes reglas son el mínimo; se deben incorporar al flat config real una vez exista el package.json de web/:

```js
const readabilityRules = {
  "no-restricted-syntax": [
    "error",
    {
      selector: "ArrowFunctionExpression",
      message: "Use named function declarations.",
    },
    {
      selector: "FunctionExpression",
      message: "Use named function declarations.",
    },
  ],
  "no-ternary": "error",
  "no-var": "error",
  "prefer-const": "error",
  "@typescript-eslint/no-explicit-any": "error",
  "@typescript-eslint/no-non-null-assertion": "error",
  "@typescript-eslint/ban-ts-comment": "error",
};
```

No desactivar reglas por comodidad. Cualquier excepción indispensable se delimita a una línea, se documenta y se revisa. Los archivos generados y dependencias se excluyen; no excluir código de aplicación o de pruebas.

Añadir scripts npm para lint (eslint), typecheck (tsc --noEmit), test y build en la inicialización del proyecto. GitHub Actions deberá ejecutar estos comandos cuando exista una aplicación ejecutable. Esta propuesta no declara que esos controles estén activos ni inventa una versión del framework.

## 5. Revisión

Antes del merge, comprobar que el código sigue la especificación, que las pruebas se escribieron primero, que se verificó el resultado y que las funciones son comprensibles sin explicar sintaxis avanzada. No añadir librerías sin justificar su necesidad. 

Referencias: [Next.js ESLint](https://nextjs.org/docs/app/api-reference/config/eslint), [ESLint no-restricted-syntax](https://eslint.org/docs/latest/rules/no-restricted-syntax).
