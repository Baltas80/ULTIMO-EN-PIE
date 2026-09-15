# ÚLTIMO EN PIE

Juego arcade móvil de supervivencia y competición diseñado para un MVP funcional en una semana.

## Regla de oro

**Nada de código a lo loco.** Primero se define, después se implementa, se prueba y se verifica.

El proyecto prioriza herramientas y recursos sin coste, reutilización responsable y un alcance estrictamente controlado para el MVP.

## Concepto MVP

- Android como primera plataforma.
- Partidas cortas de supervivencia.
- Personaje con movimiento sencillo de un dedo.
- Arena que se vuelve progresivamente peligrosa.
- 50 participantes visibles: 1 jugador + 49 bots deterministas.
- Eliminación progresiva hasta determinar al último participante.
- Pantalla de resultado y posibilidad de revancha sin reiniciar la aplicación.
- Puntuación y clasificación: bloque posterior al núcleo jugable.
- Personalización cosmética sin ventajas competitivas: fuera del primer prototipo.
- Sin multijugador online real en la primera versión si su complejidad compromete el objetivo de una semana; se deja preparada la arquitectura para incorporarlo posteriormente.

## Fases

1. Diseño y arquitectura.
2. Prototipo jugable.
3. Mecánicas principales.
4. UI, puntuación y progresión.
5. Audio, rendimiento y pulido.
6. Pruebas.
7. Build Android y preparación de publicación.

## Estado

**Fase 2 — Prototipo jugable en construcción.**

La rama de desarrollo ya contiene la base Godot con arena, jugador, 49 bots, peligro móvil, eliminación, contador, final de partida y revancha. La ejecución real en Godot y Android sigue siendo una puerta de validación pendiente; no se declara el bloque terminado hasta superarla.

## Validación

La lista de aceptación está en `docs/VALIDATION-CHECKLIST.md`.

GitHub Actions valida actualmente la estructura mínima y la integridad básica del proyecto. La compilación/exportación real con Godot y Android queda pendiente hasta disponer de ese entorno de ejecución.

No se implementarán sistemas adicionales hasta que cada bloque tenga una prueba asociada y pueda verificarse en Godot.
