---

title: UP04 · BOM, árbol DOM y selección de elementos

---

El navegador proporciona objetos que permiten consultar información sobre la ventana, la dirección cargada, el dispositivo y el documento HTML.

Estos objetos se organizan en dos modelos:

| Modelo { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Finalidad { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| BOM | Representa la ventana y las funciones del navegador. |
| DOM | Representa los elementos del documento HTML. |

### 3.1. El objeto `window`

`window` representa la ventana o pestaña en la que se ejecuta la aplicación. Es el objeto global del JavaScript ejecutado en el navegador.

De él dependen otros objetos:

```text
window
├── document
├── location
├── history
├── navigator
├── screen
└── console
```

Podemos acceder a sus propiedades utilizando `window`:

```ts
console.log(window.location.href);
console.log(window.navigator.language);
console.log(window.screen.width);
```

Generalmente, el prefijo puede omitirse:

```ts
window.console.log("FestWeb");
console.log("FestWeb");
```

Ambas instrucciones producen el mismo resultado.

| Objeto { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Información o función { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| `document` | Documento HTML cargado. |
| `location` | Dirección actual. |
| `history` | Historial de navegación. |
| `navigator` | Información del navegador. |
| `screen` | Características de la pantalla. |
| `console` | Mensajes y herramientas de depuración. |

### 3.2. Dirección y navegación

El objeto `location` permite consultar la dirección actual:

```ts
console.log(location.href);
console.log(location.protocol);
console.log(location.hostname);
console.log(location.pathname);
```

También permite recargar la página:

```ts
location.reload();
```

El objeto `history` permite desplazarse por el historial de la pestaña:

```ts
history.back();
history.forward();
history.go(-2);
```

Estas operaciones deben utilizarse con prudencia, ya que modifican la navegación del usuario.

### 3.3. Información del navegador

El objeto `navigator` proporciona información sobre el entorno del usuario:

```ts
console.log(navigator.language);
console.log(navigator.onLine);
console.log(navigator.userAgent);
```

El objeto `screen` permite consultar algunas características de la pantalla:

```ts
console.log(screen.width);
console.log(screen.height);
console.log(screen.colorDepth);
```

Esta información puede utilizarse para adaptar determinadas funciones, pero el diseño adaptable debe resolverse principalmente mediante CSS.

!!! importante "Detección de capacidades"

    Es preferible comprobar si una funcionalidad está disponible antes de utilizarla, en lugar de intentar identificar un navegador concreto.

```ts
if ("geolocation" in navigator) {
  console.log("Geolocalización disponible");
}
```

### 3.4. Apertura y gestión de ventanas

El navegador permite abrir otra ventana o pestaña mediante `window.open()`:

```ts
const ventanaDetalle = window.open(
  "./detalle.html",
  "detalleEvento",
  "width=700,height=500"
);
```

La operación devuelve una referencia a la nueva ventana o `null` si el navegador bloquea su apertura:

```ts
if (ventanaDetalle !== null) {
  ventanaDetalle.focus();
}
```

También podemos cerrarla:

```ts
ventanaDetalle?.close();
```

Las ventanas emergentes suelen bloquearse cuando no se abren como consecuencia directa de una acción del usuario.

!!! importante "Restricciones de seguridad"

    Una página no puede acceder libremente al contenido de cualquier otra ventana. El navegador limita la comunicación entre documentos procedentes de orígenes diferentes.

### 3.5. El árbol DOM

Cuando el navegador interpreta el HTML, crea una representación jerárquica denominada **árbol DOM**.

A partir del siguiente documento:

```html
<body>
  <main id="catalogo">
    <article class="evento">
      <h2>Festival Mediterránea</h2>
      <p>Cullera</p>
    </article>
  </main>
</body>
```

Se construye una estructura semejante a esta:

```text
document
└── html
    └── body
        └── main
            └── article
                ├── h2
                └── p
```

Cada elemento HTML se representa mediante un objeto que puede ser localizado, consultado y modificado desde TypeScript.

Los principales tipos de nodos son:

| Tipo { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Representación { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| Documento | Documento HTML completo. |
| Elemento | Etiqueta HTML. |
| Texto | Contenido textual de un elemento. |
| Comentario | Comentario incluido en el HTML. |

En la mayoría de las operaciones trabajaremos con elementos.

```ts
console.log(document.documentElement);
console.log(document.body);
```

### 3.6. Selección de elementos

Para trabajar con un elemento debemos localizarlo dentro del documento.

#### Selección mediante el identificador

```ts
const catalogo = document.getElementById("catalogo");
```

Devuelve el elemento cuyo `id` coincide con el indicado o `null` si no existe.

#### Selección mediante un selector CSS

```ts
const primerEvento = document.querySelector(".evento");
```

`querySelector()` devuelve el primer elemento que coincide con el selector.

Podemos utilizar cualquier selector CSS válido:

```ts
const titulo = document.querySelector("#catalogo h2");
const destacado = document.querySelector("article.destacado");
const boton = document.querySelector("[data-accion='inscribir']");
```

#### Selección de varios elementos

```ts
const eventos = document.querySelectorAll(".evento");
```

`querySelectorAll()` devuelve una colección con todos los elementos coincidentes:

```ts
eventos.forEach((evento) => {
  console.log(evento);
});
```

| Método { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Resultado { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| `getElementById()` | Elemento con un identificador concreto. |
| `querySelector()` | Primer elemento que coincide. |
| `querySelectorAll()` | Todos los elementos que coinciden. |

### 3.7. Selección con TypeScript

TypeScript puede conocer el tipo de elemento esperado mediante la sintaxis genérica:

```ts
const formulario =
  document.querySelector<HTMLFormElement>("#formulario-evento");

const precio =
  document.querySelector<HTMLInputElement>("#precio");
```

Los métodos de selección pueden devolver `null`. Antes de utilizar el resultado debemos comprobar que el elemento existe:

```ts
if (precio !== null) {
  console.log(precio.value);
}
```

También podemos utilizar encadenamiento opcional:

```ts
document.querySelector("h1")?.classList.add("destacado");
```

!!! advertencia "Aserciones de tipo"

    Una aserción afirma que el elemento existe y pertenece a un tipo, pero no realiza ninguna comprobación durante la ejecución.

```ts
const precio =
  document.querySelector("#precio") as HTMLInputElement;
```

Siempre que sea posible, es preferible conservar la posibilidad de `null` y comprobar el resultado.

### 3.8. Búsquedas contextualizadas

Podemos realizar una búsqueda dentro de un elemento concreto:

```ts
const catalogo = document.querySelector("#catalogo");

if (catalogo !== null) {
  const titulos = catalogo.querySelectorAll("h2");

  titulos.forEach((titulo) => {
    console.log(titulo.textContent);
  });
}
```

De este modo limitamos la búsqueda a una zona del documento y evitamos seleccionar elementos ajenos al componente sobre el que estamos trabajando.

### 3.9. Relaciones entre elementos

Los elementos del DOM mantienen relaciones jerárquicas:

```ts
const evento = document.querySelector(".evento");

if (evento !== null) {
  console.log(evento.parentElement);
  console.log(evento.children);
  console.log(evento.firstElementChild);
  console.log(evento.nextElementSibling);
}
```

| Propiedad { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Resultado { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| `parentElement` | Elemento padre. |
| `children` | Elementos hijos. |
| `firstElementChild` | Primer elemento hijo. |
| `lastElementChild` | Último elemento hijo. |
| `previousElementSibling` | Hermano anterior. |
| `nextElementSibling` | Hermano siguiente. |

El método `closest()` busca el elemento más próximo que coincide con un selector:

```ts
const boton = document.querySelector(".boton-inscripcion");
const tarjeta = boton?.closest(".evento");
```

El método `matches()` comprueba si un elemento coincide con un selector:

```ts
if (tarjeta?.matches(".evento.destacado")) {
  console.log("Evento destacado");
}
```

Estos métodos serán especialmente útiles cuando trabajemos con eventos.

### 3.10. Inspección desde las herramientas de desarrollo

El panel **Elementos** de las herramientas de desarrollo permite:

1. Examinar la estructura actual del DOM.
2. Localizar elementos y atributos.
3. Comprobar los estilos aplicados.
4. Copiar selectores CSS.
5. Observar los cambios realizados desde TypeScript.

El DOM mostrado puede ser diferente del HTML original si el código ha modificado la página durante la ejecución.

!!! salto-pagina-pdf ""