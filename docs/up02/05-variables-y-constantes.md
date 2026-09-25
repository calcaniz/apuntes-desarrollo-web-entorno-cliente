---

title: UP02 · Fundamentos de JavaScript · Variables y constantes

---

## 5. Variables y constantes

Los programas necesitan almacenar información para poder utilizarla posteriormente. En FestWeb debemos conservar datos como el nombre de un evento, su precio, el aforo disponible o el número de entradas vendidas.

JavaScript permite almacenar estos valores mediante **variables** y **constantes**.

### 5.1. Identificador, valor y tipo

Una variable puede entenderse como un nombre asociado a un valor almacenado durante la ejecución del programa.

```js
let entradasVendidas = 3200;
```

En esta instrucción podemos distinguir:

| Elemento { .table-main-column .table-bg-principal .table-cl-secundario } | Significado { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|
| `let` | Indica que se declara una variable cuyo valor puede cambiar. |
| `entradasVendidas` | Es el identificador utilizado para acceder al dato. |
| `=` | Es el operador de asignación. |
| `3200` | Es el valor almacenado inicialmente. |

El identificador permite recuperar el valor posteriormente:

```js
let entradasVendidas = 3200;

console.log(entradasVendidas);
```

!!! salto-pagina-pdf ""


### 5.2. Declaración, inicialización y asignación

Aunque normalmente se realizan al mismo tiempo, declarar, inicializar y asignar son operaciones diferentes.

#### Declaración

Consiste en crear la variable:

```js
let entradasVendidas;
```

Mientras no se le asigne un valor, la variable contiene el valor especial `undefined`.

```js
let entradasVendidas;

console.log(entradasVendidas);
```

#### Inicialización

Consiste en proporcionar el primer valor:

```js
let entradasVendidas = 3200;
```

#### Reasignación

Consiste en sustituir el valor anterior por uno nuevo:

```js
let entradasVendidas = 3200;

entradasVendidas = 3201;
```

En la reasignación no debe volver a escribirse `let`, porque la variable ya está declarada.

```js
let entradasVendidas = 3200;

// Incorrecto: intenta declarar otra variable con el mismo nombre.
// let entradasVendidas = 3201;

entradasVendidas = 3201;
```

### 5.3. Variables declaradas con `let`

Utilizaremos `let` cuando el valor almacenado deba cambiar durante la ejecución.

```js
let entradasVendidas = 3200;

entradasVendidas = entradasVendidas + 1;

console.log(entradasVendidas);
```

En FestWeb podemos utilizar `let` para representar:

- El número de entradas vendidas.
- El número de personas inscritas.
- El importe acumulado.
- El número de intentos realizados.
- El estado temporal de una operación.

Una variable declarada con `let` puede cambiar de valor tantas veces como sea necesario.

### 5.4. Constantes declaradas con `const`

Utilizaremos `const` cuando el identificador no deba recibir un valor diferente después de su inicialización.

```js
const nombreEvento = "Festival Mediterránea";
const precioEntrada = 35;
const aforoTotal = 5000;
```

Una constante debe recibir un valor en el momento de declararse:

```js
// Incorrecto:
// const nombreEvento;
```

Tampoco puede reasignarse posteriormente:

```js
const precioEntrada = 35;

// Incorrecto:
// precioEntrada = 40;
```

Si intentamos reasignarla, JavaScript producirá un error.

!!! importante "Regla de uso"

    Utilizaremos `const` por defecto. Emplearemos `let` únicamente cuando sepamos que el valor debe cambiar durante la ejecución.

!!! salto-pagina-pdf ""

### 5.5. ¿Por qué evitamos `var`?

JavaScript también permite declarar variables mediante `var`:

```js
var entradasVendidas = 3200;
```

Esta era la forma habitual antes de la incorporación de `let` y `const`. Sin embargo, `var` presenta diferencias de ámbito y permite determinadas redeclaraciones que pueden provocar errores difíciles de detectar.

Durante el curso utilizaremos:

- `const` para identificadores que no se reasignan.
- `let` para valores que necesitan cambiar.
- Evitaremos `var` en el código nuevo.

Las diferencias de ámbito se estudiarán en un apartado posterior.

### 5.6. Nombres de variables

Los identificadores deben describir claramente la información almacenada.

```js
const nombreEvento = "Festival Mediterránea";
const precioEntrada = 35;
let entradasVendidas = 3200;
```

Para nombrar variables y constantes seguiremos la convención **camelCase**:

```js
const fechaCelebracion = "18 de septiembre";
const requiereMayoriaEdad = false;
const numeroMaximoEntradas = 5;
```

En `camelCase`:

- La primera palabra comienza en minúscula.
- Las palabras siguientes comienzan en mayúscula.
- No se utilizan espacios entre las palabras.

#### Reglas de los identificadores

Un identificador:

- Puede contener letras, números, `_` y `$`.
- No puede comenzar por un número.
- No puede contener espacios.
- No puede utilizar una palabra reservada del lenguaje.
- Distingue entre mayúsculas y minúsculas.

```js
const evento1 = "Festival Mediterránea";
const eventoDestacado = true;
const precio_entrada = 35;
```

Ejemplos incorrectos:

```js
// const 1evento = "Festival";
// const precio entrada = 35;
// const const = "Música";
```

Aunque `_` y `$` están permitidos, utilizaremos nombres en `camelCase` siempre que sea posible.

### 5.7. Nombres descriptivos

Un nombre adecuado debe permitir comprender el dato sin tener que buscar explicaciones adicionales.

```js
const p = 35;
const x = 5000;
```

Los nombres anteriores son válidos, pero no explican qué representan. Es preferible escribir:

```js
const precioEntrada = 35;
const aforoTotal = 5000;
```

Evitaremos:

- Letras aisladas sin significado.
- Abreviaturas difíciles de interpretar.
- Nombres excesivamente genéricos.
- Nombres que no coincidan con el contenido.
- Mezclar idiomas dentro del mismo proyecto.

!!! ejemplo "Nombres adecuados"

    Es preferible utilizar `entradasDisponibles` frente a `ed`, `numeroEntradasQueTodaviaQuedanDisponiblesParaElEvento` o `availableEntradas`.

!!! salto-pagina-pdf ""

### 5.8. Tipado dinámico

JavaScript determina el tipo a partir del valor asignado. Una variable declarada con `let` puede recibir posteriormente un valor de otro tipo:

```js
let datoEvento = "Festival Mediterránea";
datoEvento = 35;
datoEvento = true;
```

Aunque JavaScript lo permite, cambiar el significado y el tipo de una variable puede dificultar la lectura del programa.

Es preferible que cada identificador mantenga una responsabilidad clara:

```js
const nombreEvento = "Festival Mediterránea";
const precioEntrada = 35;
const eventoDisponible = true;
```

### 5.9. Errores frecuentes

#### Utilizar una variable no declarada

```js
console.log(precioEntrada);
```

Si `precioEntrada` no ha sido declarada previamente, se producirá un error de referencia.

#### Reasignar una constante

```js
const aforoTotal = 5000;

// Error:
// aforoTotal = 6000;
```

#### Declarar dos veces la misma variable

```js
let entradasVendidas = 3200;

// Error:
// let entradasVendidas = 3500;
```

#### Confundir mayúsculas y minúsculas

```js
const nombreEvento = "Festival Mediterránea";

// Error:
// console.log(nombreevento);
```

!!! salto-pagina-pdf ""

#### Utilizar un nombre poco representativo

```js
let x = 3200;
```

El programa puede funcionar, pero será más difícil de comprender y mantener.

### 5.10. Primer modelo de un evento

Para representar provisionalmente un evento utilizaremos una variable o constante para cada dato.

#### Premisas

El evento presenta la siguiente información:

- Nombre: **Festival Mediterránea**.
- Categoría: **Música**.
- Lugar: **Parc Central**.
- Precio de la entrada: **35 €**.
- Aforo total: **5000 personas**.
- Entradas vendidas inicialmente: **3200**.
- Es un evento destacado.
- No requiere mayoría de edad.

Durante la ejecución se venden tres entradas adicionales.

#### Resultado esperado

La consola debe mostrar:

```text
Festival Mediterránea
Categoría: Música
Lugar: Parc Central
Precio: 35 €
Aforo: 5000
Entradas vendidas: 3203
Evento destacado: true
Requiere mayoría de edad: false
```

!!! reto "Live coding"

    Construiremos el programa teniendo en cuenta:

    1. Qué identificador representa cada dato.
    2. Qué valores deben declararse mediante `const`.
    3. Qué valor necesita declararse mediante `let`.
    4. Cómo se actualiza el número de entradas vendidas.
    5. Cómo se muestran los resultados en la consola.

!!! actividad "Actividad opcional"

    Diseña las variables y constantes necesarias para representar otro evento de FestWeb. Debe contener, como mínimo:

    - Nombre.
    - Categoría.
    - Localidad.
    - Precio.
    - Aforo.
    - Entradas vendidas.
    - Disponibilidad.
    - Necesidad de inscripción previa.

    Utiliza nombres descriptivos y decide justificadamente cuándo emplear `const` y cuándo emplear `let`.

!!! salto-pagina-pdf ""