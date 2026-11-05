---

title: A04.01 · Radiografía de FestWeb

---

## A04.01. Radiografía de FestWeb

En esta actividad crearemos un proyecto Vite con TypeScript, incorporaremos una estructura HTML de FestWeb previamente preparada y utilizaremos el BOM y el DOM para inspeccionar y seleccionar sus elementos.

La actividad se realizará mediante **programación guiada** durante la sesión síncrona.

### 1. Información de la actividad

| Elemento { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Descripción { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| Tipo | Actividad formativa guiada |
| Duración | 1 hora |
| Agrupamiento | Grupo-clase |
| Herramientas | Vite, TypeScript y DevTools |
| Resultado | Creación del proyecto y selección de elementos de FestWeb |

### 2. Crear el proyecto

Abre una terminal en el directorio donde guardes las actividades de la unidad y ejecuta:

```bash
npm create vite@latest a04-01-radiografia-festweb -- --template vanilla-ts
```

Accede al proyecto e instala sus dependencias:

```bash
cd a04-01-radiografia-festweb
npm install
```

Abre el proyecto con Visual Studio Code:

```bash
code .
```

Inicia el servidor de desarrollo:

```bash
npm run dev
```

Comprueba que la página inicial de Vite se abre correctamente antes de continuar.

### 3. Descargar e incorporar el esquema de FestWeb

Descarga el esquema preparado para la actividad:

[Descargar esquema de FestWeb](../recursos/esquema-festweb-a0401.zip){ .md-button .md-button--primary download }

Descomprime el archivo. Dentro encontrarás esta estructura:

```text
esquema-festweb/
├── public/
│   └── imagenes/
├── src/
│   ├── main.ts
│   └── style.css
└── index.html
```

Copia su contenido dentro del proyecto Vite:

1. Sustituye el archivo `index.html`.
2. Sustituye `src/main.ts`.
3. Sustituye `src/style.css`.
4. Copia la carpeta `imagenes` dentro de `public`.

La estructura final debe ser semejante a esta:

```text
a04-01-radiografia-festweb/
├── public/
│   └── imagenes/
├── src/
│   ├── main.ts
│   └── style.css
├── index.html
├── package.json
└── tsconfig.json
```

Inicia el servidor de desarrollo:

```bash
npm run dev
```

Antes de continuar, comprueba que:

- FestWeb se muestra correctamente.
- Las imágenes se cargan.
- Los estilos se aplican.
- La consola no contiene errores.

!!! importante "No modificar todavía el HTML"

    El esquema contiene los identificadores, clases y atributos necesarios. En esta actividad aprenderemos a localizar sus elementos sin modificar su estructura.

### 4. Analizar la estructura HTML

Abre las herramientas de desarrollo y accede al panel **Elementos**.

Localiza visualmente:

- La cabecera.
- El logotipo.
- La barra de navegación.
- El contenedor principal.
- El catálogo de eventos.
- Las tarjetas de evento.
- Los botones de inscripción.
- El pie de página.

Para cada elemento, identifica qué selector permitiría localizarlo:

| Elemento { .table-main-column .table-content .table-bg-principal .table-cl-secundario } | Selector posible { .table-full-container .table-content .table-bg-principal .table-cl-secundario } |
|---|---|
| Cabecera |  |
| Navegación |  |
| Catálogo |  |
| Primera tarjeta |  |
| Botones de inscripción |  |
| Pie de página |  |

### 5. Consultar información del navegador

Completa las instrucciones para mostrar en la consola:

1. La dirección completa de la página.
2. El protocolo utilizado.
3. El idioma del navegador.
4. El estado de la conexión.
5. El ancho y el alto de la pantalla.

```ts
console.log("URL:", /* TODO */);
console.log("Protocolo:", /* TODO */);
console.log("Idioma:", /* TODO */);
console.log("Con conexión:", /* TODO */);
console.log("Anchura:", /* TODO */);
console.log("Altura:", /* TODO */);
```

!!! pregunta "Comprobación"

    ¿Qué objetos del BOM hemos utilizado para obtener esta información?

### 6. Seleccionar elementos únicos

Completa los selectores necesarios:

```ts
const cabecera =
  document.querySelector<HTMLElement>(/* TODO */);

const logotipo =
  document.querySelector<HTMLImageElement>(/* TODO */);

const catalogo =
  document.querySelector<HTMLElement>(/* TODO */);

const tituloCatalogo =
  document.querySelector<HTMLHeadingElement>(/* TODO */);

const piePagina =
  document.querySelector<HTMLElement>(/* TODO */);
```

Muestra los resultados:

```ts
console.log("Cabecera:", cabecera);
console.log("Logotipo:", logotipo);
console.log("Catálogo:", catalogo);
console.log("Título:", tituloCatalogo);
console.log("Pie:", piePagina);
```

Si alguno muestra `null`, revisa el selector mediante el panel **Elementos**.

### 7. Seleccionar colecciones

Selecciona todos los elementos de cada grupo:

```ts
const enlacesNavegacion =
  document.querySelectorAll<HTMLAnchorElement>(/* TODO */);

const tarjetas =
  document.querySelectorAll<HTMLElement>(/* TODO */);

const botonesInscripcion =
  document.querySelectorAll<HTMLButtonElement>(/* TODO */);

const titulosEventos =
  document.querySelectorAll<HTMLHeadingElement>(/* TODO */);
```

Recorre las colecciones:

```ts
enlacesNavegacion.forEach((enlace) => {
  console.log(enlace.textContent, enlace.href);
});

titulosEventos.forEach((titulo) => {
  console.log(titulo.textContent);
});
```

!!! pregunta "Comprobación"

    ¿Qué diferencia existe entre el resultado de `querySelector()` y el de `querySelectorAll()`?

### 8. Realizar una búsqueda contextualizada

Selecciona la primera tarjeta y busca únicamente dentro de ella:

- El título.
- La localidad.
- El botón de inscripción.

```ts
const primeraTarjeta =
  document.querySelector<HTMLElement>(".evento");

if (primeraTarjeta !== null) {
  const titulo =
    primeraTarjeta.querySelector<HTMLHeadingElement>(/* TODO */);

  const localidad =
    primeraTarjeta.querySelector<HTMLElement>(/* TODO */);

  const boton =
    primeraTarjeta.querySelector<HTMLButtonElement>(/* TODO */);

  console.log(titulo?.textContent);
  console.log(localidad?.textContent);
  console.log(boton);
}
```

Esta búsqueda evita seleccionar elementos pertenecientes a otras tarjetas.

### 9. Recorrer las relaciones del DOM

Partiendo del primer botón de inscripción:

1. Localiza la tarjeta que lo contiene mediante `closest()`.
2. Consulta el elemento padre de la tarjeta.
3. Consulta su siguiente elemento hermano.
4. Comprueba si tiene la clase `.destacado`.

```ts
const boton =
  document.querySelector<HTMLButtonElement>(".boton-inscripcion");

const tarjeta =
  boton?.closest<HTMLElement>(/* TODO */);

console.log("Tarjeta:", tarjeta);
console.log("Padre:", /* TODO */);
console.log("Siguiente:", /* TODO */);
console.log("Es destacada:", /* TODO */);
```

### 10. Resultado esperado

Al finalizar la actividad deberás ser capaz de:

- Crear un proyecto Vite con TypeScript.
- Incorporar un esquema HTML previamente preparado.
- Inspeccionar el documento desde DevTools.
- Consultar información básica del navegador.
- Seleccionar uno o varios elementos.
- Realizar búsquedas dentro de un contenedor.
- Recorrer relaciones entre elementos del DOM.
- Detectar y corregir selectores que devuelven `null`.

### 11. Cierre de la actividad

Responde oralmente:

1. ¿Qué archivo contiene la estructura inicial de FestWeb?
2. ¿Qué selector utilizarías para localizar un elemento único?
3. ¿Cómo seleccionarías todas las tarjetas?
4. ¿Por qué un selector puede devolver `null`?
5. ¿Qué ventaja tiene buscar dentro de una tarjeta?
6. ¿Para qué se utiliza `closest()`?
7. ¿Qué información pertenece al BOM y cuál al DOM?

!!! nota "Actividad formativa"

    Esta actividad no se califica. Su finalidad es preparar la modificación y creación dinámica de elementos del siguiente apartado.

!!! salto-pagina-pdf ""