---

title: UP04 · Eventos e interacción con el usuario

---

Un evento es una señal que informa de que ha ocurrido una acción en el navegador. Puede originarse por la interacción del usuario, por un cambio en el documento o por el propio funcionamiento de la aplicación.

Algunos ejemplos son:

- Pulsar un botón.
- Escribir en un campo.
- Mover el puntero.
- Enviar un formulario.
- Terminar de cargar el documento.

### 7.1. Tipos de eventos

Los eventos más habituales pueden agruparse de la siguiente forma:

| Grupo { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Eventos habituales { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| Puntero | `click`, `dblclick`, `mouseenter`, `mouseleave` |
| Teclado | `keydown`, `keyup` |
| Formularios | `input`, `change`, `submit`, `focus`, `blur` |
| Documento | `DOMContentLoaded` |
| Ventana | `load`, `resize`, `scroll` |

No es necesario memorizar todos los eventos. Debemos seleccionar el que represente mejor la interacción que queremos detectar.

### 7.2. Registrar un manejador

El método `addEventListener()` permite ejecutar una función cuando se produce un evento:

```ts
const boton =
  document.querySelector<HTMLButtonElement>(
    ".boton-inscripcion"
  );

boton?.addEventListener("click", () => {
  console.log("El usuario quiere inscribirse");
});
```

`addEventListener()` recibe:

1. El nombre del evento.
2. La función que debe ejecutarse.

La función ejecutada recibe el nombre de **manejador** o *listener*.

### 7.3. Utilizar una función con nombre

También podemos declarar el manejador por separado:

```ts
function mostrarInscripcion(): void {
  console.log("Inscripción solicitada");
}

boton?.addEventListener(
  "click",
  mostrarInscripcion
);
```

Las funciones con nombre facilitan:

- La reutilización del manejador.
- La lectura del código.
- La eliminación posterior del evento.
- La realización de pruebas.

Podemos retirar el manejador mediante:

```ts
boton?.removeEventListener(
  "click",
  mostrarInscripcion
);
```

Para eliminarlo debemos proporcionar la misma función que utilizamos al registrarlo.

### 7.4. El objeto `Event`

El navegador proporciona información sobre el evento mediante un objeto:

```ts
boton?.addEventListener(
  "click",
  (evento: MouseEvent) => {
    console.log(evento.type);
    console.log(evento.target);
    console.log(evento.currentTarget);
  }
);
```

| Propiedad { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Significado { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| `type` | Tipo de evento producido. |
| `target` | Elemento en el que se originó. |
| `currentTarget` | Elemento cuyo manejador se está ejecutando. |
| `defaultPrevented` | Indica si se ha cancelado la acción predeterminada. |

### 7.5. `target` y `currentTarget`

Supongamos que un botón contiene un elemento interno:

```html
<button class="boton-inscripcion">
  <span>Inscribirme</span>
</button>
```

Si el usuario pulsa sobre el `<span>`:

- `target` puede ser el `<span>`.
- `currentTarget` será el `<button>` que tiene el manejador.

```ts
boton?.addEventListener(
  "click",
  (evento: MouseEvent) => {
    const botonPulsado =
      evento.currentTarget as HTMLButtonElement;

    console.log(botonPulsado.textContent);
  }
);
```

Como sabemos que el manejador está registrado en un botón, podemos realizar la aserción a `HTMLButtonElement`.

### 7.6. Añadir eventos a varios elementos

Podemos seleccionar todos los botones y registrar un manejador en cada uno:

```ts
const botones =
  document.querySelectorAll<HTMLButtonElement>(
    ".boton-inscripcion"
  );

botones.forEach((boton) => {
  boton.addEventListener(
    "click",
    mostrarInscripcion
  );
});
```

Si las tarjetas se generan antes de registrar los manejadores, los botones estarán disponibles y podrán seleccionarse correctamente.

### 7.7. Identificar el evento seleccionado

Cada botón se encuentra dentro de una tarjeta con un atributo `data-evento-id`.

Podemos localizarla mediante `closest()`:

```ts
function gestionarInscripcion(
  evento: MouseEvent
): void {
  const boton =
    evento.currentTarget as HTMLButtonElement;

  const tarjeta =
    boton.closest<HTMLElement>(".evento");

  const eventoId =
    tarjeta?.dataset.eventoId;

  console.log("Evento seleccionado:", eventoId);
}
```

Registramos la función en todos los botones:

```ts
botones.forEach((boton) => {
  boton.addEventListener(
    "click",
    gestionarInscripcion
  );
});
```

Los valores almacenados en `dataset` son cadenas de texto. Si necesitamos un número, debemos convertirlo:

```ts
const id = Number(eventoId);
```

### 7.8. Propagación y burbujeo

Los elementos HTML se encuentran anidados unos dentro de otros. Por ejemplo, el botón de inscripción está dentro de una tarjeta y la tarjeta está dentro del catálogo:

```html
<div id="catalogo">
  <article class="evento">
    <button class="boton-inscripcion">
      Inscribirme
    </button>
  </article>
</div>
```

Cuando pulsamos el botón, el evento se origina en él, pero no termina necesariamente en ese punto. Después puede ascender por sus elementos antecesores:

```text
button
  → article
    → div#catalogo
      → body
        → document
```

Este recorrido ascendente recibe el nombre de **burbujeo**.

Podemos comprobarlo registrando un manejador en cada nivel:

```ts
const catalogo =
  document.querySelector<HTMLElement>("#catalogo");

const tarjeta =
  document.querySelector<HTMLElement>(".evento");

const boton =
  document.querySelector<HTMLButtonElement>(
    ".boton-inscripcion"
  );

boton?.addEventListener("click", () => {
  console.log("1. Botón");
});

tarjeta?.addEventListener("click", () => {
  console.log("2. Tarjeta");
});

catalogo?.addEventListener("click", () => {
  console.log("3. Catálogo");
});
```

Al pulsar el botón, la consola mostrará:

```text
1. Botón
2. Tarjeta
3. Catálogo
```

Solo hemos realizado una pulsación, pero el mismo evento ha alcanzado los manejadores de sus elementos antecesores.

!!! ejemplo "Una burbuja que asciende"

    Podemos imaginar que el evento es una burbuja que nace en el elemento pulsado y asciende por la estructura del documento.

Esta propagación permite que un elemento padre detecte las acciones producidas en sus descendientes.

### 7.9. Detener el burbujeo

En algunas situaciones queremos que el evento sea gestionado únicamente por el elemento pulsado.

Supongamos que:

- Pulsar la tarjeta abre el detalle del evento.
- Pulsar el botón inicia la inscripción.

Si pulsamos el botón y no detenemos el burbujeo, podrían ejecutarse ambas acciones.

```ts
tarjeta?.addEventListener("click", () => {
  console.log("Abrir detalle del evento");
});

boton?.addEventListener(
  "click",
  (evento: MouseEvent) => {
    evento.stopPropagation();

    console.log("Iniciar inscripción");
  }
);
```

`stopPropagation()` impide que el evento continúe ascendiendo hasta la tarjeta y el catálogo.

La consola mostrará únicamente:

```text
Iniciar inscripción
```

!!! importante "`stopPropagation()` y `preventDefault()`"

    `stopPropagation()` detiene el recorrido del evento por los elementos antecesores. `preventDefault()` cancela una acción propia del navegador, como navegar mediante un enlace o enviar un formulario.

No debemos detener el burbujeo automáticamente. En muchas situaciones resulta útil que el evento llegue hasta un elemento padre.

### 7.10. Delegación de eventos

El burbujeo permite registrar un único manejador en el catálogo en lugar de añadir uno a cada botón.

```ts
const catalogo =
  document.querySelector<HTMLElement>("#catalogo");

catalogo?.addEventListener(
  "click",
  (evento: MouseEvent) => {
    console.log("Se ha pulsado algún elemento del catálogo");
  }
);
```

Cuando pulsamos un botón, el evento asciende hasta `#catalogo` y ejecuta su manejador.

El problema es que el usuario también puede pulsar sobre una imagen, un título o cualquier otro elemento. Por ello, debemos identificar dónde se originó la acción:

```ts
catalogo?.addEventListener(
  "click",
  (evento: MouseEvent) => {
    const elementoPulsado =
      evento.target as Element;

    const boton =
      elementoPulsado.closest<HTMLButtonElement>(
        ".boton-inscripcion"
      );

    if (boton === null) {
      return;
    }

    const tarjeta =
      boton.closest<HTMLElement>(".evento");

    console.log(
      "Evento seleccionado:",
      tarjeta?.dataset.eventoId
    );
  }
);
```

Este procedimiento recibe el nombre de **delegación de eventos**:

1. El usuario pulsa un botón.
2. El evento se origina en el botón.
3. El evento burbujea hasta el catálogo.
4. El catálogo recibe el evento.
5. El manejador comprueba si la pulsación procede de un botón.
6. Se localiza la tarjeta correspondiente.

| Registro individual { .table-content .table-bg-principal .table-cl-secundario } | Delegación { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| Un manejador por cada botón. | Un manejador en el catálogo. |
| Debe repetirse para nuevos botones. | Funciona también con botones creados posteriormente. |
| Más manejadores registrados. | Un único punto de control. |

!!! pregunta "Comprobación"

    Si TypeScript añade una nueva tarjeta después de registrar el manejador del catálogo, ¿será necesario registrar otro evento en su botón?

    No. El clic del nuevo botón también burbujeará hasta el catálogo.

### 7.11. Comportamiento predeterminado

Algunos elementos tienen una acción predeterminada:

- Un enlace navega a otra dirección.
- Un formulario envía sus datos.
- Una casilla cambia su estado.

El método `preventDefault()` cancela esa acción:

```ts
const enlace =
  document.querySelector<HTMLAnchorElement>(
    ".seccion-eventos__cabecera a"
  );

enlace?.addEventListener(
  "click",
  (evento: MouseEvent) => {
    evento.preventDefault();

    console.log("Navegación cancelada");
  }
);
```

`preventDefault()` no detiene la propagación. Son operaciones diferentes.

| Método { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Función { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| `preventDefault()` | Cancela la acción predeterminada. |
| `stopPropagation()` | Detiene la propagación del evento. |

### 7.12. Modificar la interfaz como respuesta

Un manejador puede cambiar el estado visual de una tarjeta:

```ts
function seleccionarTarjeta(
  evento: MouseEvent
): void {
  const elemento =
    evento.currentTarget as HTMLElement;

  elemento.classList.toggle("seleccionado");
}
```

```ts
const tarjetas =
  document.querySelectorAll<HTMLElement>(
    ".evento"
  );

tarjetas.forEach((tarjeta) => {
  tarjeta.addEventListener(
    "click",
    seleccionarTarjeta
  );
});
```

Podemos añadir el estilo correspondiente:

```css
.evento.seleccionado {
  outline: 3px solid #d76a20;
  transform: translateY(-4px);
}
```

La estructura y los estilos continúan definidos mediante HTML y CSS. TypeScript se limita a gestionar el comportamiento.

!!! actividad "Preparación de la actividad A04.03"

    En la siguiente actividad añadiremos interacción al catálogo de FestWeb mediante eventos, propagación, delegación y modificación de clases.


!!! salto-pagina-pdf ""