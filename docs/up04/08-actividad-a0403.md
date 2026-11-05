---

title: A04.03 · Catálogo interactivo

---

En esta actividad añadiremos interacción al catálogo dinámico de FestWeb. Utilizaremos un único manejador en el catálogo para detectar qué tarjeta o botón ha pulsado el usuario.

La actividad se realizará mediante **programación guiada** durante la sesión síncrona.

### 1. Información de la actividad

| Elemento { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Descripción { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| Tipo | Actividad formativa guiada |
| Duración | 1 hora |
| Agrupamiento | Grupo-clase |
| Herramientas | Vite, TypeScript y DevTools |
| Punto de partida | Proyecto utilizado en A04.02 |
| Resultado | Catálogo interactivo mediante delegación de eventos |

### 2. Preparar el proyecto

Realiza una copia del proyecto anterior y cambia el nombre de la carpeta:

```text
a04-03-catalogo-interactivo
```

Abre una terminal dentro del proyecto e inicia el servidor:

```bash
npm run dev
```

Comprueba que las tres tarjetas se generan correctamente desde TypeScript.

### 3. Añadir una zona de mensajes

En `index.html`, añade el siguiente elemento después del catálogo:

```html
<p
  id="mensaje-interaccion"
  class="mensaje-interaccion"
  aria-live="polite"
>
  Selecciona un evento para consultar sus datos.
</p>
```

El atributo `aria-live="polite"` permite que las tecnologías de asistencia anuncien los cambios realizados en el mensaje.

Añade los siguientes estilos a `style.css`:

```css
.evento {
  transition:
    transform 0.2s ease,
    outline 0.2s ease;
}

.evento.seleccionado {
  outline: 3px solid #d76a20;
  transform: translateY(-4px);
}

.evento.inscrito {
  border-color: #248a54;
}

.mensaje-interaccion {
  margin-top: 1.5rem;
  padding: 1rem;
  border-left: 4px solid #d76a20;
  background-color: #ffffff;
}

.boton-inscripcion:disabled {
  color: #ffffff;
  background-color: #248a54;
  cursor: not-allowed;
}
```

### 4. Seleccionar los elementos necesarios

En `main.ts`, selecciona el catálogo y la zona de mensajes:

```ts
const catalogo =
  document.querySelector<HTMLElement>("#catalogo");

const mensaje =
  document.querySelector<HTMLParagraphElement>(
    "#mensaje-interaccion"
  );

if (catalogo === null || mensaje === null) {
  throw new Error(
    "No se han encontrado los elementos de la interfaz"
  );
}
```

Estas selecciones deben realizarse después de generar las tarjetas.

### 5. Registrar un único manejador

Registra un evento `click` sobre el catálogo:

```ts
catalogo.addEventListener(
  "click",
  gestionarInteraccionCatalogo
);
```

Declara la función que recibirá todas las pulsaciones producidas dentro del catálogo:

```ts
function gestionarInteraccionCatalogo(
  evento: MouseEvent
): void {
  // TODO: identificar el elemento pulsado.
}
```

Gracias al burbujeo, las pulsaciones producidas dentro de las tarjetas llegarán hasta el catálogo.

### 6. Identificar el elemento pulsado

La propiedad `target` puede contener distintos tipos de nodos. Comprueba que se trata de un elemento:

```ts
function gestionarInteraccionCatalogo(
  evento: MouseEvent
): void {
  if (!(evento.target instanceof Element)) {
    return;
  }

  const elementoPulsado = evento.target;

  console.log("Elemento pulsado:", elementoPulsado);
}
```

Utilizar `instanceof Element` evita realizar una aserción sin comprobar previamente el tipo.

### 7. Detectar el botón de inscripción

Busca el botón más próximo al elemento pulsado:

```ts
const boton =
  elementoPulsado.closest<HTMLButtonElement>(
    ".boton-inscripcion"
  );
```

El usuario puede pulsar directamente sobre el botón o sobre un elemento situado dentro de él. `closest()` permite localizarlo en ambos casos.

Si se ha pulsado un botón, localiza su tarjeta:

```ts
if (boton !== null) {
  const tarjeta =
    boton.closest<HTMLElement>(".evento");

  if (tarjeta === null) {
    return;
  }

  gestionarInscripcion(tarjeta, boton);

  return;
}
```

El `return` evita que la misma pulsación se procese también como una selección normal de la tarjeta.

### 8. Gestionar la inscripción

Declara una función con dos responsabilidades:

- Actualizar la apariencia de la tarjeta.
- Mostrar un mensaje de confirmación.

```ts
function gestionarInscripcion(
  tarjeta: HTMLElement,
  boton: HTMLButtonElement
): void {
  const eventoId =
    tarjeta.dataset.eventoId;

  // TODO: localizar el evento dentro del listado.

  // TODO: añadir la clase "inscrito".

  // TODO: desactivar el botón.

  // TODO: cambiar el texto del botón.

  // TODO: mostrar el mensaje de confirmación.
}
```

Localiza el objeto mediante su identificador:

```ts
const eventoSeleccionado = eventos.find(
  (evento) => evento.id === Number(eventoId)
);
```

Comprueba que se ha encontrado:

```ts
if (eventoSeleccionado === undefined) {
  mensaje.textContent =
    "No se ha podido identificar el evento.";

  return;
}
```

Después actualiza la interfaz utilizando:

```ts
tarjeta.classList.add(/* TODO */);
boton.disabled = /* TODO */;
boton.textContent = /* TODO */;
mensaje.textContent = /* TODO */;
```

El mensaje debe incluir el nombre del evento seleccionado.

### 9. Detectar la selección de una tarjeta

Si no se ha pulsado un botón, comprueba si la pulsación se ha realizado dentro de una tarjeta:

```ts
const tarjeta =
  elementoPulsado.closest<HTMLElement>(".evento");

if (tarjeta === null) {
  return;
}
```

Antes de seleccionar la nueva tarjeta, elimina la clase `.seleccionado` de las anteriores:

```ts
catalogo
  .querySelectorAll<HTMLElement>(
    ".evento.seleccionado"
  )
  .forEach((elemento) => {
    elemento.classList.remove("seleccionado");
  });
```

Añade la clase a la tarjeta pulsada:

```ts
tarjeta.classList.add("seleccionado");
```

Localiza el evento correspondiente y muestra su información:

```ts
const eventoId =
  Number(tarjeta.dataset.eventoId);

const eventoSeleccionado =
  eventos.find((evento) => evento.id === eventoId);

if (eventoSeleccionado !== undefined) {
  mensaje.textContent =
    `${eventoSeleccionado.nombre} · ` +
    `${eventoSeleccionado.localidad} · ` +
    `${eventoSeleccionado.fecha}`;
}
```

### 10. Completar el manejador

La estructura final del manejador será:

```ts
function gestionarInteraccionCatalogo(
  evento: MouseEvent
): void {
  if (!(evento.target instanceof Element)) {
    return;
  }

  const elementoPulsado = evento.target;

  const boton =
    elementoPulsado.closest<HTMLButtonElement>(
      ".boton-inscripcion"
    );

  if (boton !== null) {
    const tarjeta =
      boton.closest<HTMLElement>(".evento");

    if (tarjeta !== null) {
      gestionarInscripcion(tarjeta, boton);
    }

    return;
  }

  const tarjeta =
    elementoPulsado.closest<HTMLElement>(".evento");

  if (tarjeta === null) {
    return;
  }

  // TODO: desmarcar las tarjetas anteriores.

  // TODO: seleccionar la tarjeta pulsada.

  // TODO: localizar el evento.

  // TODO: mostrar sus datos.
}
```

### 11. Comprobar el burbujeo

Añade temporalmente este mensaje al principio del manejador:

```ts
console.log(
  "El catálogo ha recibido una pulsación desde:",
  evento.target
);
```

Realiza pulsaciones sobre:

- La imagen.
- El título.
- La localidad.
- El botón.

En todos los casos, el evento debe llegar hasta el catálogo.

Después de comprobarlo, elimina el `console.log()`.

!!! pregunta "Comprobación"

    ¿Por qué el catálogo puede detectar una pulsación realizada sobre un botón situado dentro de una tarjeta?

### 12. Comportamiento esperado

La aplicación debe funcionar de la siguiente manera:

1. Al pulsar una tarjeta, queda seleccionada.
2. La selección anterior se elimina.
3. Se muestran los datos del evento seleccionado.
4. Al pulsar `Inscribirme`, la tarjeta cambia de estado.
5. El botón queda desactivado.
6. El texto del botón cambia a `Inscrito`.
7. Se muestra un mensaje de confirmación.
8. Los botones creados dinámicamente funcionan sin registrar eventos individuales.

### 13. Comprobaciones finales

Comprueba desde DevTools que:

- El catálogo tiene un único manejador.
- Las tarjetas no tienen manejadores individuales.
- Solo existe una tarjeta con la clase `.seleccionado`.
- Las tarjetas inscritas reciben la clase `.inscrito`.
- Los botones utilizados quedan desactivados.
- Los atributos `data-evento-id` permiten identificar los eventos.
- La consola no muestra errores.

### 14. Resultado esperado

Al finalizar la actividad deberás ser capaz de:

- Registrar un manejador mediante `addEventListener()`.
- Utilizar el objeto `MouseEvent`.
- Diferenciar el elemento pulsado del elemento que gestiona el evento.
- Comprender el burbujeo.
- Aplicar delegación de eventos.
- Localizar elementos mediante `closest()`.
- Identificar datos mediante `dataset`.
- Modificar clases, propiedades y contenido como respuesta a una acción.

### 15. Cierre de la actividad

Responde oralmente:

1. ¿Dónde se ha registrado el manejador?
2. ¿Por qué no necesitamos un manejador para cada botón?
3. ¿Cómo llega el evento desde el botón hasta el catálogo?
4. ¿Qué contiene `evento.target`?
5. ¿Para qué utilizamos `closest()`?
6. ¿Por qué se realiza un `return` después de gestionar el botón?
7. ¿Cómo identificamos el objeto correspondiente a una tarjeta?
8. ¿Funcionaría la delegación con una tarjeta añadida posteriormente?

!!! nota "Actividad formativa"

    Esta actividad no se califica. Su finalidad es preparar la gestión de formularios y validación del siguiente apartado.

!!! salto-pagina-pdf ""