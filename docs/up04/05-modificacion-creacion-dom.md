---

title: UP04 · Modificación y creación dinámica del DOM

---


Después de seleccionar un elemento podemos consultar o modificar su contenido, sus atributos y sus clases. También podemos crear nuevos elementos y añadirlos al documento.

Estas operaciones permiten construir interfaces dinámicas a partir de los datos de la aplicación.

### 5.1. Consultar y modificar contenido

La propiedad `textContent` permite consultar o sustituir el contenido textual de un elemento:

```ts
const titulo =
  document.querySelector<HTMLHeadingElement>(".evento__titulo");

if (titulo !== null) {
  console.log(titulo.textContent);
  titulo.textContent = "Nuevo nombre del evento";
}
```

También podemos utilizar el operador de encadenamiento opcional para consultar el contenido:

```ts
console.log(titulo?.textContent);
```

`textContent` trata el valor como texto y no interpreta etiquetas HTML.

### 5.2. Insertar contenido HTML

La propiedad `innerHTML` permite consultar o sustituir el contenido HTML interno:

```ts
const mensaje =
  document.querySelector<HTMLElement>("#mensaje");

if (mensaje !== null) {
  mensaje.innerHTML = "<strong>Inscripción completada</strong>";
}
```

| Propiedad { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Comportamiento { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| `textContent` | Inserta contenido como texto. |
| `innerHTML` | Interpreta el contenido como HTML. |

!!! peligro "Contenido procedente del usuario"

    No debemos introducir directamente mediante `innerHTML` datos escritos por el usuario o recibidos desde una fuente no confiable. Esto podría permitir la inyección de código HTML malicioso.

Para mostrar datos externos, utilizaremos preferentemente `textContent`.

### 5.3. Atributos y propiedades

Los atributos pueden consultarse y modificarse mediante diferentes métodos:

```ts
const imagen =
  document.querySelector<HTMLImageElement>(".evento img");

if (imagen !== null) {
  console.log(imagen.getAttribute("src"));

  imagen.setAttribute(
    "alt",
    "Nuevo texto alternativo"
  );
}
```

También podemos acceder a determinadas propiedades directamente:

```ts
if (imagen !== null) {
  imagen.src = "/imagenes/nuevo-evento.svg";
  imagen.alt = "Imagen del nuevo evento";
}
```

Los métodos principales son:

| Método { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Función { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| `getAttribute()` | Obtiene el valor de un atributo. |
| `setAttribute()` | Añade o modifica un atributo. |
| `hasAttribute()` | Comprueba si existe. |
| `removeAttribute()` | Elimina un atributo. |

```ts
const boton =
  document.querySelector<HTMLButtonElement>(".boton-inscripcion");

boton?.setAttribute("disabled", "");
console.log(boton?.hasAttribute("disabled"));
boton?.removeAttribute("disabled");
```

En elementos tipados podemos utilizar directamente sus propiedades:

```ts
if (boton !== null) {
  boton.disabled = true;
}
```

### 5.4. Atributos personalizados

Los atributos que comienzan por `data-` permiten almacenar información asociada a un elemento:

```html
<article
  class="evento"
  data-evento-id="2"
  data-categoria="musica"
>
```

Podemos acceder a ellos mediante `dataset`:

```ts
const evento =
  document.querySelector<HTMLElement>(".evento");

if (evento !== null) {
  console.log(evento.dataset.eventoId);
  console.log(evento.dataset.categoria);

  evento.dataset.estado = "disponible";
}
```

El atributo `data-evento-id` se convierte en la propiedad `dataset.eventoId`.

### 5.5. Gestión de clases CSS

La propiedad `classList` permite añadir, eliminar o comprobar clases:

```ts
const evento =
  document.querySelector<HTMLElement>(".evento");

evento?.classList.add("destacado");
evento?.classList.remove("oculto");
evento?.classList.toggle("seleccionado");
```

Podemos comprobar si una clase está presente:

```ts
const esDestacado =
  evento?.classList.contains("destacado") ?? false;

console.log(esDestacado);
```

| Método { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Función { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| `add()` | Añade una clase. |
| `remove()` | Elimina una clase. |
| `toggle()` | Añade o elimina una clase. |
| `contains()` | Comprueba si existe. |
| `replace()` | Sustituye una clase por otra. |

Utilizar clases es preferible a modificar muchos estilos directamente desde TypeScript.

### 5.6. Crear elementos

El método `document.createElement()` crea un elemento, pero no lo incorpora todavía al documento:

```ts
const tarjeta =
  document.createElement("article");

tarjeta.classList.add("evento");
tarjeta.dataset.eventoId = "4";
```

Después creamos sus elementos internos:

```ts
const titulo =
  document.createElement("h3");

titulo.classList.add("evento__titulo");
titulo.textContent = "Concert a la Marina";

const localidad =
  document.createElement("p");

localidad.classList.add("evento__localidad");
localidad.textContent = "València";
```

Finalmente, añadimos los elementos a la tarjeta:

```ts
tarjeta.append(titulo, localidad);
```

!!! importante "`appendChild()` es un método"

    Para añadir un nodo debemos llamar al método utilizando paréntesis.

```ts
tarjeta.appendChild(titulo);
```

La siguiente instrucción es incorrecta:

```ts
tarjeta.appendChild = titulo;
```

### 5.7. Incorporar elementos al documento

Una vez creada la tarjeta, podemos añadirla al catálogo:

```ts
const catalogo =
  document.querySelector<HTMLElement>("#catalogo");

catalogo?.append(tarjeta);
```

Disponemos de diferentes operaciones:

| Método { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Resultado { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| `append()` | Añade al final del elemento. |
| `prepend()` | Añade al principio. |
| `before()` | Inserta antes del elemento. |
| `after()` | Inserta después del elemento. |
| `replaceWith()` | Sustituye el elemento. |
| `remove()` | Elimina el elemento. |

```ts
catalogo?.prepend(tarjeta);
```

Para eliminar un elemento:

```ts
const eventoAgotado =
  document.querySelector<HTMLElement>(".evento.agotado");

eventoAgotado?.remove();
```

### 5.8. Generar una tarjeta completa

Podemos reunir las operaciones anteriores para crear una tarjeta:

```ts
const tarjeta = document.createElement("article");
tarjeta.classList.add("evento");
tarjeta.dataset.eventoId = "4";

const contenido = document.createElement("div");
contenido.classList.add("evento__contenido");

const categoria = document.createElement("p");
categoria.classList.add("evento__categoria");
categoria.textContent = "Música";

const titulo = document.createElement("h3");
titulo.classList.add("evento__titulo");
titulo.textContent = "Concert a la Marina";

const localidad = document.createElement("p");
localidad.classList.add("evento__localidad");
localidad.textContent = "València";

const boton = document.createElement("button");
boton.classList.add("boton-inscripcion");
boton.type = "button";
boton.dataset.accion = "inscribir";
boton.textContent = "Inscribirme";

contenido.append(categoria, titulo, localidad, boton);
tarjeta.append(contenido);

document.querySelector("#catalogo")?.append(tarjeta);
```

La tarjeta se construye en memoria y se incorpora al DOM cuando está completa.

### 5.9. Crear elementos a partir de datos

La información utilizada para construir una tarjeta puede almacenarse en un objeto:

```ts
interface Evento {
  id: number;
  nombre: string;
  categoria: string;
  localidad: string;
}

const nuevoEvento: Evento = {
  id: 4,
  nombre: "Concert a la Marina",
  categoria: "Música",
  localidad: "València",
};
```

Después utilizamos sus propiedades para completar los elementos:

```ts
tarjeta.dataset.eventoId =
  nuevoEvento.id.toString();

categoria.textContent =
  nuevoEvento.categoria;

titulo.textContent =
  nuevoEvento.nombre;

localidad.textContent =
  nuevoEvento.localidad;
```

De esta manera separamos los datos de la estructura visual que los representa.

!!! actividad "Preparación de la actividad A04.02"

    En la siguiente actividad construiremos nuevas tarjetas de FestWeb a partir de varios objetos y las añadiremos dinámicamente al catálogo.


!!! salto-pagina-pdf ""