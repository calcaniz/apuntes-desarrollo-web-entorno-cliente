---

title: A03.04 · Modelo de objetos de FestWeb

---

## 10. Actividad guiada: modelo de objetos de FestWeb

En esta actividad construiremos un modelo simplificado de FestWeb mediante varias clases relacionadas. Las operaciones se ejecutarán secuencialmente desde `main.ts` y se comprobarán mediante la consola.

La actividad se realizará mediante **live coding** y no será calificable.

| Actividad { .table-main-column .table-bg-principal .table-cl-secundario } | Información |
|---|---|
| **Código** | A03.04 |
| **Modalidad** | Guiada y formativa |
| **Duración** | 50 minutos |
| **Criterios relacionados** | CE04-f · CE04-g · CE04-h · CE04-i |

### 10.1. Clases del modelo

Crearemos las siguientes clases:

| Clase | Propiedades principales | Responsabilidad |
|---|---|---|
| `Ubicacion` | Recinto y localidad | Representar el lugar del evento. |
| `Organizador` | Nombre y correo | Representar a la entidad organizadora. |
| `Evento` | Identificador, nombre, precio, aforo y ventas | Gestionar la información y disponibilidad. |
| `Entrada` | Código, evento y precio | Representar un acceso individual. |
| `Reserva` | Código, evento y cantidad | Gestionar una reserva de entradas. |

### 10.2. Relaciones

El modelo deberá respetar las siguientes relaciones:

- Un `Evento` contiene una `Ubicacion`.
- Un `Evento` está asociado a un `Organizador`.
- Una `Entrada` corresponde a un `Evento`.
- Una `Reserva` corresponde a un `Evento`.
- Al confirmar una reserva, deben actualizarse las entradas vendidas del evento.

### 10.3. Tareas

Durante el desarrollo guiado realizaremos los siguientes pasos:

1. Crear la clase `Ubicacion`.

2. Crear la clase `Organizador`.

3. Adaptar la clase `Evento` para que reciba:

    - Una ubicación.
    - Un organizador.
    - El precio de la entrada.
    - El aforo total.

4. Mantener las entradas vendidas como propiedad privada.

5. Incorporar a `Evento` los métodos necesarios para:

    - Calcular las entradas disponibles.
    - Comprobar si está agotado.
    - Registrar una reserva.
    - Cancelar una reserva.
    - Mostrar un resumen.

6. Crear la clase `Entrada` y relacionarla con un evento.

7. Crear la clase `Reserva` con los siguientes métodos:

    - Confirmar la reserva.
    - Cancelar la reserva.
    - Calcular su importe.

8. Crear diferentes instancias y comprobar su funcionamiento desde `main.ts`.

### 10.4. Reglas del modelo

El programa deberá respetar estas condiciones:

- Los identificadores y códigos serán de solo lectura.
- El precio de una entrada no podrá ser negativo.
- Una reserva deberá incluir al menos una entrada.
- No podrán reservarse más entradas de las disponibles.
- No podrá cancelarse una reserva que no haya sido confirmada.
- Las propiedades internas se modificarán mediante métodos controlados.

### 10.5. Secuencia de prueba

En `main.ts` ejecutaremos las siguientes operaciones:

1. Crear una ubicación.
2. Crear un organizador.
3. Crear un evento con aforo para 100 personas.
4. Mostrar su estado inicial.
5. Crear una reserva de 20 entradas.
6. Confirmar la reserva.
7. Mostrar las entradas disponibles.
8. Intentar confirmar una reserva de 90 entradas.
9. Cancelar la primera reserva.
10. Comprobar que el aforo disponible vuelve a actualizarse.

La consola debería mostrar una secuencia similar a esta:

```text
Evento creado: Festival Mediterránea
Entradas disponibles: 100
Reserva R-001 confirmada
Entradas disponibles: 80
No hay suficientes entradas para R-002
Reserva R-001 cancelada
Entradas disponibles: 100
```

### 10.6. Preguntas de revisión

1. ¿Qué clases pueden existir de manera independiente?
2. ¿Qué objetos contienen referencias a otros objetos?
3. ¿Qué propiedades deben permanecer privadas?
4. ¿Qué clase debe validar la disponibilidad?
5. ¿Qué diferencia existe entre crear una entrada y confirmar una reserva?
6. ¿Qué ventajas aporta dividir el programa en varias clases?

### 10.7. Resultado esperado

Al finalizar la actividad tendremos un modelo formado por varios objetos que colaboran entre sí, manteniendo sus responsabilidades separadas y protegiendo su estado interno.

!!! reto "Ampliación opcional"

    Crea una clase `EventoOnline` que herede de `Evento`, incorpore el nombre de la plataforma y adapte el método que muestra el resumen.