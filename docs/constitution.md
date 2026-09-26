# Constitución de play-next

Toda spec, plan y tarea debe cumplir estos principios; cambiar alguno exige enmendar antes este documento.

1. **Stack mínimo y fijo.** Web multipágina renderizada en servidor con PHP ≥ 8.5, Laravel 13 y vistas Blade. Solo se usan las dependencias del esqueleto oficial de Laravel 13 (Vite y Tailwind incluidos); añadir otra exige que el plan justifique por qué Laravel o PHP no bastan.
2. **La spec manda.** No se escribe código que no derive de una spec aprobada; si la implementación debe desviarse, primero se actualiza la spec. Si falta una decisión, se para y se pregunta al usuario: nunca se supone. El esqueleto inicial de Laravel y la infraestructura (Docker, CI/CD, despliegue) quedan fuera de las specs.
3. **Lógica separada de la interfaz.** Las reglas de negocio (como la recomendación de juegos) viven en clases que no importan `Illuminate\Http` ni renderizan vistas; controladores y vistas solo traducen entrada y salida.
4. **Todo criterio tiene test.** Cada criterio de aceptación de una spec tiene al menos un test PHPUnit, y una tarea solo se cierra con `php artisan test` en verde.
5. **Una sola persistencia.** Los datos se guardan únicamente en SQLite mediante Eloquent, y el esquema solo cambia con migraciones de Laravel.
6. **Idioma.** Código, identificadores y comentarios en inglés; textos de interfaz y documentación en español.
