---

title: UP02 · Fundamentos de JavaScript · Ámbito de las variables

---

El **ámbito** determina en qué partes del programa puede utilizarse un identificador.

Una variable puede existir en todo el archivo, únicamente dentro de un bloque o solamente dentro de una función. Intentar utilizarla fuera de su ámbito produce un error.

Comprender el ámbito permite:

- Evitar conflictos entre identificadores.
- Reducir modificaciones accidentales.
- Limitar cada dato a la parte del programa que lo necesita.
- Facilitar la lectura y el mantenimiento del código.

### 9.1. Ámbito global y ámbito de módulo

Una variable declarada fuera de cualquier bloque o función puede utilizarse desde las instrucciones posteriores del mismo archivo:

```js
const nombreEvento = "Festival Mediterránea";
let entradasVendidas = 3200;

console.log(nombreEvento);
console.log(entradasVendidas);
```

Tradicionalmente, estas variables se denominan **globales** porque están disponibles en una parte muy amplia del programa.

Sin embargo, nuestros archivos se cargan como módulos:

```html
<script type="module" src="/src/main.js"></script>
```

En un módulo, los identificadores declarados en el nivel superior pertenecen al **ámbito del módulo**. Pueden utilizarse dentro de ese archivo, pero no se incorporan automáticamente al objeto global `window`.

```js
const nombreEvento = "Festival Mediterránea";

console.log(nombreEvento);
console.log(window.nombreEvento);
```

La primera instrucción muestra el nombre del evento. La segunda muestra `undefined`.

!!! importante "Módulos"

    En nuestros proyectos hablaremos normalmente de ámbito de módulo. El concepto de ámbito global sigue siendo importante para comprender código JavaScript que no utiliza módulos.

### 9.2. Ámbito de bloque

Un bloque es un conjunto de instrucciones delimitado mediante llaves:

```js
{
  const mensaje = "Inscripción disponible";
  console.log(mensaje);
}
```

Los identificadores declarados con `let` o `const` dentro del bloque solo existen dentro de él:

```js
{
  const entradasDisponibles = 1800;
  console.log(entradasDisponibles);
}

// Error:
// console.log(entradasDisponibles);
```

El bloque puede pertenecer a una estructura condicional, un bucle o cualquier otra construcción que utilice llaves.

```js
const quedanEntradas = true;

if (quedanEntradas) {
  const mensaje = "Puedes realizar la inscripción";
  console.log(mensaje);
}

// Error:
// console.log(mensaje);
```

La constante `mensaje` solo existe dentro del bloque del `if`.

### 9.3. Ámbito de función

Los identificadores declarados dentro de una función solo pueden utilizarse dentro de ella.

```js
function mostrarResumen() {
  const mensaje = "Resumen del evento";
  console.log(mensaje);
}

mostrarResumen();

// Error:
// console.log(mensaje);
```

Aunque las funciones se estudiarán posteriormente, debemos conocer este ámbito para comprender dónde existen sus variables.

Cada ejecución de una función crea su propio ámbito:

```js
function mostrarPrecio() {
  const precioEntrada = 35;
  console.log(precioEntrada);
}

mostrarPrecio();
```

El identificador `precioEntrada` no está disponible fuera de `mostrarPrecio()`.

### 9.4. Búsqueda de identificadores

Cuando JavaScript encuentra un identificador, comienza a buscarlo en el ámbito actual. Si no lo encuentra, continúa buscando en los ámbitos exteriores.

```js
const nombreEvento = "Festival Mediterránea";

{
  const precioEntrada = 35;

  console.log(nombreEvento);
  console.log(precioEntrada);
}
```

Desde el bloque interior puede accederse a:

- `precioEntrada`, porque pertenece al propio bloque.
- `nombreEvento`, porque pertenece a un ámbito exterior.

Sin embargo, desde el ámbito exterior no podemos acceder a `precioEntrada`.

```text
Ámbito del módulo
├── nombreEvento
└── Bloque interior
    └── precioEntrada
```

### 9.5. Sombreado de variables

Un bloque interior puede declarar un identificador con el mismo nombre que otro situado en un ámbito exterior. Este comportamiento se denomina **sombreado**.

```js
const estado = "Inscripción abierta";

{
  const estado = "Entradas agotadas";
  console.log(estado);
}

console.log(estado);
```

!!! salto-pagina-pdf ""

El resultado será:

```text
Entradas agotadas
Inscripción abierta
```

Dentro del bloque se utiliza la variable más cercana. Al salir del bloque, vuelve a estar disponible la variable exterior.

Aunque el sombreado es válido, puede dificultar la comprensión del código. Utilizaremos nombres diferentes cuando representen conceptos distintos.

### 9.6. Diferencias entre `let`, `const` y `var`

`let` y `const` tienen ámbito de bloque:

```js
{
  let cantidad = 3;
  const precio = 35;
}

// Error:
// console.log(cantidad);
// console.log(precio);
```

`var` no tiene ámbito de bloque, sino ámbito de función:

```js
{
  var mensaje = "Evento disponible";
}

console.log(mensaje);
```

La variable continúa disponible fuera del bloque.

Esta diferencia puede provocar que un valor exista en más lugares de los esperados. Por ello, en el código nuevo utilizaremos `let` y `const`.

| Declaración { .table-main-column .table-bg-principal .table-cl-secundario } | Ámbito { .table-content .table-bg-principal .table-cl-secundario } | Reasignación { .table-content .table-bg-principal .table-cl-secundario } | Redeclaración en el mismo ámbito { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|:---:|:---:|
| `const` | Bloque | No | No |
| `let` | Bloque | Sí | No |
| `var` | Función | Sí | Sí |

### 9.7. Acceso antes de la declaración

El orden en el que escribimos las declaraciones es importante.

```js
console.log(nombreEvento);

const nombreEvento = "Festival Mediterránea";
```

Este código produce un error porque intentamos acceder al identificador antes de inicializarlo.

Con `var`, el comportamiento es diferente:

```js
console.log(nombreEvento);

var nombreEvento = "Festival Mediterránea";
```

La consola muestra `undefined` en lugar de producir el mismo error.

Este comportamiento está relacionado con el **hoisting**, mediante el cual JavaScript procesa determinadas declaraciones antes de ejecutar las instrucciones.

No utilizaremos esta característica de forma intencionada. Declararemos cada identificador antes de usarlo.

### 9.8. Zona temporal muerta

Los identificadores declarados mediante `let` y `const` no pueden utilizarse desde el inicio de su ámbito hasta que se ejecuta su declaración.

```js
{
  // No puede utilizarse todavía.
  // console.log(precioEntrada);

  const precioEntrada = 35;

  console.log(precioEntrada);
}
```

Este periodo se denomina **zona temporal muerta**.

No es necesario memorizar su funcionamiento interno. La regla práctica es sencilla:

!!! importante "Regla práctica"

    Declara las variables y constantes antes de utilizarlas y lo más cerca posible del lugar donde sean necesarias.

!!! salto-pagina-pdf ""

### 9.9. Elección del ámbito adecuado

Debemos utilizar el ámbito más reducido que permita resolver el problema.

```js
const nombreEvento = "Festival Mediterránea";

{
  const precioEntrada = 35;
  const cantidad = 3;
  const total = precioEntrada * cantidad;

  console.log(total);
}
```

Si `precioEntrada`, `cantidad` y `total` solo se necesitan para ese cálculo, no es necesario mantenerlos disponibles en el resto del programa.

Ventajas de reducir el ámbito:

- Disminuye la posibilidad de modificar accidentalmente un valor.
- Evita conflictos entre identificadores.
- Facilita la localización de los datos.
- Reduce las dependencias entre partes del programa.

### 9.10. Errores frecuentes

#### Utilizar una variable fuera de su bloque

```js
{
  const descuento = 10;
}

// Error:
// console.log(descuento);
```

#### Utilizar una variable antes de declararla

```js
// Error:
// console.log(aforoTotal);

const aforoTotal = 5000;
```

!!! salto-pagina-pdf ""

#### Crear variables globales innecesarias

```js
let subtotal;
let descuento;
let importeFinal;
```

Si estos valores solo se necesitan en una operación concreta, deberían declararse dentro del bloque correspondiente.

#### Utilizar `var` esperando ámbito de bloque

```js
{
  var entradasDisponibles = 1800;
}

console.log(entradasDisponibles);
```

El identificador sigue existiendo fuera del bloque.

#### Reutilizar nombres sin necesidad

```js
const estado = "Inscripción abierta";

{
  const estado = "Evento destacado";
}
```

Aunque el código es válido, el mismo nombre representa informaciones diferentes.

### 9.11. Análisis de ámbitos en FestWeb

Vamos a construir y analizar un pequeño programa con varios niveles de ámbito.

#### Situación

FestWeb dispone de los siguientes datos generales:

- Nombre del evento: **Festival Mediterránea**.
- Aforo total: **5000 personas**.
- Entradas vendidas: **3200**.

Dentro de un bloque dedicado a calcular una compra se utilizarán:

- Cantidad solicitada: **3 entradas**.
- Precio por entrada: **35 €**.
- Importe total de la compra.

!!! salto-pagina-pdf ""

El programa deberá:

1. Mostrar el nombre del evento antes del bloque.
2. Calcular el importe dentro del bloque.
3. Acceder desde el bloque a los datos generales.
4. Mostrar dentro del bloque el importe de la compra.
5. Comprobar qué identificadores dejan de existir al finalizar el bloque.
6. Crear deliberadamente un caso de sombreado y observar su resultado.
7. Comparar el comportamiento de `let` con el de `var`.

#### Resultado esperado dentro del bloque

```text
Evento: Festival Mediterránea
Aforo total: 5000
Entradas vendidas: 3200
Cantidad solicitada: 3
Importe de la compra: 105 €
```

!!! reto "Live coding"

    Durante el desarrollo identificaremos:

    1. Qué datos deben pertenecer al ámbito del módulo.
    2. Qué datos solamente son necesarios dentro del bloque.
    3. Qué ocurre al acceder a un identificador fuera de su ámbito.
    4. Cómo funciona la búsqueda desde un ámbito interior.
    5. Qué diferencia se produce al sustituir `let` por `var`.
    6. Por qué conviene evitar el sombreado innecesario.

!!! actividad "Actividad opcional"

    Analiza el siguiente código sin ejecutarlo:

    ```js
    const categoria = "Música";
    let entradasVendidas = 3200;

    {
      const precioEntrada = 35;
      let cantidad = 3;
      const categoria = "Festival";

      entradasVendidas += cantidad;

      console.log(categoria);
      console.log(precioEntrada);
      console.log(entradasVendidas);
    }

    console.log(categoria);
    console.log(entradasVendidas);
    ```

    Responde:

    1. ¿Qué identificadores pertenecen al ámbito exterior?
    2. ¿Qué identificadores pertenecen al bloque?
    3. ¿Qué valor se muestra para `categoria` dentro del bloque?
    4. ¿Qué valor se muestra para `categoria` fuera del bloque?
    5. ¿Cuál es el valor final de `entradasVendidas`?
    6. ¿Podría utilizarse `precioEntrada` después del bloque?

!!! salto-pagina-pdf ""