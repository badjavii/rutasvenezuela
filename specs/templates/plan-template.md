# Plan: [Nombre de la funcionalidad]

## 1. Objetivo

Cómo implementar la especificación sin ampliar su alcance.

## 2. Estrategia general

Prueba → RED → Implementación mínima → GREEN → Refactor, si aporta.

## 3. Componentes afectados

- Capa de datos: tablas, claves, restricciones, triggers, funciones, procedimientos y privilegios.
- Capa de aplicación: server actions con `SET LOCAL ROLE`.
- Capa de presentación: páginas y componentes según los mockups.
- Pruebas: cobertura que se incorporará.

## 4. Verificación

Pruebas dirigidas, suite completa, comprobaciones manuales y revisión de `git diff`.

## 5. Riesgos y decisiones pendientes

Riesgos técnicos y aspectos que requieren revisión humana.

## 6. Fuera del plan

Qué no se realizará.
