---

title: UP02 · Fundamentos de JavaScript · Comentarios y legibilidad

---

El código no solo debe funcionar: también debe poder comprenderse, revisarse y modificarse con facilidad.

Los comentarios permiten añadir explicaciones que JavaScript ignora durante la ejecución. Deben utilizarse para aclarar decisiones importantes, advertencias o comportamientos que no resulten evidentes.

### 12.1. Comentarios de una línea

Los comentarios de una línea comienzan con `//`:

```js
// Precio general establecido por la organización.
const precioEntrada = 35;
```

También pueden escribirse después de una instrucción:

```js
const edadMinima = 18; // Requisito de acceso al evento.
```

Los utilizaremos para explicaciones breves.

### 12.2. Comentarios de varias líneas

Los comentarios de varias líneas se delimitan mediante `/*` y `*/`:

```js
/*
  El descuento se aplica únicamente sobre el precio de las entradas.
  Los gastos de gestión no forman parte del importe descontable.
*/
const descuento = 0.2;
```

Son útiles cuando la explicación necesita ocupar varias líneas.

No deben utilizarse para ocultar grandes fragmentos de código que ya no se necesitan. El control de versiones permite recuperar código eliminado.

!!! salto-pagina-pdf ""

### 12.3. Explicar el motivo, no repetir el código

Un comentario no debería limitarse a describir algo que ya puede leerse directamente.

Comentario innecesario:

```js
// Se multiplica el precio por la cantidad.
const subtotal = precioEntrada * cantidad;
```

Comentario útil:

```js
// El descuento no afecta a los gastos de gestión.
const descuentoAplicado = subtotal * porcentajeDescuento;
```

El primer comentario repite la operación. El segundo explica una regla de la aplicación que no resulta evidente solamente al leer la expresión.

!!! importante "Regla práctica"

    Los comentarios deben explicar principalmente el **porqué** de una decisión, no traducir literalmente el código.

### 12.4. Código legible

Antes de añadir un comentario, debemos comprobar si podemos mejorar el propio código.

Código poco descriptivo:

```js
const p = 35;
const c = 3;
const t = p * c;
```

Código más legible:

```js
const precioEntrada = 35;
const cantidadEntradas = 3;
const importeEntradas = precioEntrada * cantidadEntradas;
```

La segunda versión apenas necesita comentarios porque los identificadores explican qué representa cada valor.

!!! salto-pagina-pdf ""

La legibilidad depende de:

- Utilizar nombres descriptivos.
- Mantener una indentación consistente.
- Separar los bloques relacionados.
- Evitar expresiones innecesariamente complejas.
- Utilizar constantes para valores con significado.
- Mantener un estilo uniforme.
- Eliminar código que ya no se utiliza.

### 12.5. Evitar números sin significado

Un valor numérico escrito directamente dentro de una operación puede resultar difícil de interpretar:

```js
const precioFinal = subtotal - subtotal * 0.2;
```

Podemos asignarle un nombre:

```js
const descuentoEstudiante = 0.2;
const precioFinal =
  subtotal - subtotal * descuentoEstudiante;
```

Ahora el código explica qué representa el valor `0.2`.

Estos valores escritos sin contexto suelen denominarse **números mágicos**.

### 12.6. Formato del código

Utilizaremos una indentación coherente para mostrar la estructura del programa:

```js
if (inscripcionAbierta) {
  if (entradasDisponibles > 0) {
    console.log("Inscripción disponible");
  }
}
```

Evitaremos escribir todo el código en una sola línea:

```js
// Difícil de leer:
// if (inscripcionAbierta) { if (entradasDisponibles > 0) { console.log("Disponible"); } }
```

!!! salto-pagina-pdf ""

También separaremos los bloques según su responsabilidad:

```js
// Datos del evento.
const precioEntrada = 35;
const cantidadEntradas = 3;
const descuentoEstudiante = 0.2;

// Cálculos.
const subtotal = precioEntrada * cantidadEntradas;
const descuentoAplicado = subtotal * descuentoEstudiante;
const precioFinal = subtotal - descuentoAplicado;

// Resultado.
console.log(`Precio final: ${precioFinal} €`);
```

Los comentarios que encabezan los bloques ayudan a identificar las partes principales sin explicar cada instrucción.

### 12.7. Comentarios que deben evitarse

#### Comentarios evidentes

```js
// Declara el precio.
const precioEntrada = 35;
```

#### Comentarios desactualizados

```js
// El precio de la entrada es 20 €.
const precioEntrada = 35;
```

Un comentario incorrecto resulta más perjudicial que no incluir ningún comentario.

#### Código comentado

```js
// const precioEntrada = 20;
// const precioEntrada = 25;
// const precioEntrada = 30;
const precioEntrada = 35;
```

El código antiguo debe eliminarse. Si necesitamos recuperarlo, utilizaremos el historial del repositorio.

#### Comentarios excesivos

```js
// Si quedan entradas.
if (entradasDisponibles > 0) {
  // Muestra que hay entradas.
  console.log("Hay entradas");
}
```

El código ya expresa claramente su comportamiento.

### 12.8. Buenas prácticas

Al escribir comentarios:

- Utiliza frases breves y claras.
- Explica decisiones o reglas importantes.
- Mantén los comentarios actualizados.
- Evita repetir literalmente las instrucciones.
- Elimina el código comentado que ya no se utiliza.
- No utilices comentarios para compensar nombres poco descriptivos.
- Revisa si el código puede simplificarse antes de añadir una explicación.

### 12.9. Revisión de un programa de FestWeb

Analiza el siguiente código:

```js
let p = 35;
let c = 3;
let d = 0.2;

// Multiplica p por c.
let x = p * c;

// Calcula una cosa.
let y = x * d;

// Resta.
let z = x - y;

console.log(z);
```

!!! actividad "Actividad opcional"

    Mejora el programa anterior:

    1. Sustituye los nombres poco descriptivos.
    2. Decide qué identificadores deben declararse mediante `const`.
    3. Elimina los comentarios que repiten el código.
    4. Añade un comentario que explique por qué se aplica el descuento.
    5. Organiza el programa en datos, cálculos y resultado.
    6. Muestra un mensaje comprensible con el precio final.

    El comportamiento del programa debe mantenerse, pero su lectura debe resultar más sencilla.

!!! salto-pagina-pdf ""