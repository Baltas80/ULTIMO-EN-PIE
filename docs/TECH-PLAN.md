# ÚLTIMO EN PIE — Plan técnico MVP

## Decisión de herramientas

### Motor
**Godot 4.7.2 estable** como motor principal del MVP.

Motivos:
- Gratuito y de código abierto bajo MIT.
- Motor 2D dedicado.
- Exportación Android y otras plataformas.
- GDScript integrado y adecuado para gameplay rápido.
- No requiere royalties por el juego.

Referencia oficial: https://godotengine.org/

### Código
GDScript para la lógica del juego.

Principio: scripts pequeños, responsabilidades separadas y nombres explícitos. Evitar sistemas genéricos prematuros.

### Control de versiones
Git + GitHub.

### Android
Godot Android export para el MVP. Android Studio/SDK se reserva como herramienta auxiliar para tareas Android específicas, firma y diagnóstico cuando sea necesario.

### CI
GitHub Actions funciona como **puerta de calidad automática**. Además de las comprobaciones estructurales, el workflow descarga el editor headless oficial de Godot 4.7.2 y realiza tres niveles de comprobación:

1. análisis sintáctico de todos los scripts GDScript;
2. carga del proyecto y de la escena principal en modo editor headless;
3. smoke test de ejecución del proyecto durante un número limitado de frames.

Esto permite detectar errores reales de parseo y determinados fallos de carga/ejecución antes de volver al dispositivo. La CI no sustituye la validación táctil, visual, de rendimiento ni Android real.

La compilación/exportación Android no se simula: se añadirá cuando exista una configuración Android verificable y reproducible.

## Estructura actual del prototipo

```text
ULTIMO-EN-PIE/
├── project.godot
├── scenes/
│   ├── main.tscn
│   ├── player.tscn
│   ├── bot.tscn
│   └── hazard.tscn
├── scripts/
│   ├── main.gd
│   ├── player.gd
│   ├── bot.gd
│   └── hazard.gd
├── .github/
│   └── workflows/
│       └── quality.yml
└── docs/
```

Esta estructura corresponde al núcleo jugable actual. Menú, puntuación persistente, audio, recursos artísticos adicionales y otros sistemas se incorporarán solo después de superar las puertas de validación del núcleo.

## Orden de implementación

1. Proyecto que arranque.
2. Arena estática.
3. Jugador y entrada táctil.
4. Bots deterministas.
5. Eliminación.
6. Peligro progresivo.
7. Escalar hasta 50 participantes y medir rendimiento.
8. Resultado y revancha.
9. Menú, puntuación y clasificación.
10. Audio y pulido.
11. Pruebas Android.
12. Build verificable.

## Regla de optimización

No se optimiza por intuición. Primero se mide. Si 50 participantes funcionan con margen suficiente, no se introduce complejidad de optimización adicional.

## Política de recursos

Prioridad:
1. Recursos propios generados o procedurales.
2. Recursos libres/open source con licencia compatible.
3. Bibliotecas gratuitas necesarias.
4. Servicios gratuitos solo cuando aporten una función necesaria.

No incorporar recursos cuya licencia no pueda documentarse.

## Criterio de coste

Objetivo de desarrollo del MVP: **0 € en software y servicios de desarrollo**, sin contar costes externos inevitables de publicación o cuentas de distribución ya existentes.
