---

title: UP02 · Fundamentos de JavaScript · Elección del lenguaje

---

JavaScript es el lenguaje de programación utilizado de forma nativa por los navegadores web. Permite incorporar comportamiento a las páginas, procesar datos y responder a las acciones realizadas por las personas usuarias.

En FestWeb utilizaremos JavaScript para implementar la lógica de la aplicación. Por ejemplo, podremos calcular el precio de una inscripción, comprobar la disponibilidad de entradas o determinar si una persona cumple los requisitos de acceso a un evento.

### 3.1. ¿Por qué utilizamos JavaScript?

Los navegadores trabajan principalmente con tres tecnologías:

| Tecnología { .table-main-column .table-bg-principal .table-cl-secundario } | Responsabilidad { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|
| **HTML** | Define la estructura y el contenido. |
| **CSS** | Controla la presentación y la distribución visual. |
| **JavaScript** | Incorpora lógica, comportamiento e interactividad. |

JavaScript es la elección principal para el desarrollo web en entorno cliente porque:

- Puede ejecutarse directamente en los navegadores actuales.
- Está integrado con HTML y CSS.
- Permite responder a las acciones del usuario.
- Puede modificar dinámicamente el contenido de una página.
- Permite realizar cálculos y procesar datos.
- Puede comunicarse con servidores web.
- Dispone de un amplio ecosistema de herramientas, librerías y frameworks.
- Puede utilizarse en distintos tipos de aplicaciones.

!!! ejemplo "Ejemplo en FestWeb"

    HTML puede mostrar el precio de una entrada y CSS puede determinar su apariencia. JavaScript permite calcular el importe total cuando una persona selecciona varias entradas.

!!! salto-pagina-pdf ""

### 3.2. Características principales

JavaScript presenta las siguientes características:

- Es un lenguaje de propósito general.
- Distingue entre mayúsculas y minúsculas.
- Utiliza tipado dinámico.
- Permite trabajar con distintos paradigmas de programación.
- Está basado en objetos y prototipos.
- Puede ejecutar código en respuesta a eventos.
- Dispone de gestión automática de memoria.
- Puede ejecutarse tanto en el navegador como en otros entornos.

Los motores actuales no se limitan a interpretar el código línea por línea. Combinan técnicas de interpretación y compilación dinámica para optimizar su ejecución.

!!! importante "JavaScript y Java"

    JavaScript y Java son lenguajes diferentes. Aunque sus nombres son similares y comparten algunos elementos de sintaxis, tienen características, entornos de ejecución y finalidades distintas.

### 3.3. Tipado dinámico

JavaScript permite que una variable contenga valores de distintos tipos durante la ejecución:

```js
let datoEvento = "Festival Mediterránea";
datoEvento = 35;
datoEvento = true;
```

En este ejemplo, la misma variable contiene primero una cadena de texto, después un número y finalmente un valor lógico.

Esta flexibilidad permite escribir código con rapidez, pero también puede producir errores difíciles de detectar. Por ello, durante el curso seguiremos unas reglas claras de escritura y utilizaremos posteriormente TypeScript para añadir comprobaciones de tipos.

!!! salto-pagina-pdf ""

### 3.4. JavaScript y ECMAScript

**ECMAScript** es la especificación que define la sintaxis, los tipos de datos y el comportamiento del lenguaje. JavaScript sigue y aplica las características establecidas por esta especificación.

ECMAScript define aspectos como:

- La sintaxis del lenguaje.
- Los tipos de datos.
- Los operadores.
- Las estructuras de control.
- Las funciones.
- Los objetos incorporados.
- Los módulos.
- Las promesas y otros mecanismos del lenguaje.

Desde ECMAScript 2015 se publican revisiones periódicas que incorporan mejoras de forma progresiva. Algunas características ampliamente utilizadas son:

- `let` y `const`.
- Plantillas literales.
- Funciones flecha.
- Clases.
- Módulos.
- Promesas.
- Desestructuración.
- Operadores de propagación y agrupación.

Estas características se estudiarán progresivamente cuando sean necesarias.

### 3.5. Compatibilidad entre navegadores

No todos los navegadores incorporan las nuevas características al mismo tiempo. Antes de utilizar una funcionalidad reciente debemos comprobar si está disponible en los navegadores que utilizará nuestra aplicación.

Podemos consultar herramientas como:

- [Can I use](https://caniuse.com/), para comprobar la compatibilidad de características web.
- [MDN Web Docs](https://developer.mozilla.org/es/docs/Web/JavaScript), para consultar documentación y ejemplos de JavaScript.

Las herramientas modernas de desarrollo también pueden transformar código reciente en código compatible con navegadores anteriores. Este proceso se denomina **transpilación**.

### 3.6. JavaScript y TypeScript

TypeScript amplía JavaScript mediante un sistema de tipos y otras herramientas de comprobación. El navegador no ejecuta directamente TypeScript: antes debe transformarse en JavaScript.

La relación puede resumirse así:

```text
Código TypeScript → transpilación → código JavaScript → navegador
```

Durante las primeras unidades trabajaremos con JavaScript para comprender el funcionamiento real del lenguaje. Posteriormente incorporaremos TypeScript para desarrollar aplicaciones más seguras y fáciles de mantener.

!!! pregunta "Pregunta"

    Si TypeScript termina convirtiéndose en JavaScript, ¿por qué es necesario comprender primero JavaScript?

### 3.7. Elección para FestWeb

Utilizaremos JavaScript en esta primera etapa de FestWeb porque:

- Puede ejecutarse directamente en el navegador.
- Permite aprender los fundamentos del lenguaje sin añadir inicialmente un sistema de tipos.
- Facilita la experimentación desde la consola.
- Es la base de TypeScript.
- Es necesario para comprender el DOM, los eventos y las API del navegador.
- Constituye la base sobre la que posteriormente trabajaremos con Vue.

!!! actividad "Actividad opcional"

    Responde brevemente:

    1. ¿Qué responsabilidad tiene JavaScript dentro de una aplicación web?
    2. ¿Por qué JavaScript es adecuado para la programación en el navegador?
    3. ¿Qué significa que sea un lenguaje de tipado dinámico?
    4. ¿Qué relación existe entre JavaScript y ECMAScript?
    5. ¿Qué relación existe entre JavaScript y TypeScript?
    6. ¿Por qué debemos comprobar la compatibilidad entre navegadores?

!!! salto-pagina-pdf ""