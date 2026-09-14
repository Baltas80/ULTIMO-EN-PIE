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
GitHub Actions se incorporará cuando exista una estructura mínima compilable. No se añade CI ficticia antes de tener un proyecto real que probar.

## Estructura prevista

```text
ULTIMO-EN-PIE/
├── project.godot
├── scenes/
│   ├── main.tscn
│   ├── menu.tscn
│   ├── arena.tscn
│   └── result.tscn
├── scripts/
│   ├── game.gd
│   ├── player.gd
│   ├── bot.gd
│   ├── arena.gd
│   └── score.gd
├── assets/
│   ├── art/
│   └── audio/
├── tests/
└── docs/
```

La estructura es una propuesta inicial; se revisará antes de crear todos los directorios.

## Orden de implementación

1. Proyecto vacío que arranque.
2. Arena estática.
3. Jugador y entrada táctil.
4. Un bot.
5. Eliminación.
6. Peligro progresivo.
7. Escalar hasta 50 participantes y medir rendimiento.
8. Resultado y puntuación.
9. Menú y revancha.
10. Pruebas Android.
11. Build verificable.

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
