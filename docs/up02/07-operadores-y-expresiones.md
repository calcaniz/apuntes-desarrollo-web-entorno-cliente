---

title: UP02 · Fundamentos de JavaScript · Operadores y expresiones

---

Los operadores permiten combinar valores, realizar cálculos, comparar datos y construir condiciones. Los valores sobre los que actúa un operador se denominan **operandos**.

```js
const precioEntrada = 35;
const cantidad = 3;
const total = precioEntrada * cantidad;
```

En la expresión `precioEntrada * cantidad`:

- `precioEntrada` y `cantidad` son los operandos.
- `*` es el operador.
- El resultado de la expresión es `105`.

### 7.1. Operador de asignación

El operador `=` asigna un valor a un identificador:

```js
let entradasVendidas = 3200;
```

No debe confundirse la asignación con la comparación:

```js
entradasVendidas = 3200;
```

Esta instrucción almacena el valor `3200`. No está preguntando si ambos valores son iguales.

También podemos asignar a una variable el resultado de una expresión:

```js
const aforoTotal = 5000;
const entradasVendidas = 3200;

const entradasDisponibles = aforoTotal - entradasVendidas;
```

!!! salto-pagina-pdf ""

### 7.2. Operadores aritméticos

Los operadores aritméticos permiten realizar cálculos numéricos.

| Operador { .table-main-column .table-bg-principal .table-cl-secundario } | Operación { .table-content .table-bg-principal .table-cl-secundario } | Ejemplo { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|---|
| `+` | Suma | `5 + 3` |
| `-` | Resta | `5 - 3` |
| `*` | Multiplicación | `5 * 3` |
| `/` | División | `15 / 3` |
| `%` | Resto de una división | `17 % 5` |
| `**` | Potencia | `5 ** 2` |

Ejemplo aplicado a FestWeb:

```js
const precioEntrada = 35;
const cantidadEntradas = 3;
const gastosGestion = 2;

const subtotal = precioEntrada * cantidadEntradas;
const gastosTotales = gastosGestion * cantidadEntradas;
const importeFinal = subtotal + gastosTotales;

console.log(importeFinal);
```

#### Operador de resto

El operador `%` devuelve el resto de una división:

```js
console.log(10 % 3);
```

Puede utilizarse, por ejemplo, para determinar si un número es par:

```js
const numeroEntrada = 24;
const resto = numeroEntrada % 2;

console.log(resto);
```

Si el resto es `0`, el número es divisible entre `2`.

### 7.3. Operadores de incremento y decremento

Los operadores `++` y `--` aumentan o reducen una variable en una unidad:

```js
let entradasVendidas = 3200;

entradasVendidas++;
console.log(entradasVendidas);

entradasVendidas--;
console.log(entradasVendidas);
```

Solo pueden utilizarse sobre valores que puedan reasignarse. No pueden aplicarse a una constante:

```js
const aforoTotal = 5000;

// Error:
// aforoTotal++;
```

Existen formas prefijas y sufijas:

```js
let cantidad = 3;

cantidad++;
++cantidad;
```

Cuando aparecen en una instrucción independiente, ambas incrementan el valor en una unidad. Sus diferencias se estudiarán cuando sea necesario evaluar el resultado dentro de expresiones más complejas.

### 7.4. Operadores de asignación compuesta

Los operadores de asignación compuesta realizan una operación y almacenan el resultado en la misma variable.

```js
let entradasVendidas = 3200;

entradasVendidas += 5;
```

La instrucción anterior equivale a:

```js
entradasVendidas = entradasVendidas + 5;
```

!!! salto-pagina-pdf ""

Los principales operadores son:

| Operador { .table-main-column .table-bg-principal .table-cl-secundario } | Equivalencia { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|
| `+=` | `valor = valor + cantidad` |
| `-=` | `valor = valor - cantidad` |
| `*=` | `valor = valor * cantidad` |
| `/=` | `valor = valor / cantidad` |
| `%=` | `valor = valor % cantidad` |
| `**=` | `valor = valor ** cantidad` |

Ejemplo:

```js
let recaudacion = 1000;

recaudacion += 35;
console.log(recaudacion);
```

### 7.5. El operador `+` y las cadenas

El operador `+` puede realizar dos operaciones diferentes:

- Sumar números.
- Concatenar cadenas de texto.

```js
console.log(20 + 5);
console.log("Fest" + "Web");
```

Cuando uno de los operandos es una cadena, JavaScript puede convertir el otro valor a texto:

```js
const precio = 35;

console.log("Precio: " + precio);
```

Este comportamiento puede producir resultados inesperados:

```js
console.log("20" + 5);
```

El resultado es la cadena `"205"`, no el número `25`. Estas conversiones se estudiarán con detalle en el siguiente apartado.

Para construir mensajes utilizaremos preferentemente plantillas literales:

```js
const precio = 35;

console.log(`Precio: ${precio} €`);
```

### 7.6. Operadores de comparación

Los operadores de comparación relacionan dos valores y producen un resultado lógico: `true` o `false`.

| Operador { .table-main-column .table-bg-principal .table-cl-secundario } | Significado { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|
| `===` | Igualdad estricta |
| `!==` | Desigualdad estricta |
| `>` | Mayor que |
| `<` | Menor que |
| `>=` | Mayor o igual que |
| `<=` | Menor o igual que |

Ejemplo:

```js
const entradasVendidas = 3200;
const aforoTotal = 5000;

console.log(entradasVendidas < aforoTotal);
console.log(entradasVendidas === aforoTotal);
```

Los resultados son valores lógicos que posteriormente podremos utilizar para tomar decisiones.

```js
const quedanEntradas = entradasVendidas < aforoTotal;

console.log(quedanEntradas);
```

!!! salto-pagina-pdf ""

### 7.7. Igualdad estricta y débil

JavaScript dispone de dos formas principales de comprobar la igualdad:

```js
console.log(5 === 5);
console.log(5 === "5");
console.log(5 == "5");
```

La igualdad estricta `===` compara el valor y el tipo.

La igualdad débil `==` puede convertir los operandos antes de compararlos. Esta conversión puede generar resultados poco intuitivos.

```js
console.log(0 == false);
console.log("" == false);
```

Durante el curso utilizaremos:

- `===` para comprobar igualdad.
- `!==` para comprobar desigualdad.

Evitaremos `==` y `!=` salvo cuando estemos analizando deliberadamente las conversiones del lenguaje.

!!! importante "Regla de comparación"

    Utiliza `===` y `!==` para evitar conversiones implícitas inesperadas.

### 7.8. Operadores lógicos

Los operadores lógicos permiten combinar o negar expresiones booleanas.

| Operador { .table-main-column .table-bg-principal .table-cl-secundario } | Nombre { .table-content .table-bg-principal .table-cl-secundario } | Resultado { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|---|
| `&&` | AND | Es verdadero cuando ambas expresiones son verdaderas. |
| `||` | OR | Es verdadero cuando al menos una expresión es verdadera. |
| `!` | NOT | Invierte el valor lógico. |

#### Operador AND

```js
const inscripcionAbierta = true;
const quedanEntradas = true;

const puedeInscribirse = inscripcionAbierta && quedanEntradas;

console.log(puedeInscribirse);
```

#### Operador OR

```js
const tieneEntrada = false;
const tieneInvitacion = true;

const puedeAcceder = tieneEntrada || tieneInvitacion;

console.log(puedeAcceder);
```

#### Operador NOT

```js
const entradasAgotadas = false;

console.log(!entradasAgotadas);
```

El operador `!` transforma `true` en `false` y `false` en `true`.

### 7.9. Precedencia de operadores

Cuando una expresión contiene varios operadores, JavaScript sigue un orden de evaluación.

```js
const resultado = 10 + 5 * 2;

console.log(resultado);
```

La multiplicación se realiza antes que la suma, por lo que el resultado es `20`.

Podemos utilizar paréntesis para modificar o aclarar el orden:

```js
const resultado = (10 + 5) * 2;

console.log(resultado);
```

Ahora el resultado es `30`.

!!! salto-pagina-pdf ""

Como regla general:

1. Se evalúan los paréntesis.
2. Se realizan potencias.
3. Se realizan multiplicaciones, divisiones y restos.
4. Se realizan sumas y restas.
5. Se evalúan las comparaciones.
6. Se evalúan los operadores lógicos.
7. Se realiza la asignación.

No es necesario memorizar toda la tabla de precedencia. Cuando una expresión pueda resultar ambigua, utilizaremos paréntesis.

### 7.10. Operador ternario

El operador ternario permite elegir entre dos valores mediante una condición:

```js
const entradasDisponibles = 1800;

const estado = entradasDisponibles > 0
  ? "Entradas disponibles"
  : "Entradas agotadas";

console.log(estado);
```

Su estructura es:

```text
condición ? valorSiSeCumple : valorSiNoSeCumple
```

Lo utilizaremos únicamente para decisiones sencillas. Las estructuras condicionales completas se estudiarán en un apartado posterior.

!!! salto-pagina-pdf ""

### 7.11. Cálculos para una inscripción

Vamos a calcular el importe de una compra de entradas y comprobar algunas condiciones.

#### Datos disponibles

- Precio de cada entrada: **35 €**.
- Número de entradas compradas: **4**.
- Gastos de gestión por entrada: **2,50 €**.
- Descuento disponible: **10 %**.
- Aforo total: **5000 personas**.
- Entradas vendidas: **4997**.

#### Operaciones necesarias

El programa deberá obtener:

1. El precio conjunto de las entradas.
2. Los gastos de gestión totales.
3. El importe del descuento.
4. El precio final después de aplicar el descuento.
5. Las entradas que quedan disponibles.
6. Si existe aforo suficiente para completar la compra.
7. Si el número de entradas compradas es par.
8. Un mensaje que indique si la compra puede realizarse.

#### Resultado esperado

```text
Subtotal: 140 €
Gastos de gestión: 10 €
Descuento: 14 €
Importe final: 136 €
Entradas disponibles: 3
Hay aforo suficiente: false
La cantidad de entradas es par: true
Estado: No hay suficientes entradas
```

!!! reto "Live coding"

    Construiremos el programa identificando:

    1. Qué operadores aritméticos necesitamos.
    2. Qué valores pueden declararse mediante `const`.
    3. Qué comparación determina si existe suficiente aforo.
    4. Cómo comprobar si una cantidad es par.
    5. Cómo obtener el estado final mediante un operador ternario.
    6. Qué paréntesis ayudan a expresar los cálculos con claridad.

!!! actividad "Actividad opcional"

    Modifica los datos del ejemplo anterior y comprueba cómo cambia el resultado:

    - Compra solamente dos entradas.
    - Elimina el descuento.
    - Aumenta los gastos de gestión.
    - Cambia el aforo disponible.
    - Intenta comprar más entradas de las que quedan.

    Antes de ejecutar el programa, predice el resultado de cada expresión.

!!! salto-pagina-pdf ""