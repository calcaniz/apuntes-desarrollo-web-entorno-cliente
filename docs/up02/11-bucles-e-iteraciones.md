---

title: UP02 · Fundamentos de JavaScript · Bucles e iteraciones

---

Los bucles permiten ejecutar un bloque de instrucciones varias veces. Son útiles cuando una operación debe repetirse mientras se cumpla una condición o durante un número determinado de iteraciones.

En FestWeb podemos utilizar bucles para:

- Simular la venta de varias entradas.
- Numerar las entradas de una compra.
- Acumular una recaudación.
- Repetir una solicitud hasta obtener un valor válido.
- Recorrer los caracteres de un código de inscripción.
- Contabilizar cuántas operaciones cumplen una condición.

### 11.1. Elementos de un bucle

Un bucle controlado mediante un contador suele necesitar tres elementos:

1. **Inicialización:** establece el valor inicial.
2. **Condición:** determina si el bucle debe continuar.
3. **Actualización:** modifica el valor que controla la repetición.

```js
let numeroEntrada = 1;

while (numeroEntrada <= 3) {
  console.log(`Entrada ${numeroEntrada}`);
  numeroEntrada++;
}
```

En este ejemplo:

- La inicialización es `let numeroEntrada = 1`.
- La condición es `numeroEntrada <= 3`.
- La actualización es `numeroEntrada++`.

La consola muestra:

```text
Entrada 1
Entrada 2
Entrada 3
```

Cada ejecución del bloque recibe el nombre de **iteración**.

!!! salto-pagina-pdf ""

### 11.2. Bucle `while`

El bucle `while` repite un bloque mientras la condición sea verdadera.

```js
while (condicion) {
  // Instrucciones que se repiten.
}
```

Ejemplo:

```js
let entradasDisponibles = 3;

while (entradasDisponibles > 0) {
  console.log(`Quedan ${entradasDisponibles} entradas`);
  entradasDisponibles--;
}
```

La condición se comprueba antes de cada iteración. Por tanto, el bloque puede no ejecutarse ninguna vez.

```js
let entradasDisponibles = 0;

while (entradasDisponibles > 0) {
  console.log("Venta realizada");
}
```

En este caso, el bloque no se ejecuta porque la condición es falsa desde el principio.

Utilizaremos `while` cuando:

- No conozcamos inicialmente el número exacto de repeticiones.
- La repetición dependa de una condición.
- Sea posible que el bloque no tenga que ejecutarse.

### 11.3. Bucle `do...while`

El bucle `do...while` comprueba la condición después de ejecutar el bloque:

```js
do {
  // Instrucciones que se repiten.
} while (condicion);
```

Ejemplo:

```js
let intento = 1;

do {
  console.log(`Intento número ${intento}`);
  intento++;
} while (intento <= 3);
```

El bloque se ejecuta al menos una vez, aunque la condición sea falsa desde el principio.

```js
let entradasDisponibles = 0;

do {
  console.log("Comprobando disponibilidad");
} while (entradasDisponibles > 0);
```

El mensaje se muestra una vez.

Utilizaremos `do...while` cuando la operación deba realizarse al menos una vez antes de comprobar si continúa.

### 11.4. Bucle `for`

El bucle `for` reúne la inicialización, la condición y la actualización en una única línea:

```js
for (inicializacion; condicion; actualizacion) {
  // Instrucciones que se repiten.
}
```

Ejemplo:

```js
for (let numeroEntrada = 1; numeroEntrada <= 3; numeroEntrada++) {
  console.log(`Entrada ${numeroEntrada}`);
}
```

El orden de ejecución es:

1. Se ejecuta la inicialización una sola vez.
2. Se comprueba la condición.
3. Se ejecuta el bloque si la condición es verdadera.
4. Se realiza la actualización.
5. Se vuelve a comprobar la condición.

Utilizaremos `for` cuando conozcamos el número de repeticiones o trabajemos con un contador claramente definido.

!!! salto-pagina-pdf ""

### 11.5. Elegir el bucle adecuado

| Situación { .table-main-column .table-bg-principal .table-cl-secundario } | Bucle recomendado { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|
| Conocemos el número de repeticiones | `for` |
| Repetimos mientras se cumpla una condición | `while` |
| El bloque debe ejecutarse al menos una vez | `do...while` |
| Recorremos los valores de un elemento iterable | `for...of` |

En muchos casos pueden utilizarse distintos tipos de bucle. Elegiremos el que exprese con mayor claridad la intención del programa.

### 11.6. Contadores

Un contador almacena el número de veces que se produce una situación.

```js
let inscripcionesAceptadas = 0;

for (let intento = 1; intento <= 5; intento++) {
  inscripcionesAceptadas++;
}

console.log(inscripcionesAceptadas);
```

!!! salto-pagina-pdf ""

También puede incrementarse únicamente cuando se cumple una condición:

```js
let entradasVendidas = 0;

for (let numero = 1; numero <= 5; numero++) {
  if (numero !== 3) {
    entradasVendidas++;
  }
}

console.log(entradasVendidas);
```

El contador comienza normalmente en `0` y aumenta cuando se produce el hecho que queremos contabilizar.

### 11.7. Acumuladores

Un acumulador conserva el resultado total de varias operaciones.

```js
let recaudacion = 0;
const precioEntrada = 35;

for (let venta = 1; venta <= 3; venta++) {
  recaudacion += precioEntrada;
}

console.log(recaudacion);
```

En cada iteración se añade el precio de una entrada.

La diferencia principal es:

- Un **contador** suele aumentar en una unidad.
- Un **acumulador** incorpora una cantidad que puede variar.

```js
let contador = 0;
let acumulador = 0;

contador++;
acumulador += 35;
```

### 11.8. Variables de control

La variable que determina el avance del bucle se denomina **variable de control**.

```js
for (let i = 0; i < 5; i++) {
  console.log(i);
}
```

Es frecuente utilizar nombres como `i`, `j` o `k` en bucles muy pequeños. Sin embargo, cuando exista un significado claro utilizaremos un nombre descriptivo:

```js
for (
  let numeroEntrada = 1;
  numeroEntrada <= 5;
  numeroEntrada++
) {
  console.log(`Entrada ${numeroEntrada}`);
}
```

La variable declarada con `let` dentro del `for` solo existe en el propio bucle:

```js
for (let numeroEntrada = 1; numeroEntrada <= 3; numeroEntrada++) {
  console.log(numeroEntrada);
}

// Error:
// console.log(numeroEntrada);
```

### 11.9. La instrucción `break`

`break` finaliza inmediatamente el bucle.

```js
for (let numeroEntrada = 1; numeroEntrada <= 10; numeroEntrada++) {
  if (numeroEntrada === 6) {
    break;
  }

  console.log(numeroEntrada);
}
```

La consola muestra los números del `1` al `5`.

Puede utilizarse cuando:

- Se ha encontrado el valor buscado.
- Ya no quedan entradas.
- Se ha producido una situación que impide continuar.
- La persona usuaria ha cancelado la operación.

Debemos evitar utilizarlo sin necesidad, porque puede dificultar el seguimiento del bucle.

!!! salto-pagina-pdf ""

### 11.10. La instrucción `continue`

`continue` interrumpe la iteración actual y pasa a la siguiente.

```js
for (let numeroEntrada = 1; numeroEntrada <= 5; numeroEntrada++) {
  if (numeroEntrada === 3) {
    continue;
  }

  console.log(numeroEntrada);
}
```

La consola muestra:

```text
1
2
4
5
```

El valor `3` no se muestra, pero el bucle continúa.

Puede utilizarse para ignorar temporalmente una operación que no debe procesarse.

### 11.11. Recorrido con `for...of`

El bucle `for...of` permite recorrer los valores de un elemento iterable, como una cadena de texto.

```js
const codigoEntrada = "FW27";

for (const caracter of codigoEntrada) {
  console.log(caracter);
}
```

La consola muestra:

```text
F
W
2
7
```

En cada iteración, `caracter` contiene uno de los caracteres del código.

Su estructura general es:

```js
for (const valor of elementoIterable) {
  // Instrucciones.
}
```

Más adelante utilizaremos `for...of` para recorrer colecciones de datos.

!!! importante "`for...of` y `for...in`"

    `for...of` recorre valores. No utilizaremos `for...in` para recorrer arrays, porque está pensado para recorrer propiedades enumerables de objetos.

### 11.12. Bucles infinitos

Un bucle infinito se produce cuando su condición nunca se vuelve falsa.

```js
let numero = 1;

while (numero <= 5) {
  console.log(numero);
}
```

El valor de `numero` no cambia, por lo que la condición siempre es verdadera.

La corrección requiere actualizar la variable de control:

```js
let numero = 1;

while (numero <= 5) {
  console.log(numero);
  numero++;
}
```

También debemos revisar las condiciones que nunca pueden dejar de cumplirse:

```js
let entradasDisponibles = 5;

while (entradasDisponibles >= 0) {
  entradasDisponibles++;
}
```

Si un bucle infinito bloquea la página, podemos detener la ejecución desde las herramientas de desarrollo o cerrar la pestaña.

### 11.13. Errores de límites

Un error frecuente consiste en ejecutar el bucle una vez de más o una vez de menos.

```js
for (let numero = 1; numero < 5; numero++) {
  console.log(numero);
}
```

La consola muestra:

```text
1
2
3
4
```

Si queremos incluir el número `5`, debemos utilizar `<=`:

```js
for (let numero = 1; numero <= 5; numero++) {
  console.log(numero);
}
```

Antes de ejecutar un bucle debemos comprobar:

- El valor inicial.
- El primer valor que se procesa.
- El último valor que debe procesarse.
- La condición de finalización.
- La actualización de la variable de control.

### 11.14. Seguimiento de un bucle

Para comprender un bucle podemos construir una tabla de seguimiento.

```js
let total = 0;

for (let numero = 1; numero <= 3; numero++) {
  total += numero;
}
```

| Iteración { .table-main-column .table-bg-principal .table-cl-secundario } | `numero` { .table-content .table-bg-principal .table-cl-secundario } | `total` después de la operación { .table-full-container .table-bg-principal .table-cl-secundario } |
|---:|---:|---:|
| 1 | 1 | 1 |
| 2 | 2 | 3 |
| 3 | 3 | 6 |

Estas tablas ayudan a detectar errores en contadores, acumuladores y condiciones.

!!! salto-pagina-pdf ""

### 11.15. Simulación de venta de entradas

Vamos a simular varias solicitudes de compra para un evento de FestWeb.

#### Datos disponibles

- Aforo total: **10 personas**.
- Entradas vendidas inicialmente: **4**.
- Precio de cada entrada: **25 €**.
- Número de solicitudes que se intentarán procesar: **8**.
- Cada solicitud corresponde a una entrada.

#### Reglas

1. Cada solicitud debe numerarse.
2. La venta solo puede completarse si quedan entradas.
3. Por cada venta aceptada:
    - Aumentan las entradas vendidas.
    - Aumenta la recaudación.
    - Se muestra el número de solicitud.
4. Cuando se complete el aforo, el proceso debe finalizar.
5. Al terminar deben mostrarse:
    - Solicitudes procesadas.
    - Ventas completadas.
    - Entradas vendidas totales.
    - Entradas disponibles.
    - Recaudación obtenida durante el proceso.

#### Resultado esperado

```text
Solicitud 1: venta completada
Solicitud 2: venta completada
Solicitud 3: venta completada
Solicitud 4: venta completada
Solicitud 5: venta completada
Solicitud 6: venta completada
Aforo completo

Solicitudes procesadas: 6
Ventas completadas: 6
Entradas vendidas totales: 10
Entradas disponibles: 0
Recaudación obtenida: 150 €
```

!!! reto "Live coding"

    Construiremos la simulación decidiendo:

    1. Qué valores deben actuar como contadores.
    2. Qué valor debe actuar como acumulador.
    3. Qué condición controla el bucle.
    4. En qué momento debe finalizar el proceso.
    5. Cómo evitar vender más entradas que el aforo disponible.
    6. Qué tipo de bucle representa mejor la situación.

!!! actividad "Actividad opcional"

    Modifica la simulación para comprobar estos escenarios:

    1. El evento ya está completo antes de comenzar.
    2. Solo se reciben tres solicitudes.
    3. El aforo aumenta a veinte personas.
    4. Cada solicitud intenta comprar dos entradas.
    5. La quinta solicitud se cancela y debe omitirse mediante `continue`.
    6. El precio de la entrada cambia después de la tercera venta.

    Realiza una tabla de seguimiento con el valor de los contadores y acumuladores en cada iteración.

!!! salto-pagina-pdf ""