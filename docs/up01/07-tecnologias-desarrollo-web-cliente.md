El desarrollo web en cliente se apoya principalmente en HTML, CSS y JavaScript. TypeScript y los frameworks facilitan la construcción de aplicaciones de mayor tamaño.

### 7.1. HTML: estructura y contenido

HTML es el lenguaje de marcado que define los elementos y el significado del contenido.

```html
<article class="evento">
  <h2>Carrera FestWeb</h2>
  <button>Inscribirme</button>
</article>
```

### 7.2. CSS: presentación

CSS determina la apariencia y distribución de los elementos HTML.

```css
.evento {
  padding: 1rem;
  border-radius: 0.75rem;
}
```

Separar estructura y presentación facilita el mantenimiento y permite aplicar una identidad visual coherente.

### 7.3. JavaScript: comportamiento

JavaScript es el lenguaje de programación nativo del navegador. Permite responder a eventos, modificar la interfaz, validar datos, almacenar información y comunicarse con servidores.

```js
const boton = document.querySelector("button");

boton.addEventListener("click", () => {
  console.log("Inscripción solicitada");
});
```

**ECMAScript** es la especificación que define el núcleo del lenguaje. JavaScript implementa esa especificación y utiliza las APIs proporcionadas por su entorno de ejecución.

### 7.4. TypeScript

TypeScript amplía JavaScript con un sistema de tipos que ayuda a detectar errores durante el desarrollo y a documentar los datos.

```ts
interface Evento {
  nombre: string;
  plazas: number;
}

const evento: Evento = {
  nombre: "Carrera FestWeb",
  plazas: 500,
};
```

El navegador no ejecuta directamente el TypeScript habitual: antes debe transformarse en JavaScript.

### 7.5. Librerías y frameworks

Una **librería** ofrece funcionalidades que el código utiliza cuando las necesita. Un **framework** proporciona además una estructura y unas reglas para organizar la aplicación.

Vue es un framework para crear interfaces interactivas mediante componentes reutilizables y actualización reactiva de la vista. Se estudiará en profundidad en la UP08.

### 7.6. Aplicaciones SPA

Una SPA (*Single Page Application*) mantiene un documento principal y actualiza dinámicamente su contenido durante la navegación.

| Ventajas { .table-full-container .table-bg-principal .table-cl-secundario }| Inconvenientes { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|
| Navegación fluida y actualización parcial | Mayor dependencia de JavaScript |
| Reutilización de componentes | Mayor complejidad de estado y navegación |
| Experiencia próxima a una aplicación instalada | Requiere cuidar accesibilidad, rendimiento y posicionamiento |

### 7.7. Tecnologías complementarias

| Tecnología { .table-main-column .table-bg-principal .table-cl-secundario } | Finalidad { .table-full-container .table-bg-principal .table-cl-secundario }| Resultado { .table-full-container .table-bg-principal .table-cl-secundario }|
|---|---|---|
| SCSS/Sass | Añadir variables y otras utilidades a los estilos | CSS |
| Babel | Transformar sintaxis JavaScript | JavaScript compatible |
| Polyfill | Implementar una funcionalidad ausente | Código JavaScript adicional |
| WebAssembly | Ejecutar operaciones de alto rendimiento | Módulo `.wasm` |
| Vite | Coordinar el desarrollo y preparar el proyecto | Recursos para el navegador |

WebAssembly no sustituye normalmente a JavaScript: puede ejecutar determinados cálculos mientras JavaScript gestiona la interfaz y las APIs del navegador.

```text
Código de desarrollo
        ↓
Transformación y preparación
        ↓
HTML + CSS + JavaScript + WebAssembly
        ↓
Navegador
```

!!! actividad "Actividad opcional"

    Relaciona cada necesidad con su tecnología principal:

    1. Definir la estructura de una tarjeta.
    2. Aplicar el color corporativo.
    3. Responder al botón **Inscribirme**.
    4. Comprobar la estructura de los datos de un evento.
    5. Crear componentes reutilizables.
    6. Transformar el código antes de enviarlo al navegador.

!!! salto-pagina-pdf ""
