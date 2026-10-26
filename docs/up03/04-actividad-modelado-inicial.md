---

title: A03.01 · Modelado inicial de FestWeb

---

## 4. Actividad guiada: modelado inicial de FestWeb

En esta actividad transformaremos un conjunto de variables independientes en un modelo de datos tipado con TypeScript.

La actividad se realizará mediante **live coding** y no será calificable.

| Actividad { .table-main-column .table-bg-principal .table-cl-secundario } | Información { .table-full-container .table-bg-principal .table-cl-secundario }|
|---|---|
| **Código** | A03.01 |
| **Modalidad** | Guiada y formativa |
| **Duración** | 45 minutos |
| **Criterios relacionados** | CE04-f · CE04-g |

### 4.1. Situación inicial

FestWeb utiliza las siguientes variables para almacenar la información de un evento:

```js
const id = 1;
const nombre = "Festival Mediterránea";
const categoria = "Música";
const precioEntrada = 35;
const aforoTotal = 5000;
const entradasVendidas = 3200;
const requiereMayoriaEdad = false;
const ubicacion = "Cullera";
```

El objetivo es sustituir estas variables por un único objeto cuya estructura esté controlada por TypeScript.

### 4.2. Tareas

Durante el desarrollo guiado realizaremos los siguientes pasos:

1. Crear un tipo unión para limitar la categoría del evento a:

    - Música.
    - Tecnología.
    - Gastronomía.
    - Deporte.

2. Definir una interfaz llamada `Evento`.

3. Incorporar a la interfaz las propiedades necesarias.

4. Establecer los tipos adecuados para cada propiedad.

5. Marcar `id` como propiedad de solo lectura.

6. Convertir `ubicacion` en una propiedad opcional.

7. Crear un objeto llamado `eventoPrincipal` que cumpla la interfaz.

8. Crear un segundo evento sin indicar su ubicación.

9. Acceder a diferentes propiedades mediante la notación de punto.

10. Intentar realizar asignaciones incorrectas y observar los mensajes mostrados por TypeScript.

### 4.3. Comprobaciones

Probaremos qué sucede al intentar:

```ts
eventoPrincipal.id = 20;
```

```ts
eventoPrincipal.precioEntrada = "gratuito";
```

```ts
eventoPrincipal.categoria = "Cine";
```

Después responderemos:

1. ¿Qué error detecta TypeScript en cada caso?
2. ¿Qué diferencia existe entre una propiedad opcional y una propiedad cuyo valor es `undefined`?
3. ¿Qué ventaja aporta la interfaz frente al uso de variables independientes?
4. ¿Qué información desaparece cuando TypeScript transpila el código a JavaScript?

### 4.4. Resultado esperado

Al finalizar la actividad tendremos:

- Un tipo unión para las categorías.
- Una interfaz que describa los eventos de FestWeb.
- Dos objetos válidos basados en esa interfaz.
- Propiedades obligatorias, opcionales y de solo lectura.
- Varias comprobaciones de errores realizadas desde el editor.

!!! reto "Ampliación opcional"

    Añade un estado al evento cuyos únicos valores posibles sean `programado`, `agotado` o `cancelado`.