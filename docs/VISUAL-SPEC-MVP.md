# ÚLTIMO EN PIE — Especificación visual MVP

## Objetivo

El MVP debe abandonar la apariencia de prototipo técnico y alcanzar una presentación de arcade futurista limpia, legible y consistente en móvil, sin introducir assets pesados ni dependencias de pago.

## Principios

1. **Silhouette first**: jugador, bots y peligro deben reconocerse en menos de un segundo.
2. **Arena como protagonista**: geometría circular/concéntrica, profundidad mediante líneas, anillos y zonas de peligro.
3. **Contraste funcional**: fondo oscuro; jugador con acento cian; peligro con acento cálido; bots en tonos neutros.
4. **HUD mínimo**: título, participantes y tiempo. Ningún elemento debe tapar la zona jugable.
5. **Consistencia**: misma geometría, grosor de líneas y lenguaje visual para todos los objetos.
6. **Procedural/lightweight**: preferir `draw_*`, `Polygon2D`, `Line2D` y formas simples antes que texturas grandes.
7. **Rendimiento**: 50 participantes visibles deben seguir siendo el objetivo; ningún efecto visual debe depender de shaders complejos para el MVP.

## Composición de pantalla

- Resolución lógica: 720x1280.
- Arena: aproximadamente 624x940, centrada horizontalmente.
- Cabecera: título + subtítulo + contador.
- Zona inferior: jugador visible y HUD sin controles virtuales permanentes.
- Margen de seguridad: mantener participantes fuera de los bordes físicos de la arena.

## Identidad visual

### Jugador
- Silueta angular/octogonal.
- Cuerpo oscuro con núcleo/acento cian.
- Debe destacar frente a los 49 bots sin necesidad de texto permanente.

### Bots
- Misma familia geométrica que el jugador, pero con tonos neutros.
- Variaciones pequeñas de escala, rotación o intensidad permitidas.
- No usar colores que compitan con el jugador o el peligro.

### Peligro
- Forma central claramente diferenciada.
- Acento cálido rojo/naranja.
- Debe comunicar inmediatamente que es el elemento que elimina participantes.

### Arena
- Fondo casi negro/azul profundo.
- Anillos concéntricos y radios como estructura visual.
- Núcleo central con iluminación procedural.
- Bordes dobles o escalonados para sensación de recinto tecnológico.
- Barreras decorativas en puntos cardinales/secundarios sin bloquear participantes.

## HUD

- `ÚLTIMO EN PIE` como marca principal.
- `SOBREVIVE · RESISTE · GANA` como subtítulo.
- `PARTICIPANTES 50/50 · 0.0s` como información de partida.
- Tipografía sans-serif limpia y de alta legibilidad.
- Evitar sombras excesivas, gradientes pesados y texto decorativo innecesario.

## Animación mínima prevista

Solo después de validar el núcleo:

- pulso sutil del núcleo central;
- respiración/luminosidad del jugador;
- movimiento visual del peligro sincronizado con su posición real;
- microfeedback al eliminar un participante;
- transición corta al resultado.

Las animaciones no deben alterar la lógica de gameplay ni generar allocations por frame innecesarias.

## Puerta de calidad visual

Antes de añadir cosméticos, partículas complejas, skins, nuevas arenas o efectos avanzados deben cumplirse:

- jugador reconocible;
- bots distinguibles del jugador;
- peligro inequívoco;
- HUD legible en pantalla móvil;
- arena visualmente coherente;
- sin assets >10 MB;
- CI Godot verde;
- validación real en dispositivo pendiente/realizada según fase.

## Fuera de alcance visual del MVP

- personajes 3D;
- cinemáticas;
- partículas pesadas;
- iluminación dinámica compleja;
- tienda de skins;
- múltiples biomas completos;
- efectos de postprocesado que comprometan dispositivos modestos.
