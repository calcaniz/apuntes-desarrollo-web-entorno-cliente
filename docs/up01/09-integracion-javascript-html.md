
Para que el navegador ejecute código JavaScript, este debe vincularse con un documento HTML. La integración se realiza mediante el elemento `<script>`, que permite incorporar código ejecutable. Cuando el navegador encuentra este elemento, entrega su contenido al motor JavaScript para que lo procese.

```html
<script>
  console.log("FestWeb se ha cargado");
</script>
```

Existen dos modalidades para incorporar JavaScript:

- **JavaScript interno:** el código se escribe entre las etiquetas de apertura y cierre. Se utiliza para pruebas rápidas, demostraciones y ejemplos muy breves, pero resulta difícil de reutilizar y se mezcla con la estructura HTML.

    ```html
    <script>
      const nombreAplicacion = "FestWeb";
      console.log(nombreAplicacion);
    </script>
    ```

- **JavaScript externo:** el código se almacena en un archivo con extensión `.js`, que se carga mediante el atributo `src`.

    ```html
    <script src="./js/main.js"></script>
    ```

    ```js
    // ./js/main.js
    const nombreAplicacion = "FestWeb";
    console.log(nombreAplicacion);
    ```

### 9.1. Ubicación y orden de ejecución

El navegador procesa normalmente el documento HTML en el orden en que aparece escrito. Un script convencional puede ejecutarse antes de que se hayan creado los elementos situados después de él:

```html
<head>
  <script src="./js/main.js"></script>
</head>
<body>
  <button id="inscribirse">Inscribirme</button>
</body>
```

Si `main.js` intenta localizar el botón inmediatamente, es posible que todavía no exista en el DOM. Una solución tradicional consistía en colocar los scripts al final del cuerpo. De esta forma, el navegador encuentra el script después de haber procesado el contenido anterior:

```html
<body>
  <button id="inscribirse">Inscribirme</button>
  <script src="./js/main.js"></script>
</body>
```

Actualmente también disponemos de atributos y módulos que permiten controlar mejor la carga.

### 9.2. Los atributos `defer` y `async`

Los atributos `defer` y `async` permiten descargar scripts externos sin bloquear del mismo modo el procesamiento del HTML:

- **`defer`:** el script se descarga mientras continúa el análisis del HTML, se ejecuta cuando el documento ha sido procesado y conserva el orden relativo entre varios scripts con `defer`. Resulta adecuado cuando el código necesita acceder a elementos del documento. En este ejemplo, `datos.js` se ejecutará antes que `main.js`:

    ```html
    <script defer src="./js/datos.js"></script>
    <script defer src="./js/main.js"></script>
    ```

- **`async`:** también se descarga mientras continúa el análisis, pero se ejecuta en cuanto termina la descarga. No garantiza el orden entre varios scripts. Resulta útil para código independiente que no depende del DOM ni de otros scripts, como determinadas herramientas de estadísticas.

    ```html
    <script async src="./js/estadisticas.js"></script>
    ```

### 9.3. Módulos JavaScript

Los módulos permiten dividir una aplicación en archivos independientes que exportan e importan funcionalidades. Para indicar que un archivo es un módulo se utiliza el atributo `type="module"`.

```html
<!-- HTML -->
<script type="module" src="./js/main.js"></script>
```

```js
// ./js/main.js
import { nombreAplicacion } from "./configuracion.js";

console.log(nombreAplicacion);
```

```js
// ./js/configuracion.js
export const nombreAplicacion = "FestWeb";
```

Los módulos se cargan de forma diferida de manera predeterminada. Por tanto, normalmente no necesitan añadir `defer`.

!!! actividad "Actividad opcional"
    El siguiente código no se carga correctamente:

    ```html
    <script type="module" src="./js/principal.js"></script>
    ```

    La estructura real es:

    ```text
    FestWeb/
    ├── index.html
    └── scripts/
        └── main.js
    ```

    ¿Cómo podríamos corregirlo?

!!! salto-pagina-pdf ""