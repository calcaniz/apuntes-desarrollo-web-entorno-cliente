---

title: UP02 · Fundamentos de JavaScript · Tipos de datos

---

## 6. Tipos de datos

Los valores utilizados por un programa pueden representar textos, números, respuestas lógicas o la ausencia de información. El **tipo de dato** determina qué representa un valor y qué operaciones pueden realizarse con él.

JavaScript utiliza tipado dinámico: el tipo pertenece al valor almacenado y no se indica al declarar la variable.

```js
const nombreEvento = "Festival Mediterránea";
const precioEntrada = 35;
const eventoDisponible = true;
```

En este ejemplo:

- `"Festival Mediterránea"` es una cadena de texto.
- `35` es un número.
- `true` es un valor lógico.

!!! salto-pagina-pdf ""

### 6.1. Tipos primitivos

Los tipos primitivos principales de JavaScript son:

| Tipo { .table-main-column .table-bg-principal .table-cl-secundario } | Ejemplo { .table-content .table-bg-principal .table-cl-secundario } | Utilidad { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|---|
| `string` | `"Música"` | Representa texto. |
| `number` | `35` | Representa números enteros y decimales. |
| `boolean` | `true` | Representa un valor verdadero o falso. |
| `undefined` | `undefined` | Indica que todavía no se ha asignado un valor. |
| `null` | `null` | Representa intencionadamente la ausencia de un valor. |
| `bigint` | `123n` | Representa números enteros muy grandes. |
| `symbol` | `Symbol()` | Crea identificadores únicos. |

Durante esta unidad utilizaremos principalmente `string`, `number`, `boolean`, `undefined` y `null`.

!!! salto-pagina-pdf ""


### 6.2. Cadenas de texto

El tipo `string` permite almacenar texto. Las cadenas pueden escribirse utilizando comillas dobles, comillas simples o acentos graves.

```js
const nombreEvento = "Festival Mediterránea";
const categoria = 'Música';
const localidad = `Valencia`;
```

Utilizaremos preferentemente un mismo estilo de comillas en todo el proyecto.

Si una cadena contiene el mismo tipo de comilla utilizado para delimitarla, podemos utilizar el carácter de escape `\`:

```js
const mensaje = "El evento se llama \"Festival Mediterránea\"";
```

También podemos combinar distintos tipos de comillas:

```js
const mensaje = 'El evento se llama "Festival Mediterránea"';
```

#### Plantillas literales

Las cadenas delimitadas mediante acentos graves se denominan **plantillas literales**. Permiten insertar variables y expresiones mediante `${}`:

```js
const nombreEvento = "Festival Mediterránea";
const precioEntrada = 35;

console.log(`La entrada para ${nombreEvento} cuesta ${precioEntrada} €`);
```

También permiten conservar saltos de línea:

```js
const resumen = `Festival Mediterránea
Categoría: Música
Precio: 35 €`;

console.log(resumen);
```

#### Propiedad `length`

La propiedad `length` permite conocer el número de caracteres de una cadena:

```js
const nombreEvento = "Festival Mediterránea";

console.log(nombreEvento.length);
```

Los métodos específicos para trabajar con cadenas se estudiarán con los objetos predefinidos del lenguaje.

### 6.3. Números

JavaScript utiliza principalmente el tipo `number` para representar tanto números enteros como decimales:

```js
const aforoTotal = 5000;
const precioEntrada = 35.5;
const descuento = 0.15;
```

Los valores decimales se escriben utilizando un punto:

```js
const precio = 24.95;
```

Aunque en español solemos utilizar una coma decimal, escribir `24,95` no representa el número decimal esperado en JavaScript.

El tipo `number` permite realizar operaciones aritméticas:

```js
const precioEntrada = 35;
const cantidad = 3;
const total = precioEntrada * cantidad;

console.log(total);
```

#### Valores numéricos especiales

JavaScript dispone de algunos valores numéricos especiales:

```js
console.log(10 / 0);          // Infinity
console.log(-10 / 0);         // -Infinity
console.log("FestWeb" * 2);   // NaN
```

`NaN` significa *Not a Number* y representa el resultado de una operación numérica que no puede producir un número válido.

Aunque su nombre indique lo contrario, JavaScript considera que `NaN` pertenece al tipo `number`:

```js
console.log(typeof NaN);
```

Los valores `Infinity`, `-Infinity` y `NaN` se estudiarán con más detalle al trabajar las conversiones de tipos.

### 6.4. Valores lógicos

El tipo `boolean` únicamente puede contener dos valores:

```js
const eventoDisponible = true;
const entradasAgotadas = false;
```

Los valores lógicos permiten representar situaciones con dos estados:

- Disponible o no disponible.
- Inscripción abierta o cerrada.
- Evento destacado o no destacado.
- Mayor o menor de edad.
- Operación correcta o incorrecta.

También se obtienen como resultado de comparaciones:

```js
const entradasVendidas = 3200;
const aforoTotal = 5000;

const quedanEntradas = entradasVendidas < aforoTotal;

console.log(quedanEntradas);
```

Las expresiones lógicas se utilizarán posteriormente para construir estructuras condicionales.

### 6.5. El valor `undefined`

Una variable declarada sin un valor inicial contiene automáticamente `undefined`:

```js
let fechaEvento;

console.log(fechaEvento);
```

`undefined` suele indicar que el programa todavía no ha proporcionado un valor.

```js
console.log(typeof fechaEvento);
```

Siempre que sea posible, inicializaremos las variables al declararlas para evitar estados imprevistos.

### 6.6. El valor `null`

`null` representa la ausencia intencionada de un valor.

```js
const fechaCancelacion = null;
```

En este ejemplo, hemos indicado expresamente que el evento no tiene una fecha de cancelación.

La diferencia conceptual es:

- `undefined`: todavía no existe un valor asignado.
- `null`: se ha asignado expresamente la ausencia de valor.

```js
let patrocinador;
const fechaCancelacion = null;

console.log(patrocinador);
console.log(fechaCancelacion);
```

Por una peculiaridad histórica de JavaScript, `typeof null` devuelve `"object"`:

```js
console.log(typeof null);
```

Esto no significa que `null` sea realmente un objeto. Debemos recordar esta particularidad al comprobar tipos.

### 6.7. Los tipos `bigint` y `symbol`

`bigint` permite representar números enteros que superan el rango seguro del tipo `number`. Se escribe añadiendo `n` al final:

```js
const identificadorMuyGrande = 9007199254740993n;
```

`symbol` permite crear valores únicos:

```js
const identificador = Symbol("evento");
```

Estos tipos forman parte de JavaScript, pero no serán necesarios para las primeras funcionalidades de FestWeb.

### 6.8. El operador `typeof`

El operador `typeof` permite consultar el tipo de un valor:

```js
console.log(typeof "Festival Mediterránea");
console.log(typeof 35);
console.log(typeof true);
console.log(typeof undefined);
```

También puede aplicarse a variables:

```js
const nombreEvento = "Festival Mediterránea";
const precioEntrada = 35;
const disponible = true;

console.log(typeof nombreEvento);
console.log(typeof precioEntrada);
console.log(typeof disponible);
```

Los principales resultados son:

| Valor { .table-main-column .table-bg-principal .table-cl-secundario } | Resultado de `typeof` { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|
| `"FestWeb"` | `"string"` |
| `35` | `"number"` |
| `true` | `"boolean"` |
| `undefined` | `"undefined"` |
| `123n` | `"bigint"` |
| `Symbol()` | `"symbol"` |
| `null` | `"object"` |
| `NaN` | `"number"` |

!!! advertencia "Dos particularidades"

    `typeof null` devuelve `"object"` y `typeof NaN` devuelve `"number"`. Son comportamientos propios del lenguaje que debemos conocer.

### 6.9. Cambio dinámico de tipo

Una variable declarada con `let` puede almacenar valores de tipos diferentes durante su ejecución:

```js
let dato = "Festival Mediterránea";
console.log(typeof dato);

dato = 35;
console.log(typeof dato);

dato = true;
console.log(typeof dato);
```

Esta posibilidad se denomina **tipado dinámico**.

Aunque el lenguaje lo permite, no es recomendable utilizar una misma variable para representar conceptos diferentes:

```js
let precioEntrada = 35;

// Debe evitarse:
// precioEntrada = "Festival Mediterránea";
```

Mantener un significado estable reduce los errores y mejora la legibilidad.

### 6.10. Análisis de los datos de FestWeb

Vamos a identificar los tipos adecuados para representar la información de un evento.

#### Datos disponibles

- Nombre: **Festival Mediterránea**.
- Categoría: **Música**.
- Precio de la entrada: **35,50 €**.
- Aforo total: **5000 personas**.
- Inscripción abierta: **sí**.
- Evento destacado: **no**.
- Fecha de cancelación: **no existe**.
- Patrocinador: **todavía no se conoce**.

#### Resultado esperado

El programa deberá mostrar:

```text
Festival Mediterránea: string
Música: string
35.5: number
5000: number
true: boolean
false: boolean
null: object
undefined: undefined
```

!!! reto "Live coding"

    Construiremos el programa paso a paso:

    1. Elegiremos un identificador para cada dato.
    2. Determinaremos qué valor debe almacenarse.
    3. Comprobaremos cada tipo mediante `typeof`.
    4. Analizaremos los resultados especiales de `null` y `undefined`.
    5. Revisaremos si los nombres elegidos describen correctamente la información.

!!! actividad "Actividad opcional"

    Representa mediante variables y constantes los datos de otro evento de FestWeb. Incluye, como mínimo:

    - Dos cadenas de texto.
    - Dos números.
    - Dos valores lógicos.
    - Un valor `null`.
    - Una variable sin inicializar.

    Muestra en la consola el valor y el tipo de cada dato utilizando `typeof`.

!!! salto-pagina-pdf ""
