El desarrollo web en cliente se apoya principalmente en tres tecnologías: HTML, CSS y JavaScript. Cada una asume una responsabilidad diferente, aunque trabajan conjuntamente para construir la interfaz. A ellas se añaden herramientas como TypeScript y frameworks como Vue, que facilitan el desarrollo de aplicaciones más grandes.

### 7.1. HTML: estructura y contenido

HTML (*HyperText Markup Language*) es el lenguaje de marcado utilizado para definir la estructura y el contenido de una página. Permite representar encabezados, párrafos, enlaces, tablas, formularios o elementos de navegación.

```html
<article class="evento">
  <h2>Carrera FestWeb</h2>
  <p>18 de octubre de 2026</p>
  <button>Inscribirme</button>
</article>
```

HTML describe qué elementos existen y qué significado tienen, pero no determina por sí solo su diseño ni su comportamiento.

### 7.2. CSS: presentación y diseño

CSS (*Cascading Style Sheets*) define cómo se presentan los elementos HTML. Permite controlar desde colores hasta transiciones y animaciones.

```css
.evento {
  padding: 1rem;
  border-radius: 0.75rem;
  background-color: white;
}
```

Separar la estructura HTML de la presentación CSS facilita el mantenimiento y permite aplicar una identidad visual coherente.

### 7.3. JavaScript: comportamiento e interactividad

JavaScript es el lenguaje de programación principal del navegador. Permite responder a las acciones del usuario y modificar dinámicamente la interfaz. Se utiliza para gestionar eventos, validar formularios o almacenar temporalmente información.

```js
const boton = document.querySelector("button");

boton.addEventListener("click", () => {
  console.log("Solicitud de inscripción");
});
```

JavaScript y ECMAScript están estrechamente relacionados, pero no son exactamente lo mismo. **ECMAScript** es la especificación que define las características principales del lenguaje, mientras que **JavaScript** es una implementación de esa especificación y añade su integración con el entorno en el que se ejecuta.

### 7.4. TypeScript

TypeScript es una extensión de JavaScript que incorpora un sistema de tipos y herramientas de análisis de código. Ayuda a detectar errores durante el desarrollo, documentar la estructura de los datos, mejorar el autocompletado, facilitar la refactorización y mantener proyectos grandes.

El navegador no ejecuta directamente el código TypeScript habitual: antes debe transformarse en JavaScript.

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

### 7.5. Vue

A medida que aumenta el tamaño de una aplicación, organizar directamente todo el código JavaScript puede resultar complejo. Para ello utilizaremos librerías y frameworks.

Una **librería** proporciona funciones o componentes que el programador utiliza cuando los necesita: el código de la aplicación decide cuándo llamar a la librería. En cambio, un **framework** proporciona una estructura general para desarrollar la aplicación y establece una forma de organizarla.

Vue es un framework orientado al desarrollo de interfaces web interactivas. Permite dividir la aplicación en unidades reutilizables denominadas **componentes** y facilita:

- Organizar la interfaz mediante componentes.
- Relacionar los datos con su representación.
- Actualizar automáticamente la vista cuando cambian los datos.
- Reutilizar elementos y mantener aplicaciones de mayor tamaño.

### 7.6. Aplicaciones de una sola página

Una SPA (*Single Page Application*) mantiene un documento principal y actualiza dinámicamente su contenido durante la navegación. En lugar de descargar una página HTML completa para cada cambio, se carga la aplicación inicial y JavaScript gestiona la navegación, solicita únicamente los datos necesarios y actualiza la parte correspondiente de la interfaz.

| Ventajas { .table-bg-principal .table-cl-secundario } | Inconvenientes { .table-bg-principal .table-cl-secundario } |
|---|---|
| Navegación fluida | Mayor dependencia de JavaScript |
| Reutilización de componentes | Carga inicial potencialmente mayor |
| Actualización parcial de la interfaz | Gestión más compleja del estado y la navegación |
| Experiencia cercana a una aplicación instalada | Necesidad de cuidar accesibilidad, rendimiento y posicionamiento |

!!! actividad "Actividad opcional"
    Relaciona cada necesidad con su tecnología principal:

    1. Crear el título de un evento.
    2. Aplicar el color corporativo.
    3. Responder al botón **Inscribirme**.
    4. Definir la estructura de los datos de un evento.
    5. Reutilizar una tarjeta en todo el catálogo.
    6. Navegar entre vistas sin recargar toda la página.

!!! salto-pagina-pdf ""