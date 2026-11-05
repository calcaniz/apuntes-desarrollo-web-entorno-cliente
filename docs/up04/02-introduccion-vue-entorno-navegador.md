---

title: UP04 · Introducción a Vue y al entorno del navegador

---

## 2. Introducción a Vue y al entorno del navegador

Hasta ahora hemos utilizado TypeScript para trabajar con datos, funciones, objetos y clases. En esta unidad aplicaremos estos conocimientos a la construcción de interfaces capaces de responder a las acciones del usuario.

Estudiaremos dos formas de hacerlo:

- Manipulando directamente el DOM mediante TypeScript.
- Utilizando componentes y estado reactivo con Vue.

Primero comprenderemos cómo representa y modifica el navegador una página web. Después veremos cómo Vue organiza estas operaciones mediante componentes.

### 2.1. Manipulación imperativa del DOM

HTML permite definir la estructura inicial de una página:

```html
<article class="evento">
  <h2>Festival Mediterránea</h2>
  <button>Inscribirme</button>
</article>
```

TypeScript puede seleccionar y modificar sus elementos:

```ts
const titulo = document.querySelector<HTMLHeadingElement>(".evento h2");

if (titulo !== null) {
  titulo.textContent = "Medusa Festival";
}
```

Este enfoque es **imperativo** porque indicamos expresamente:

1. Qué elemento debe localizarse.
2. Qué modificación debe realizarse.
3. En qué orden debe ejecutarse.

Cuando la interfaz contiene muchos elementos y estados, estas operaciones pueden resultar difíciles de organizar.

### 2.2. Creación de un proyecto Vue

Para crear una aplicación utilizaremos **Vue 3**, **TypeScript**, **npm** y **Vite**.

Antes de comenzar debemos tener instalado Node.js, que incluye el gestor de paquetes npm. Podemos comprobarlo desde la terminal:

```bash
node --version
npm --version
```

Nos situamos en el directorio donde queramos crear el proyecto y ejecutamos:

```bash
npm create vue@latest
```

El asistente solicitará el nombre del proyecto y las características que queremos incorporar.

| Opción { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Selección { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|:---:|
| TypeScript | Sí |
| JSX | No |
| Vue Router | No |
| Pinia | No |
| Pruebas | No |
| ESLint | Sí |
| Prettier | Sí |

Una vez creado, accedemos al directorio, instalamos las dependencias e iniciamos el servidor:

```bash
cd festweb-vue
npm install
npm run dev
```

Vite mostrará una dirección local desde la que podremos abrir la aplicación.

La estructura inicial incluirá los siguientes elementos:

```text
festweb-vue/
├── src/
│   ├── assets/
│   ├── components/
│   ├── App.vue
│   └── main.ts
├── index.html
├── package.json
└── vite.config.ts
```

| Elemento { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Función { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| `index.html` | Documento inicial de la aplicación. |
| `src/main.ts` | Punto de entrada de TypeScript. |
| `src/App.vue` | Componente principal. |
| `src/components/` | Componentes reutilizables. |
| `package.json` | Dependencias y scripts del proyecto. |

El archivo `main.ts` crea la aplicación y la monta sobre el elemento `#app`:

```ts
import { createApp } from "vue";
import App from "./App.vue";

createApp(App).mount("#app");
```

En `index.html` encontramos el elemento que será controlado por Vue:

```html
<div id="app"></div>
```

!!! nota "Herramientas posteriores"

    Vue Router y Pinia no son necesarios todavía. Los incorporaremos cuando desarrollemos aplicaciones Vue más completas.

### 2.3. Desarrollo declarativo y `script setup`

Vue utiliza un enfoque **declarativo**. En lugar de indicar cada modificación que debe realizarse en el DOM, describimos cómo debe mostrarse la interfaz a partir de los datos.

```vue
<script setup lang="ts">
const nombreEvento: string = "Festival Mediterránea";
</script>

<template>
  <article class="evento">
    <h2>{{ nombreEvento }}</h2>
  </article>
</template>
```

El bloque `<script setup>` contiene la lógica del componente utilizando la **Composition API**.

La palabra `setup` indica que:

- Las variables, funciones e importaciones pueden utilizarse directamente en `<template>`.
- No es necesario devolver manualmente los datos a la plantilla.
- El código se ejecuta cuando se crea una instancia del componente.
- Se reduce el código necesario para configurar el componente.

El atributo `lang="ts"` indica que el código está escrito en TypeScript.

```vue
<script setup lang="ts">
const nombreEvento: string = "Festival Mediterránea";
const precioEntrada: number = 35;

function mostrarInformacion(): void {
  console.log(`${nombreEvento}: ${precioEntrada} €`);
}
</script>

<template>
  <article>
    <h2>{{ nombreEvento }}</h2>
    <p>{{ precioEntrada }} €</p>

    <button @click="mostrarInformacion">
      Mostrar información
    </button>
  </article>
</template>
```

En este ejemplo:

- `{{ nombreEvento }}` muestra un dato.
- `@click` escucha un evento.
- `mostrarInformacion` responde a la acción del usuario.

### 2.4. Estado reactivo

El **estado** contiene los datos que pueden cambiar durante la ejecución y afectar a la interfaz.

En Vue podemos declarar un dato reactivo mediante `ref()`:

```vue
<script setup lang="ts">
import { ref } from "vue";

const entradasDisponibles = ref(25);

function reservar(): void {
  if (entradasDisponibles.value > 0) {
    entradasDisponibles.value--;
  }
}
</script>

<template>
  <p>Entradas disponibles: {{ entradasDisponibles }}</p>
  <button @click="reservar">Inscribirme</button>
</template>
```

Cuando cambia `entradasDisponibles`, Vue actualiza automáticamente la interfaz.

Dentro de `<script setup>` accedemos al dato mediante `.value`. En `<template>`, Vue permite utilizarlo directamente.

| Elemento { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Función { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| `<script setup>` | Contiene la lógica del componente. |
| `lang="ts"` | Activa el uso de TypeScript. |
| `ref()` | Declara un dato reactivo. |
| `.value` | Accede al valor desde TypeScript. |
| `{{ }}` | Muestra un dato en la plantilla. |
| `@click` | Responde a un evento. |

### 2.5. Componentes Vue

Un **componente** es una parte reutilizable de la interfaz que reúne:

- Estructura.
- Datos.
- Comportamiento.
- Estilos.

En FestWeb podemos identificar componentes como:

- Cabecera.
- Barra de navegación.
- Listado de eventos.
- Tarjeta de evento.
- Formulario de inscripción.
- Pie de página.

Los componentes se almacenan habitualmente en archivos `.vue`:

```vue
<script setup lang="ts">
const nombre = "Festival Mediterránea";
const localidad = "Cullera";
</script>

<template>
  <article class="evento">
    <h2>{{ nombre }}</h2>
    <p>{{ localidad }}</p>
  </article>
</template>

<style scoped>
.evento {
  padding: 1rem;
  border: 1px solid #cccccc;
}
</style>
```

| Bloque { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Responsabilidad { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| `<script setup lang="ts">` | Datos y comportamiento. |
| `<template>` | Estructura que se mostrará. |
| `<style scoped>` | Estilos limitados al componente. |

!!! importante "Comprender antes de automatizar"

    Vue simplifica la actualización de la interfaz, pero no sustituye el conocimiento del DOM. Para utilizar correctamente el framework debemos comprender cómo representa el navegador los elementos y cómo se producen los eventos.

### 2.6. El navegador como entorno de ejecución

Aunque programemos con TypeScript y Vue, la aplicación se ejecuta finalmente como JavaScript en el navegador.

El navegador se encarga de:

1. Descargar los recursos.
2. Interpretar el HTML.
3. Construir el árbol DOM.
4. Aplicar los estilos CSS.
5. Ejecutar JavaScript.
6. Gestionar las acciones del usuario.
7. Actualizar la interfaz.

Vite transforma el código TypeScript y los componentes `.vue` antes de enviarlos al navegador.

El entorno del navegador se representa mediante dos modelos principales:

| Modelo { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Finalidad { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| BOM | Representa la ventana y determinadas funciones del navegador. |
| DOM | Representa el documento HTML y sus elementos. |

El objeto principal del BOM es `window`. Dentro de él encontramos objetos como:

```text
window
├── document
├── location
├── history
├── navigator
├── screen
└── console
```

El objeto `document` representa el documento HTML y constituye el punto de entrada al DOM.

### 2.7. El árbol DOM

Cuando el navegador interpreta el HTML, construye una estructura jerárquica denominada **árbol DOM**.

A partir de este documento:

```html
<body>
  <main>
    <article>
      <h2>Festival Mediterránea</h2>
      <button>Inscribirme</button>
    </article>
  </main>
</body>
```

Se genera una jerarquía semejante a esta:

```text
document
└── html
    └── body
        └── main
            └── article
                ├── h2
                └── button
```

Cada etiqueta se convierte en un elemento que puede ser localizado y modificado desde TypeScript.

Vue también trabaja sobre el DOM, pero gestiona automáticamente gran parte de estas operaciones a partir del estado de la aplicación.

### 2.8. DOM imperativo y Vue declarativo

| DOM imperativo { .table-content .table-bg-principal .table-cl-secundario } | Vue declarativo { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| Seleccionamos elementos. | Declaramos una plantilla. |
| Modificamos directamente el DOM. | Modificamos el estado. |
| Controlamos cada operación. | Vue actualiza la interfaz. |
| La lógica puede quedar dispersa. | La interfaz se divide en componentes. |

Durante esta unidad seguiremos esta progresión:

1. Comprender el entorno del navegador.
2. Seleccionar y modificar elementos del DOM.
3. Crear elementos dinámicamente.
4. Gestionar eventos y formularios.
5. Trasladar parte de la solución a componentes Vue.

!!! advertencia "No mezclar los dos enfoques"

    Dentro de una zona controlada por Vue evitaremos modificar manualmente el DOM. Los cambios directos pueden entrar en conflicto con el sistema de actualización del framework.

!!! pregunta "Pregunta de partida"

    Si cambia la información de un evento, ¿qué resulta más sencillo: localizar y modificar manualmente sus elementos o cambiar el estado y dejar que Vue actualice la interfaz?


!!! salto-pagina-pdf ""