---

title: A04.02 · Generación dinámica del catálogo

---

## A04.02. Generación dinámica del catálogo

En esta actividad eliminaremos las tarjetas escritas directamente en el HTML y las generaremos dinámicamente desde TypeScript.

Cada evento se almacenará como un objeto y se transformará en una tarjeta mediante los métodos de creación y modificación del DOM.

### 1. Información de la actividad

| Elemento { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Descripción { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| Tipo | Actividad formativa guiada |
| Duración | 1 hora |
| Agrupamiento | Grupo-clase |
| Herramientas | Vite, TypeScript y DevTools |
| Punto de partida | Proyecto utilizado en A04.01 |
| Resultado | Catálogo generado dinámicamente |

### 2. Preparar el proyecto

Realiza una copia del proyecto de la actividad anterior y cambia el nombre de la carpeta:

```text
a04-02-generacion-catalogo
```

Abre una terminal dentro del nuevo proyecto e inicia el servidor:

```bash
npm run dev
```

Comprueba que FestWeb continúa funcionando correctamente.

### 3. Vaciar el catálogo HTML

Abre `index.html` y localiza el contenedor del catálogo.

Elimina los elementos `<article>` que contiene. El resultado debe ser:

```html
<div id="catalogo" class="catalogo">
  <!-- Las tarjetas se generarán desde TypeScript -->
</div>
```

!!! importante "Contenido estático y dinámico"

    El HTML conservará la estructura general de FestWeb. TypeScript generará únicamente los elementos del catálogo que dependen de los datos.

Comprueba que la página sigue cargándose aunque el catálogo aparezca vacío.

### 4. Crear el modelo de dominio

Dentro de `src`, crea un directorio llamado `domain`:

```text
src/
├── domain/
│   └── IEvento.ts
├── main.ts
└── style.css
```

El directorio `domain` contendrá las interfaces, tipos y clases que representen los elementos principales de FestWeb.

Crea el archivo `src/domain/IEvento.ts`:

```ts
export interface IEvento {
  id: number;
  nombre: string;
  categoria: string;
  localidad: string;
  fecha: string;
  imagen: string;
  textoAlternativo: string;
  destacado: boolean;
}
```

La palabra `export` permite utilizar la interfaz desde otros archivos.

!!! nota "Importación de tipos"

    Las interfaces solamente se utilizan durante la comprobación de TypeScript. Por ello, las importaremos mediante `import type`.

### 5. Importar el modelo y preparar los datos

Abre `src/main.ts` e importa la interfaz:

```ts
import "./style.css";

import type { IEvento } from "./domain/IEvento";
```

Añade el listado de eventos:

```ts
const eventos: IEvento[] = [
  {
    id: 1,
    nombre: "Festival Mediterránea",
    categoria: "Música",
    localidad: "Gandia, Valencia",
    fecha: "14 de agosto de 2027",
    imagen: "/imagenes/mediterranea.svg",
    textoAlternativo: "Escenario del Festival Mediterránea",
    destacado: true,
  },
  {
    id: 2,
    nombre: "Medusa Festival",
    categoria: "Música electrónica",
    localidad: "Cullera, Valencia",
    fecha: "16 de agosto de 2027",
    imagen: "/imagenes/medusa.svg",
    textoAlternativo: "Escenario del Medusa Festival",
    destacado: false,
  },
  {
    id: 3,
    nombre: "Nits al Castell",
    categoria: "Teatro",
    localidad: "Xàtiva, Valencia",
    fecha: "21 de agosto de 2027",
    imagen: "/imagenes/teatro.svg",
    textoAlternativo: "Representación teatral al aire libre",
    destacado: false,
  },
];
```

TypeScript comprobará que todos los objetos cumplen la estructura definida por `IEvento`.

### 6. Seleccionar el catálogo

Localiza el contenedor en el que se insertarán las tarjetas:

```ts
const catalogo =
  document.querySelector<HTMLElement>("#catalogo");

if (catalogo === null) {
  throw new Error("No se ha encontrado el catálogo");
}
```

Lanzamos un error porque la aplicación no puede generar las tarjetas si el contenedor principal no existe.
### 7. Crear la primera tarjeta

Utiliza el primer evento del listado:

```ts
const primerEvento = eventos[0];
```

Crea el elemento principal:

```ts
const tarjeta = document.createElement("article");
```

Todas las tarjetas deben tener la clase `.evento`, que contiene sus estilos generales:

```ts
tarjeta.classList.add("evento");
```

Guarda también el identificador mediante un atributo `data-evento-id`:

```ts
tarjeta.dataset.eventoId =
  primerEvento.id.toString();
```

Si el evento está marcado como destacado, añade la clase `.destacado`:

```ts
if (primerEvento.destacado) {
  tarjeta.classList.add("destacado");
}
```

El resultado generado será equivalente a:

```html
<article
  class="evento destacado"
  data-evento-id="1"
>
</article>
```

Para un evento no destacado se generará:

```html
<article
  class="evento"
  data-evento-id="2"
>
</article>
```

| Clase { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Función { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| `.evento` | Aplica la estructura y apariencia general de la tarjeta. |
| `.destacado` | Diferencia visualmente los eventos destacados. |

!!! importante "Una clase base y otra opcional"

    La clase `.evento` debe añadirse siempre. La clase `.destacado` solamente se añade cuando la propiedad `destacado` del objeto contiene `true`.
### 8. Crear la imagen y el contenido

Crea la imagen de la tarjeta:

```ts
const imagen = document.createElement("img");

imagen.src = /* TODO */;
imagen.alt = /* TODO */;
```

Crea el contenedor interior:

```ts
const contenido = document.createElement("div");

contenido.classList.add("evento__contenido");
```

Crea los elementos de información:

```ts
const categoria = document.createElement("p");

categoria.classList.add("evento__categoria");
categoria.textContent = /* TODO */;

const titulo = document.createElement("h3");

titulo.classList.add("evento__titulo");
titulo.textContent = /* TODO */;

const localidad = document.createElement("p");

localidad.classList.add("evento__localidad");
localidad.textContent = /* TODO */;

const fecha = document.createElement("p");

fecha.classList.add("evento__fecha");
fecha.textContent = /* TODO */;
```

Crea el botón:

```ts
const boton = document.createElement("button");

boton.classList.add("boton-inscripcion");
boton.type = "button";
boton.dataset.accion = "inscribir";
boton.textContent = /* TODO */;
```

El botón todavía no realizará ninguna acción. Los eventos se trabajarán en el siguiente apartado.

### 9. Construir e insertar la tarjeta

Añade los elementos informativos al contenedor interior:

```ts
contenido.append(
  categoria,
  titulo,
  localidad,
  fecha,
  boton
);
```

Añade la imagen y el contenido a la tarjeta:

```ts
tarjeta.append(imagen, contenido);
```

Incorpora la tarjeta al catálogo:

```ts
catalogo.append(tarjeta);
```

Comprueba desde DevTools que el nuevo `<article>` contiene la misma estructura que tenían las tarjetas originales.

### 10. Crear una función reutilizable

La creación de la tarjeta debe poder repetirse para cualquier evento.

Traslada el código anterior a una función:

```ts
function crearTarjetaEvento(
  evento: IEvento
): HTMLElement {
  const tarjeta = document.createElement("article");

  // TODO: configurar la tarjeta.

  // TODO: crear la imagen.

  // TODO: crear el contenedor interior.

  // TODO: crear los textos y el botón.

  // TODO: construir la estructura.

  return tarjeta;
}
```

La función:

- Recibe un objeto que cumple la interfaz `IEvento`.
- Crea y configura los elementos necesarios.
- Devuelve el `<article>` completo.
- No añade directamente la tarjeta al documento.

!!! pregunta "Separación de responsabilidades"

    ¿Por qué es preferible que la función devuelva la tarjeta en lugar de insertarla directamente en el catálogo?

Cuando la función esté preparada, elimina el código temporal utilizado para generar manualmente la primera tarjeta.

### 11. Generar todo el catálogo

Recorre el listado y crea una tarjeta para cada evento:

```ts
eventos.forEach((evento) => {
  const tarjetaEvento =
    crearTarjetaEvento(evento);

  catalogo.append(tarjetaEvento);
});
```

El resultado debe contener tres tarjetas generadas completamente desde TypeScript.

### 12. Estructura final del proyecto

La estructura del proyecto debe ser semejante a esta:

```text
a04-02-generacion-catalogo/
├── public/
│   └── imagenes/
│       ├── logo-festweb.svg
│       ├── mediterranea.svg
│       ├── medusa.svg
│       └── teatro.svg
├── src/
│   ├── domain/
│   │   └── IEvento.ts
│   ├── main.ts
│   └── style.css
├── index.html
├── package.json
└── tsconfig.json
```

El directorio `domain` podrá ampliarse posteriormente con nuevas interfaces, tipos y clases.

### 13. Comprobaciones finales

Utiliza las herramientas de desarrollo para comprobar que:

- El HTML inicial no contiene tarjetas.
- El catálogo contiene tres elementos `<article>`.
- Cada tarjeta tiene la clase `.evento`.
- La primera también tiene la clase `.destacado`.
- Cada tarjeta contiene su atributo `data-evento-id`.
- Las imágenes contienen los atributos `src` y `alt`.
- Los botones tienen `type="button"`.
- La consola no muestra errores.

Ejecuta también estas comprobaciones:

```ts
console.log(
  "Tarjetas generadas:",
  document.querySelectorAll(".evento").length
);

console.log(
  "Eventos destacados:",
  document.querySelectorAll(".evento.destacado").length
);
```

El resultado esperado es:

```text
Tarjetas generadas: 3
Eventos destacados: 1
```

### 14. Resultado esperado

Al finalizar la actividad deberás ser capaz de:

- Organizar interfaces dentro del dominio de la aplicación.
- Exportar e importar tipos entre archivos.
- Representar los datos mediante una interfaz.
- Crear elementos con `document.createElement()`.
- Modificar texto, atributos, clases y propiedades.
- Construir estructuras mediante `append()`.
- Crear atributos personalizados mediante `dataset`.
- Generar elementos a partir de un listado.
- Separar los datos de su representación visual.

### 15. Cierre de la actividad

Responde oralmente:

1. ¿Por qué hemos eliminado las tarjetas del HTML?
2. ¿Qué responsabilidad tiene el directorio `domain`?
3. ¿Para qué utilizamos `export` e `import type`?
4. ¿Qué hace `document.createElement()`?
5. ¿Cuándo aparece un elemento creado en el documento?
6. ¿Para qué utilizamos `dataset.eventoId`?
7. ¿Qué responsabilidad tiene `crearTarjetaEvento()`?
8. ¿Por qué utilizamos `textContent` para mostrar los datos?
9. ¿Qué ventaja tiene generar las tarjetas desde una colección?

!!! nota "Actividad formativa"

    Esta actividad no se califica. Su finalidad es preparar la gestión de eventos e interacción con el usuario del siguiente apartado.

!!! salto-pagina-pdf ""