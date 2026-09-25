---

title: UP02 · Fundamentos de JavaScript · Primer programa

---

Un programa está formado por un conjunto ordenado de instrucciones. Cada instrucción indica una operación que debe realizar el motor de JavaScript: almacenar un dato, efectuar un cálculo, mostrar un resultado o tomar una decisión.

Comenzaremos escribiendo programas pequeños y observando su ejecución desde la consola del navegador.

### 4.1. Archivo principal de JavaScript

En los proyectos de FestWeb, el código inicial se escribirá en el archivo `src/main.js`.

La estructura básica del proyecto será:

```text
festweb/
├── index.html
├── package.json
└── src/
    └── main.js
```

El documento HTML cargará el archivo mediante una etiqueta `script`:

```html
<script type="module" src="/src/main.js"></script>
```

El atributo `type="module"` permite utilizar módulos JavaScript y hace que el código se ejecute automáticamente en modo estricto.

Cuando trabajemos con Vite, iniciaremos el servidor de desarrollo desde el terminal:

```bash
npm run dev
```

Después abriremos en el navegador la dirección proporcionada por Vite.

### 4.2. Instrucciones

Cada instrucción realiza una operación concreta:

```js
const nombreEvento = "Festival Mediterránea";
const precioEntrada = 35;

console.log(nombreEvento);
console.log(precioEntrada);
```

!!! salto-pagina-pdf ""

En este ejemplo se ejecutan cuatro instrucciones:

1. Se almacena el nombre del evento.
2. Se almacena el precio de la entrada.
3. Se muestra el nombre.
4. Se muestra el precio.

JavaScript permite omitir el punto y coma al final de muchas instrucciones porque puede insertarlo automáticamente. Sin embargo, durante el curso lo utilizaremos para mantener un estilo de escritura uniforme:

```js
const categoria = "Música";
console.log(categoria);
```

### 4.3. JavaScript distingue entre mayúsculas y minúsculas

JavaScript es sensible a las mayúsculas y minúsculas. Por tanto, los siguientes identificadores representan variables diferentes:

```js
const precio = 25;
const Precio = 40;

console.log(precio);
console.log(Precio);
```

También debemos respetar exactamente los nombres de las funciones y propiedades:

```js
console.log("Correcto");
// Console.log("Incorrecto");
```

En el segundo caso, `Console` no existe porque el objeto correcto se llama `console`.

!!! importante "Importante"

    Los identificadores `precioEntrada`, `PrecioEntrada` y `precioentrada` son diferentes para JavaScript.

### 4.4. Mostrar información en la consola

La consola permite mostrar información durante la ejecución del programa. Es especialmente útil para comprobar valores y localizar errores.

El método más utilizado es `console.log()`:

```js
console.log("FestWeb se ha iniciado correctamente");
```

!!! salto-pagina-pdf ""

También podemos utilizar otros métodos:

```js
console.info("Información del evento cargada");
console.warn("Quedan pocas entradas");
console.error("No se ha podido completar la inscripción");
```

Cada método representa un tipo de mensaje diferente:

| Método { .table-main-column .table-bg-principal .table-cl-secundario } | Utilidad { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|
| `console.log()` | Muestra valores o mensajes generales. |
| `console.info()` | Muestra información sobre la ejecución. |
| `console.warn()` | Advierte de una situación que requiere atención. |
| `console.error()` | Muestra un mensaje asociado a un error. |

Estos métodos no muestran información dentro de la página. Los mensajes aparecen en la consola de las herramientas de desarrollo.

### 4.5. Mostrar texto y valores

Podemos pasar varios valores a `console.log()` separándolos mediante comas:

```js
const nombreEvento = "Festival Mediterránea";
const precioEntrada = 35;

console.log("Evento:", nombreEvento);
console.log("Precio:", precioEntrada, "euros");
```

También podemos utilizar una plantilla literal para insertar valores dentro de un texto:

```js
console.log(`La entrada para ${nombreEvento} cuesta ${precioEntrada} €`);
```

Las plantillas literales se escriben entre acentos graves y permiten incluir expresiones mediante `${}`.

```js
const cantidad = 3;

console.log(
  `${cantidad} entradas cuestan ${precioEntrada * cantidad} €`
);
```
### 4.6. Primer programa de FestWeb

Vamos a desarrollar conjuntamente el primer programa de FestWeb mediante *live coding*.

El programa representará la situación actual de un evento y calculará algunos datos básicos.

#### Datos disponibles

El evento presenta las siguientes características:

- Nombre: **Festival Mediterránea**.
- Categoría: **Música**.
- Precio de cada entrada: **35 €**.
- Aforo total: **5000 personas**.
- Entradas vendidas: **3200 entradas**.

#### Operaciones necesarias

El programa deberá:

1. Almacenar cada dato utilizando un identificador descriptivo.
2. Calcular el número de entradas que todavía están disponibles.
3. Calcular la recaudación obtenida hasta el momento.
4. Mostrar un encabezado con el texto `Resumen del evento`.
5. Mostrar el nombre y la categoría del evento.
6. Mostrar las entradas disponibles.
7. Mostrar la recaudación actual.
8. Utilizar plantillas literales para construir los mensajes.

#### Resultado esperado

La consola deberá mostrar:

```text
Resumen del evento
Nombre: Festival Mediterránea
Categoría: Música
Entradas disponibles: 1800
Recaudación actual: 112000 €
```

!!! pregunta "Antes de programar"

    Antes de escribir el código, responde:

    1. ¿Qué datos deben almacenarse?
    2. ¿Qué identificador utilizarías para cada dato?
    3. ¿Qué datos pueden cambiar durante la ejecución?
    4. ¿Qué operación permite calcular las entradas disponibles?
    5. ¿Qué operación permite calcular la recaudación?
    6. ¿En qué orden deberían escribirse las instrucciones?

!!! reto "Live coding"

    Construiremos el programa paso a paso, comprobaremos cada resultado en la consola y corregiremos conjuntamente los errores que aparezcan.

### 4.7. Primeros errores

Durante la programación es normal cometer errores. La consola muestra información que nos ayuda a localizar su causa.

#### Error de sintaxis

Se produce cuando el código no respeta la sintaxis del lenguaje:

```js
const nombreEvento = "Festival Mediterránea;
```

La cadena de texto no se ha cerrado correctamente.

#### Error de referencia

Se produce cuando intentamos utilizar un identificador que no existe:

```js
const precioEntrada = 35;

console.log(precioEntrda);
```

La variable declarada se llama `precioEntrada`, pero se ha escrito `precioEntrda`.

!!! salto-pagina-pdf ""

#### Error lógico

El programa se ejecuta, pero produce un resultado incorrecto:

```js
const precioEntrada = 35;
const cantidad = 3;

const total = precioEntrada + cantidad;

console.log(total);
```

El programa muestra `38`, aunque el precio de tres entradas debería calcularse mediante una multiplicación.


### 4.8. Procedimiento básico de comprobación

Cuando un programa no funcione correctamente:

1. Abriremos la consola del navegador.
2. Leeremos el mensaje de error completo.
3. Localizaremos el archivo y la línea indicados.
4. Revisaremos la instrucción correspondiente.
5. Mostraremos los valores implicados mediante `console.log()`.
6. Corregiremos el código.
7. Volveremos a ejecutar y comprobar el programa.

!!! actividad "Actividad opcional"

    Crea un archivo `main.js` que almacene los siguientes datos:

    - Nombre de un evento.
    - Lugar de celebración.
    - Precio de una entrada.
    - Número de entradas compradas.
    - Gastos de gestión por entrada.

    Calcula y muestra:

    1. El precio de las entradas.
    2. Los gastos de gestión totales.
    3. El importe final de la compra.
    4. Un resumen completo utilizando una plantilla literal.

    Introduce después deliberadamente un error de sintaxis, uno de referencia y uno lógico. Observa qué sucede en cada caso.
