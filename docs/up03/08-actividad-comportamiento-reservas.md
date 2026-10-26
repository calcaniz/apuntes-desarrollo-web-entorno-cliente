---

title: A03.03 · Comportamiento y gestión de reservas

---

## 8. Actividad guiada: comportamiento y gestión de reservas

En esta actividad ampliaremos la clase `Evento` para que pueda gestionar la venta y cancelación de entradas de forma controlada.

La actividad se realizará mediante **live coding** y no será calificable.

| Actividad { .table-main-column .table-bg-principal .table-cl-secundario } | Información { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|
| **Código** | A03.03 |
| **Modalidad** | Guiada y formativa |
| **Duración** | 45 minutos |
| **Criterios relacionados** | CE04-h |

### 8.1. Punto de partida

Utilizaremos la clase `Evento` creada en la actividad anterior:

```ts
class Evento {
  constructor(
    public readonly id: number,
    public nombre: string,
    public categoria: string,
    private _precioEntrada: number,
    public aforoTotal: number,
    private entradasVendidas: number = 0
  ) {}
}
```

### 8.2. Tareas

Añadiremos progresivamente los siguientes métodos:

1. `calcularDisponibles()`

    Debe devolver el número de entradas que todavía pueden venderse.

2. `estaAgotado()`

    Debe devolver `true` cuando no queden entradas disponibles.

3. `reservarEntradas(cantidad)`

    Debe registrar una reserva únicamente cuando:

    - La cantidad sea mayor que cero.
    - Existan suficientes entradas disponibles.

    El método devolverá `true` si la reserva se completa y `false` en caso contrario.

4. `cancelarReserva(cantidad)`

    Debe reducir las entradas vendidas únicamente cuando:

    - La cantidad sea mayor que cero.
    - No se cancelen más entradas de las que se han vendido.

5. `calcularImporte(cantidad)`

    Debe devolver el precio total correspondiente a una cantidad de entradas.

6. Crear un método `get` que permita consultar las entradas vendidas sin modificarlas directamente.

7. Crear métodos `get` y `set` para controlar el precio de la entrada.

8. Impedir que se asigne un precio negativo.

### 8.3. Pruebas de funcionamiento

Crearemos un evento con un aforo de `100` personas y comprobaremos las siguientes operaciones:

| Operación | Resultado esperado |
|---|---|
| Reservar 20 entradas | Operación aceptada |
| Reservar 0 entradas | Operación rechazada |
| Reservar 90 entradas adicionales | Operación rechazada |
| Cancelar 5 entradas | Operación aceptada |
| Cancelar 50 entradas | Operación rechazada |
| Cambiar el precio a 25 € | Cambio aceptado |
| Cambiar el precio a −10 € | Cambio rechazado |
| Calcular el importe de 4 entradas | 100 € |

### 8.4. Preguntas de revisión

1. ¿Por qué `entradasVendidas` debe permanecer privada?
2. ¿Qué diferencia existe entre consultar una propiedad mediante `get` y ejecutar un método convencional?
3. ¿Por qué `reservarEntradas()` devuelve un valor booleano?
4. ¿Qué validaciones evitan que el objeto alcance un estado incorrecto?
5. ¿Qué métodos modifican el objeto y cuáles únicamente consultan información?

### 8.5. Resultado esperado

Al finalizar la actividad, la clase `Evento` será capaz de:

- Calcular su disponibilidad.
- Determinar si está agotada.
- Registrar y cancelar reservas.
- Calcular el importe de una compra.
- Proteger las entradas vendidas.
- Controlar los cambios en el precio.

!!! reto "Ampliación opcional"

    Añade un método `mostrarResumen()` que devuelva el nombre, el precio y las entradas disponibles del evento en una única cadena.