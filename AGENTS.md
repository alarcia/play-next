# AGENTS.md

## Proyecto
- `play-next`: herramienta que recomienda qué juego jugar según el tiempo disponible, el estado de ánimo y la plataforma.
- Laravel 13 multipágina con Blade: cada módulo de negocio en `app/<Módulo>/`, modelos Eloquent en `app/Models/`, controladores en `app/Http/Controllers/`.
- Principios en `docs/constitution.md`; specs en `specs/NNN-nombre/` con `spec.md`, `plan.md` y `tasks.md`.

## Comandos
- Instalar: `composer run setup`.
- Ejecutar en local: `composer run dev` (solo con petición expresa).
- Tests: `php artisan test`.
- Formatear: `vendor/bin/pint`; comprobar sin modificar: `vendor/bin/pint --test`.
- Build de assets: `npm run build`.

## Estilo
- PHP ≥ 8.5 y Laravel 13; usa solo las dependencias del esqueleto oficial (ver principio 1 de la constitución).
- Declara tipos nativos en parámetros, retornos y propiedades.
- Empieza cada fichero PHP nuevo con `declare(strict_types=1);`.
- Escribe código, identificadores y comentarios en inglés; textos de interfaz y documentación en español.
- En `app/<Módulo>/` no importes `Illuminate\Http` ni renderices vistas.

## Reglas
- Lee `docs/constitution.md` y la spec activa (`spec.md`, `plan.md`, `tasks.md`) antes de tocar código.
- La spec activa es la de número más alto en `specs/`, salvo que el usuario indique otra.
- Si la implementación debe desviarse de `spec.md` o `plan.md`, propón antes el cambio y espera aprobación.
- Si algo contradice la constitución o falta una decisión, para y pregunta; nunca supongas.
- No levantes la aplicación ni ningún servidor sin petición expresa; tests, Pint y builds sí.
- No modifiques sin petición expresa: `docs/constitution.md`, `spec.md` y `plan.md` de cualquier spec, las dependencias de `composer.json` y `package.json`, las migraciones existentes en `database/migrations/` ni `.env`.

## Al terminar cualquier tarea
- Ejecuta `php artisan test` y confirma que está en verde.
- Ejecuta `vendor/bin/pint --test` y confirma que no hay errores.
- Si tocaste vistas o assets, ejecuta `npm run build` y confirma que termina sin errores.
- Ejecuta `grep -rnF 'Illuminate\Http' app --exclude-dir=Http` y confirma que no devuelve nada.
- Confirma que cada fichero PHP nuevo empieza con `declare(strict_types=1);`.
- Marca en `tasks.md` como `- [x]` las tareas completadas, solo con los tests en verde.
- Indica en tu respuesta el resultado de cada comprobación.
