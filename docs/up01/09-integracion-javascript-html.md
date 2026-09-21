## 9. Integración de JavaScript en HTML

El elemento `<script>` permite incorporar JavaScript a un documento HTML. El código puede escribirse directamente en el documento o almacenarse en un archivo externo.

### 9.1. Formas de integración

#### JavaScript en atributos HTML

```html
<button onclick="alert('Inscripción solicitada')">
  Inscribirme
</button>
```

Esta opción mezcla estructura y comportamiento, dificulta el mantenimiento y no se recomienda salvo en ejemplos mínimos.

#### JavaScript interno

```html
<script>
  console.log("FestWeb se ha cargado");
</script>
```

Resulta útil para pruebas breves, pero no facilita la reutilización.

#### JavaScript externo

```html
<script src="./js/main.js"></script>
```

```js
// ./js/main.js
console.log("FestWeb se ha cargado");
```

Los archivos externos separan responsabilidades, pueden reutilizarse y permiten al navegador almacenarlos en caché.

!!! importante "Separación de responsabilidades"

    HTML define la estructura, CSS la presentación y JavaScript el comportamiento.

### 9.2. Momento de ejecución

Un script convencional detiene temporalmente el análisis del HTML para descargarse y ejecutarse. Si aparece antes que los elementos que necesita, estos todavía no existirán en el DOM.

Una solución tradicional es situarlo al final de `<body>`. También puede esperarse al evento `DOMContentLoaded`:

```js
document.addEventListener("DOMContentLoaded", () => {
  const boton = document.querySelector("#inscribirse");
  console.log(boton);
});
```

Actualmente podemos controlar la carga mediante atributos específicos:

| Mecanismo { .table-bg-principal .table-cl-secundario } | Ejecución { .table-bg-principal .table-cl-secundario } | Orden { .table-bg-principal .table-cl-secundario } | Uso { .table-full-container .table-bg-principal .table-cl-secundario }|
|---|---|:---:|---|
| Script convencional | Al encontrarlo; puede bloquear el HTML | Sí | Ejemplos sencillos o final de `body` |
| `defer` | Después de procesar el HTML | Sí | Scripts clásicos que utilizan el DOM |
| `async` | En cuanto termina la descarga | No | Scripts independientes |
| `type="module"` | Después de procesar el HTML y resolver dependencias | Según dependencias | Aplicaciones organizadas en módulos |

```html
<script defer src="./js/main.js"></script>
<script async src="./js/estadisticas.js"></script>
<script type="module" src="./js/aplicacion.js"></script>
```

`async` no debe utilizarse cuando un archivo depende de otro, porque el orden de ejecución no está garantizado.

### 9.3. Módulos JavaScript

Los módulos dividen la aplicación en archivos con responsabilidades concretas y permiten importar y exportar elementos.

```js
// ./js/configuracion.js
export const nombreAplicacion = "FestWeb";
```

```js
// ./js/main.js
import { nombreAplicacion } from "./configuracion.js";

console.log(nombreAplicacion);
```

```html
<script type="module" src="./js/main.js"></script>
```

Los módulos:

- Se cargan de forma diferida de manera predeterminada.
- Tienen su propio ámbito.
- Se ejecutan en modo estricto.
- Resuelven las dependencias indicadas mediante `import`.
- Requieren rutas explícitas, incluida normalmente la extensión `.js`.
- Deben utilizarse mediante un servidor web y no abriendo directamente el archivo con `file://`.

Durante el curso utilizaremos el servidor local proporcionado por Vite.

!!! actividad "Actividad opcional"

    La estructura real del proyecto es:

    ```text
    FestWeb/
    ├── index.html
    └── scripts/
        └── main.js
    ```

    Corrige esta referencia y explica qué mecanismo de carga utiliza:

    ```html
    <script type="module" src="./js/principal.js"></script>
    ```

!!! salto-pagina-pdf ""
