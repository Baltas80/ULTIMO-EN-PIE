# ÚLTIMO EN PIE — GDD MVP

## 1. Visión

Un arcade de supervivencia extremadamente accesible: el jugador entra en una arena, evita peligros y trata de permanecer vivo más tiempo que los demás participantes.

**Promesa:** entrar, entender y jugar en segundos.

## 2. Bucle principal

1. Pulsar JUGAR.
2. Entrar en una arena.
3. Mover al personaje con un control táctil sencillo.
4. Evitar zonas peligrosas y obstáculos.
5. Sobrevivir mientras la arena se reduce o se vuelve más peligrosa.
6. Ser eliminado o alcanzar la victoria.
7. Recibir puntuación.
8. Volver a jugar.

## 3. MVP de una semana

### Obligatorio
- Una arena.
- Un personaje base.
- Movimiento táctil de un dedo.
- Sistema de eliminación.
- Peligro progresivo.
- Participantes controlados por IA para llenar la arena.
- Objetivo de 50 participantes visibles.
- Pantalla de resultado.
- Puntuación.
- Ranking local/persistente en el dispositivo.
- Menú principal.
- Sonidos básicos.
- Build Android instalable.

### Fuera del MVP
- Multijugador online real.
- Chat.
- Clanes.
- Compras dentro de la aplicación.
- Decenas de mapas.
- Sistema complejo de habilidades.
- Narrativa extensa.
- Matchmaking online.

Estas funciones solo entrarán después de validar el núcleo jugable.

## 4. Controles

El diseño inicial usa movimiento horizontal con un dedo. Debe poder explicarse mediante una instrucción de una línea.

## 5. Participantes

El objetivo visual es una arena con hasta 50 participantes. Para cumplir el plazo, los participantes serán bots en el MVP. Deben comportarse de manera suficientemente variada para que las partidas no parezcan completamente deterministas.

## 6. Peligros

El primer prototipo utilizará una única familia de peligros para evitar dispersión técnica. La dificultad aumenta mediante velocidad, reducción del espacio seguro y aparición progresiva de zonas peligrosas.

## 7. Progresión

La puntuación debe recompensar principalmente el tiempo de supervivencia y la posición final. No se utilizarán ventajas de pago ni estadísticas premium en el MVP.

## 8. Cosméticos

Se deja preparada la posibilidad de skins puramente visuales. No son necesarias para el primer prototipo jugable.

## 9. Retención

El bucle de revancha es la prioridad. El jugador debe poder iniciar otra partida inmediatamente después del resultado.

## 10. Criterios de aceptación

El MVP se considera funcional cuando:

- La aplicación arranca sin errores.
- Se puede comenzar una partida desde el menú.
- El personaje responde al control táctil.
- Los participantes se desplazan y pueden ser eliminados.
- El peligro progresa de forma reproducible.
- Una partida termina correctamente.
- Se determina una posición final.
- Se calcula y muestra una puntuación.
- Se puede comenzar otra partida sin reiniciar la aplicación.
- El rendimiento es estable en un dispositivo Android de referencia.
- Se genera una build Android verificable.

## 11. Regla de desarrollo

**No se añade una función porque parezca divertida.** Cada cambio debe justificar su coste, encajar en el MVP y poder probarse.

Antes de implementar cualquier sistema:

**Definir → implementar lo mínimo → probar → corregir → verificar → documentar.**
