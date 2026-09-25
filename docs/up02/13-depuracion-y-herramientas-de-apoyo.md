---

title: UP02 · Fundamentos de JavaScript · Depuración y herramientas

---

La **depuración** es el proceso de localizar, analizar y corregir errores en un programa.

Cuando el resultado no es el esperado, no debemos modificar instrucciones al azar. Debemos observar qué está sucediendo, comprobar los valores y determinar en qué momento el comportamiento se desvía del previsto.

Las herramientas principales durante esta unidad serán:

- Visual Studio Code.
- La consola del navegador.
- El depurador de las herramientas de desarrollo.
- ESLint.
- Prettier.

### 13.1. Tipos de errores

Los errores pueden clasificarse en varios grupos.

#### Errores de sintaxis

Se producen cuando el código no respeta las reglas del lenguaje:

```js
const nombreEvento = "Festival Mediterránea;
```

JavaScript no puede interpretar correctamente la instrucción porque falta cerrar la cadena.

#### Errores de referencia

Se producen al utilizar un identificador que no existe o no está disponible:

```js
const precioEntrada = 35;

console.log(precioEntrda);
```

La variable declarada se llama `precioEntrada`, pero se intenta utilizar `precioEntrda`.

#### Errores de tipo

Se producen cuando intentamos realizar una operación que no corresponde al valor utilizado:

```js
const nombreEvento = null;

console.log(nombreEvento.toUpperCase());
```

`null` no dispone del método `toUpperCase()`.

#### Errores lógicos

El programa se ejecuta sin mostrar un error, pero el resultado es incorrecto:

```js
const precioEntrada = 35;
const cantidad = 3;

const total = precioEntrada + cantidad;

console.log(total);
```

El programa muestra `38`, aunque el importe debería calcularse mediante una multiplicación.

!!! importante "Errores lógicos"

    Los errores lógicos suelen ser los más difíciles de detectar porque JavaScript puede ejecutar el programa sin mostrar ningún mensaje de error.

### 13.2. Leer un mensaje de error

La consola proporciona información para localizar el problema.

Un mensaje puede tener un aspecto similar a este:

```text
Uncaught ReferenceError: precioEntrda is not defined
    at main.js:8:13
```

Podemos identificar:

- **Tipo de error:** `ReferenceError`.
- **Descripción:** `precioEntrda is not defined`.
- **Archivo:** `main.js`.
- **Línea:** `8`.
- **Columna:** `13`.

Al pulsar sobre el enlace del archivo, el navegador abre la línea donde se ha detectado el error.

El error puede haberse originado en una instrucción anterior, por lo que también debemos revisar el contexto.

!!! salto-pagina-pdf ""

### 13.3. Uso de la consola

La consola permite mostrar los valores que intervienen en una operación:

```js
const precioEntrada = 35;
const cantidad = "3";

console.log("precioEntrada:", precioEntrada);
console.log("cantidad:", cantidad);
console.log("tipo de cantidad:", typeof cantidad);
```

También podemos mostrar una expresión y su resultado:

```js
console.log(
  "Resultado de la operación:",
  precioEntrada * cantidad
);
```

Los mensajes deben ayudarnos a responder preguntas concretas:

- ¿Qué valor contiene la variable?
- ¿Qué tipo tiene?
- ¿Se ejecuta este bloque?
- ¿Cuántas veces se repite el bucle?
- ¿En qué momento cambia el resultado?
- ¿Qué condición se está evaluando?

Una vez localizado el error, eliminaremos los mensajes de depuración que ya no sean necesarios.

### 13.4. Puntos de interrupción

Un **punto de interrupción** detiene temporalmente la ejecución en una línea determinada.

Para añadirlo desde las herramientas de desarrollo:

1. Abrimos el panel **Fuentes** o **Sources**.
2. Localizamos el archivo `main.js`.
3. Pulsamos sobre el número de la línea.
4. Recargamos la aplicación.
5. La ejecución se detendrá antes de ejecutar esa instrucción.

!!! salto-pagina-pdf ""

Mientras el programa está detenido podemos:

- Consultar los valores de las variables.
- Comprobar su tipo.
- Analizar las expresiones.
- Observar el ámbito actual.
- Ejecutar el programa paso a paso.

### 13.5. Ejecución paso a paso

El depurador proporciona diferentes controles:

| Control { .table-main-column .table-bg-principal .table-cl-secundario } | Función { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|
| Continuar | Reanuda la ejecución hasta el siguiente punto de interrupción. |
| Paso siguiente | Ejecuta la instrucción actual y avanza a la siguiente. |
| Entrar | Accede al interior de una función llamada. |
| Salir | Finaliza la función actual y regresa al punto desde el que fue llamada. |
| Reiniciar | Vuelve a comenzar la ejecución. |

En esta unidad utilizaremos principalmente **Continuar** y **Paso siguiente**. Los controles relacionados con funciones se aprovecharán en unidades posteriores.

### 13.6. Inspección de variables

Cuando la ejecución está detenida, el panel de variables permite consultar los valores disponibles en cada ámbito.

También podemos añadir expresiones al panel de observación:

```js
entradasVendidas < aforoTotal
```

```js
precioEntrada * cantidad
```

El navegador volverá a calcularlas a medida que avancemos por el programa.

Esta posibilidad resulta especialmente útil para comprobar:

- Condiciones.
- Contadores.
- Acumuladores.
- Conversiones.
- Cálculos intermedios.

### 13.7. La instrucción `debugger`

La instrucción `debugger` detiene la ejecución cuando las herramientas de desarrollo están abiertas:

```js
const precioEntrada = 35;
const cantidad = 3;

debugger;

const total = precioEntrada * cantidad;

console.log(total);
```

Tiene un efecto similar a colocar un punto de interrupción desde el navegador.

Debe eliminarse cuando finalice la depuración:

```js
// No debe permanecer innecesariamente en la versión final.
// debugger;
```

### 13.8. Depurar bucles

Los bucles requieren una atención especial porque una instrucción se ejecuta varias veces.

Podemos mostrar la evolución de sus valores:

```js
let recaudacion = 0;
const precioEntrada = 25;

for (let venta = 1; venta <= 3; venta++) {
  recaudacion += precioEntrada;

  console.log({
    venta,
    recaudacion
  });
}
```

También podemos colocar un punto de interrupción dentro del bucle y avanzar iteración por iteración.

!!! salto-pagina-pdf ""

Debemos observar:

- El valor inicial del contador.
- La condición.
- La actualización.
- El número de iteraciones.
- La evolución del acumulador.
- El momento en el que termina el bucle.

### 13.9. Herramientas del editor

Visual Studio Code ayuda a detectar problemas antes de ejecutar el programa.

Puede señalar:

- Errores de sintaxis.
- Identificadores no utilizados.
- Problemas de formato.
- Instrucciones incompletas.
- Coincidencia de paréntesis, llaves y comillas.

El panel **Problemas** reúne los avisos detectados en los archivos del proyecto.

Sin embargo, que el editor no muestre advertencias no garantiza que el programa sea correcto. Los errores lógicos deben comprobarse mediante pruebas y depuración.

### 13.10. ESLint y Prettier

**ESLint** analiza el código y detecta posibles errores o incumplimientos de las reglas establecidas para el proyecto.

Puede advertir, por ejemplo, sobre:

- Variables declaradas que no se utilizan.
- Identificadores no definidos.
- Uso de operadores desaconsejados.
- Código difícil de mantener.
- Incumplimientos del estilo acordado.

!!! salto-pagina-pdf ""

**Prettier** aplica automáticamente un formato coherente:

- Indentación.
- Espacios.
- Saltos de línea.
- Distribución de expresiones.
- Uso uniforme de determinados elementos sintácticos.

Estas herramientas cumplen funciones diferentes:

| Herramienta { .table-main-column .table-bg-principal .table-cl-secundario } | Finalidad { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|
| ESLint | Analiza la calidad y determinados errores del código. |
| Prettier | Aplica un formato visual uniforme. |

Las herramientas ayudan a mejorar el código, pero no sustituyen su comprensión ni las pruebas.

### 13.11. Procedimiento de depuración

Cuando un programa no funcione correctamente seguiremos este proceso:

1. Reproducir el problema.
2. Leer los mensajes de la consola.
3. Identificar el archivo y la línea.
4. Formular una hipótesis sobre la causa.
5. Comprobar los valores implicados.
6. Añadir un punto de interrupción si es necesario.
7. Ejecutar paso a paso.
8. Corregir una única causa.
9. Volver a probar el programa.
10. Eliminar los mensajes temporales de depuración.

!!! importante "Modificar con intención"

    Antes de cambiar una instrucción debemos poder explicar qué creemos que está fallando y qué resultado esperamos obtener con la modificación.

### 13.12. Práctica de depuración

El siguiente programa intenta calcular el precio de una compra y comprobar si existe aforo suficiente, pero contiene varios errores:

```js
const precioEntrada = "35";
const cantidadEntradas = 3;
const aforoTotal = 5000;
let entradasVendidas = 4998;

const entradasDisponibles =
  aforoTotal + entradasVendidas;

const hayAforo =
  cantidadEntradas < entradasDisponibles;

if (hayaforo = true) {
  const importeFinal =
    precioEntrada + cantidadEntradas;

  console.log(
    `Importe final: ${importeFinal} €`
  );
} else {
  console.log("No hay suficientes entradas");
}

console.log(importeFinal);
```

!!! actividad "Actividad opcional"

    No reescribas directamente todo el programa. Sigue un proceso de depuración:

    1. Ejecútalo y lee el primer mensaje de error.
    2. Anota el tipo de error, el archivo y la línea.
    3. Corrige únicamente ese problema.
    4. Vuelve a ejecutar el programa.
    5. Utiliza puntos de interrupción para observar los valores.
    6. Localiza los errores lógicos.
    7. Comprueba el ámbito de `importeFinal`.
    8. Verifica que el resultado final sea correcto.
    9. Explica cada modificación realizada.

#### Resultado esperado

```text
No hay suficientes entradas
```

La compra solicita tres entradas, pero solamente quedan dos. Por tanto, el programa no debe calcular ni mostrar ningún importe.

!!! pregunta "Cierre de la unidad"

    Si un programa termina sin mostrar errores en la consola, ¿podemos asegurar que su comportamiento es correcto?