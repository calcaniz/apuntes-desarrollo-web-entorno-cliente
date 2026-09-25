---

title: UP02 · Fundamentos de JavaScript · Introducción

---

En la unidad anterior estudiamos cómo funciona una aplicación web, qué tareas realiza el navegador y cómo se integran HTML, CSS y JavaScript. En esta unidad comenzaremos a utilizar JavaScript como lenguaje de programación.

HTML permite definir la estructura y el contenido de una página, mientras que CSS se encarga de su presentación. JavaScript incorpora la lógica necesaria para procesar datos, tomar decisiones, repetir operaciones y responder ante diferentes situaciones.

!!! pregunta "Pregunta de partida"

    ¿Cómo puede una aplicación decidir si quedan entradas disponibles, calcular el precio de una compra o comprobar si una persona cumple los requisitos para inscribirse en un evento?

### 2.1. ¿Qué aprenderemos?

A lo largo de la unidad aprenderemos a:

- Declarar variables y constantes.
- Reconocer los principales tipos de datos de JavaScript.
- Construir expresiones utilizando operadores.
- Convertir datos de un tipo a otro.
- Comprender dónde puede utilizarse cada variable.
- Tomar decisiones mediante estructuras condicionales.
- Repetir operaciones mediante bucles.
- Escribir comentarios útiles y código legible.
- Ejecutar y depurar programas desde el navegador.
- Interpretar los errores mostrados en la consola.

!!! salto-pagina-pdf ""

### 2.2. Proyecto guía: FestWeb

Los conceptos de la unidad se aplicarán sobre **FestWeb**, una aplicación destinada a la publicación y gestión de eventos.

Inicialmente representaremos un evento mediante variables independientes:

```js
const nombreEvento = "Festival Mediterránea";
const categoria = "Música";
const precioEntrada = 35;
const aforoTotal = 5000;
let entradasVendidas = 3200;
const requiereMayoriaEdad = false;
```

A partir de estos datos podremos realizar operaciones como:

- Calcular cuántas entradas quedan disponibles.
- Obtener la recaudación correspondiente a las entradas vendidas.
- Comprobar si un evento está completo.
- Aplicar descuentos según determinadas condiciones.
- Controlar si una persona puede realizar una inscripción.
- Simular la venta de varias entradas.

```js
const entradasDisponibles = aforoTotal - entradasVendidas;
const recaudacion = precioEntrada * entradasVendidas;

console.log(`Quedan ${entradasDisponibles} entradas`);
console.log(`La recaudación actual es de ${recaudacion} €`);
```

Inicialmente utilizaremos variables independientes. Las funciones, colecciones, objetos y clases se estudiarán en unidades posteriores, cuando dispongamos de los conocimientos necesarios para organizar aplicaciones más complejas.

!!! salto-pagina-pdf ""