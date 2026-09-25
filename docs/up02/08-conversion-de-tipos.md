---

title: UP02 · Fundamentos de JavaScript · Conversión de tipos

---

JavaScript puede transformar un valor de un tipo de dato a otro. Esta transformación se denomina **conversión de tipos**.

Las conversiones son especialmente importantes cuando los datos proceden de formularios, ventanas de entrada o servicios externos, porque con frecuencia se reciben como cadenas de texto.

Por ejemplo, aunque una persona escriba `4` en una ventana de entrada, JavaScript recibe el valor como la cadena `"4"`.

### 8.1. Conversión implícita y explícita

JavaScript puede realizar conversiones de dos formas:

- **Conversión implícita:** el lenguaje transforma automáticamente un valor.
- **Conversión explícita:** indicamos directamente qué conversión debe realizarse.

#### Conversión implícita

```js
console.log("20" + 5);
console.log("20" - 5);
console.log("20" * 5);
```

Los resultados son diferentes:

```text
205
15
100
```

Con el operador `+`, la presencia de una cadena provoca una concatenación. En la resta y la multiplicación, JavaScript intenta convertir la cadena en número.

Este comportamiento se denomina **coerción de tipos**.

#### Conversión explícita

Podemos indicar claramente la conversión que queremos realizar:

```js
const cantidadTexto = "4";
const cantidad = Number(cantidadTexto);

console.log(cantidad + 1);
```

El resultado es `5` porque `"4"` se ha convertido en el número `4`.

!!! importante "Recomendación"

    Evitaremos depender de conversiones implícitas. Siempre que sea posible, realizaremos conversiones explícitas para que la intención del código sea clara.

### 8.2. Conversión a número

La función `Number()` transforma un valor en un número cuando la conversión es posible.

```js
console.log(Number("35"));
console.log(Number("35.5"));
console.log(Number(true));
console.log(Number(false));
```

Algunas conversiones producen resultados que debemos conocer:

| Expresión { .table-main-column .table-bg-principal .table-cl-secundario } | Resultado { .table-content .table-bg-principal .table-cl-secundario } | Explicación { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|---|
| `Number("35")` | `35` | Cadena numérica válida. |
| `Number("35.5")` | `35.5` | Cadena decimal válida. |
| `Number("")` | `0` | La cadena vacía se convierte en cero. |
| `Number("   ")` | `0` | Una cadena con espacios se convierte en cero. |
| `Number(true)` | `1` | `true` se convierte en uno. |
| `Number(false)` | `0` | `false` se convierte en cero. |
| `Number(null)` | `0` | `null` se convierte en cero. |
| `Number(undefined)` | `NaN` | No puede obtenerse un número válido. |
| `Number("FestWeb")` | `NaN` | La cadena no representa un número. |

Estas peculiaridades explican por qué debemos comprobar los datos antes de utilizarlos.

### 8.3. `parseInt()` y `parseFloat()`

JavaScript también proporciona funciones para extraer números desde el comienzo de una cadena.

#### `parseInt()`

`parseInt()` obtiene un número entero:

```js
console.log(parseInt("35", 10));
console.log(parseInt("35.75", 10));
console.log(parseInt("35 entradas", 10));
```

Resultados:

```text
35
35
35
```

El segundo argumento indica la base numérica. Para números decimales utilizaremos la base `10`.

#### `parseFloat()`

`parseFloat()` conserva la parte decimal:

```js
console.log(parseFloat("35.75"));
console.log(parseFloat("35.75 €"));
```

Resultados:

```text
35.75
35.75
```

#### Diferencia respecto a `Number()`

```js
console.log(Number("35.75 €"));
console.log(parseFloat("35.75 €"));
```

Resultados:

```text
NaN
35.75
```

`Number()` exige que la cadena completa represente un número válido. `parseInt()` y `parseFloat()` intentan extraer un número desde el comienzo de la cadena.

!!! advertencia "No ocultan una validación incorrecta"

    Que `parseFloat("35.75 €")` devuelva un número no significa que cualquier texto deba considerarse válido. La aplicación debe decidir qué formato acepta y comprobar los datos recibidos.

### 8.4. El valor `NaN`

`NaN` significa *Not a Number*. Aparece cuando una operación numérica no puede producir un número válido:

```js
const precio = Number("FestWeb");

console.log(precio);
```

Para comprobar si un valor es `NaN` utilizaremos `Number.isNaN()`:

```js
const precio = Number("FestWeb");

console.log(Number.isNaN(precio));
```

No debemos comprobarlo mediante una igualdad:

```js
const precio = Number("FestWeb");

console.log(precio === NaN);
```

La comparación anterior devuelve `false`, porque `NaN` no es igual ni siquiera a sí mismo.

```js
console.log(NaN === NaN);
```

Utilizaremos:

```js
Number.isNaN(precio);
```

La función global `isNaN()` realiza conversiones antes de comprobar el valor, por lo que puede producir resultados menos claros. Preferiremos `Number.isNaN()`.

!!! salto-pagina-pdf ""

### 8.5. Conversión a cadena

La función `String()` transforma un valor en texto:

```js
console.log(String(35));
console.log(String(true));
console.log(String(null));
console.log(String(undefined));
```

Resultados:

```text
35
true
null
undefined
```

Aunque la consola muestre caracteres similares, el tipo ha cambiado:

```js
const precioNumerico = 35;
const precioTexto = String(precioNumerico);

console.log(typeof precioNumerico);
console.log(typeof precioTexto);
```

También puede producirse una conversión implícita al concatenar:

```js
const precio = 35;
const mensaje = "Precio: " + precio;

console.log(mensaje);
```

Sin embargo, para construir mensajes utilizaremos preferentemente plantillas literales:

```js
const precio = 35;

console.log(`Precio: ${precio} €`);
```

!!! salto-pagina-pdf ""

### 8.6. Conversión a valor lógico

La función `Boolean()` transforma un valor en `true` o `false`:

```js
console.log(Boolean(1));
console.log(Boolean(0));
console.log(Boolean("FestWeb"));
console.log(Boolean(""));
```

Se consideran **falsy** los valores que se convierten en `false`:

- `false`
- `0`
- `-0`
- `0n`
- `""`
- `null`
- `undefined`
- `NaN`

El resto de valores se consideran generalmente **truthy** y se convierten en `true`.

```js
console.log(Boolean("false"));
```

El resultado es `true`, porque `"false"` es una cadena que contiene caracteres. No es el valor lógico `false`.

!!! advertencia "Texto y valor lógico"

    Las cadenas `"true"` y `"false"` son textos. Ambas se convierten en `true` porque no están vacías.

Los valores *truthy* y *falsy* se utilizarán posteriormente en las estructuras condicionales.

!!! salto-pagina-pdf ""

### 8.7. Datos introducidos mediante `prompt()`

La función `prompt()` muestra una ventana que permite introducir información:

```js
const cantidadIntroducida = prompt(
  "¿Cuántas entradas quieres comprar?"
);

console.log(cantidadIntroducida);
console.log(typeof cantidadIntroducida);
```

El valor introducido se obtiene como una cadena de texto:

```text
"4"
```

Para utilizarlo en un cálculo debemos convertirlo:

```js
const cantidadIntroducida = prompt(
  "¿Cuántas entradas quieres comprar?"
);

const cantidad = Number(cantidadIntroducida);

console.log(cantidad);
console.log(typeof cantidad);
```

Si la persona pulsa **Cancelar**, `prompt()` devuelve `null`.

```js
const respuesta = prompt("Introduce el nombre del evento");

console.log(respuesta);
```

Por tanto, debemos distinguir entre:

- Una cadena introducida por la persona.
- Una cadena vacía.
- El valor `null` producido al cancelar.
- Un valor que no puede convertirse correctamente.

La validación completa se realizará cuando estudiemos las estructuras condicionales.

!!! salto-pagina-pdf ""

### 8.8. Precisión de los números decimales

Los números decimales se representan internamente en formato binario. Algunos valores no pueden almacenarse de forma exacta:

```js
console.log(0.1 + 0.2);
```

El resultado puede ser:

```text
0.30000000000000004
```

Esto no es un error específico de JavaScript, sino una consecuencia de la representación utilizada por numerosos lenguajes.

Para limitar los decimales mostrados podemos utilizar `toFixed()`:

```js
const resultado = 0.1 + 0.2;

console.log(resultado.toFixed(2));
```

El resultado mostrado será:

```text
0.30
```

Debemos tener en cuenta que `toFixed()` devuelve una cadena:

```js
const resultadoFormateado = resultado.toFixed(2);

console.log(typeof resultadoFormateado);
```

Por tanto, resulta útil para presentar información, pero debemos evitar utilizar directamente su resultado en nuevos cálculos sin valorar la conversión necesaria.

### 8.9. Conversión de los datos de una compra

Vamos a procesar los datos recibidos durante una compra de entradas.

#### Datos recibidos

La aplicación recibe inicialmente los siguientes valores como texto:

- Precio de cada entrada: `"35.50"`.
- Cantidad solicitada: `"4"`.
- Gastos de gestión por entrada: `"2.50"`.
- Descuento: `"10"`.
- Inscripción urgente: `"false"`.

#### Operaciones necesarias

El programa deberá:

1. Mostrar el tipo inicial de cada valor.
2. Convertir el precio y los gastos de gestión a números decimales.
3. Convertir la cantidad a un número entero.
4. Convertir el porcentaje de descuento a número.
5. Analizar qué sucede al convertir `"false"` mediante `Boolean()`.
6. Calcular el subtotal.
7. Calcular los gastos totales.
8. Calcular el descuento.
9. Mostrar el precio final con dos decimales.
10. Comprobar que las conversiones numéricas no producen `NaN`.

#### Resultado esperado

```text
Tipo inicial del precio: string
Tipo inicial de la cantidad: string
Precio convertido: 35.5
Cantidad convertida: 4
Gastos de gestión: 2.5
Descuento: 10
Boolean("false"): true
Subtotal: 142 €
Gastos totales: 10 €
Descuento aplicado: 14.2 €
Precio final: 137.80 €
```

!!! reto "Live coding"

    Construiremos el programa prestando especial atención a:

    1. La diferencia entre los datos originales y los convertidos.
    2. La elección entre `Number()`, `parseInt()` y `parseFloat()`.
    3. La comprobación mediante `Number.isNaN()`.
    4. El comportamiento de `Boolean("false")`.
    5. El tipo devuelto por `toFixed()`.

!!! actividad "Actividad opcional"

    Predice el valor y el tipo producido por cada expresión antes de ejecutarla:

    ```js
    Number("25")
    Number("25 €")
    parseInt("25.75", 10)
    parseFloat("25.75 €")
    String(false)
    Boolean("false")
    Boolean("")
    Boolean(0)
    Number(null)
    Number(undefined)
    "10" + 5
    "10" - 5
    ```

    Comprueba después tus respuestas desde la consola y explica los resultados que no coincidan con tu predicción.

!!! salto-pagina-pdf ""