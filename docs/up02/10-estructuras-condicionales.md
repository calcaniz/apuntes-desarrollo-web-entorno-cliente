---

title: UP02 · Fundamentos de JavaScript · Estructuras condicionales

---

Hasta ahora, las instrucciones de nuestros programas se han ejecutado de forma secuencial, una detrás de otra. Sin embargo, una aplicación necesita tomar decisiones y ejecutar diferentes instrucciones según los datos disponibles.

En FestWeb podemos necesitar decidir:

- Si quedan entradas disponibles.
- Si una inscripción puede completarse.
- Si debe aplicarse un descuento.
- Si una persona cumple la edad mínima.
- Qué mensaje debe mostrarse según el estado del evento.

Las **estructuras condicionales** permiten ejecutar un bloque únicamente cuando se cumple una condición.

### 10.1. Condiciones y valores booleanos

Una condición es una expresión cuyo resultado puede interpretarse como `true` o `false`.

```js
const entradasVendidas = 3200;
const aforoTotal = 5000;

const quedanEntradas = entradasVendidas < aforoTotal;

console.log(quedanEntradas);
```

La comparación produce el valor `true` porque `3200` es menor que `5000`.

También podemos construir condiciones combinando expresiones:

```js
const inscripcionAbierta = true;
const quedanEntradas = true;

const puedeInscribirse = inscripcionAbierta && quedanEntradas;

console.log(puedeInscribirse);
```

### 10.2. Estructura `if`

La estructura `if` ejecuta un bloque cuando la condición es verdadera.

```js
const entradasDisponibles = 1800;

if (entradasDisponibles > 0) {
  console.log("Quedan entradas disponibles");
}
```

Su estructura general es:

```js
if (condicion) {
  // Instrucciones que se ejecutan si la condición es verdadera.
}
```

Si la condición es falsa, el bloque se omite y el programa continúa después de la llave de cierre.

```js
const entradasDisponibles = 0;

if (entradasDisponibles > 0) {
  console.log("Quedan entradas disponibles");
}

console.log("Fin de la comprobación");
```

### 10.3. Estructura `if...else`

Cuando necesitamos elegir entre dos posibilidades utilizamos `if...else`.

```js
const entradasDisponibles = 1800;

if (entradasDisponibles > 0) {
  console.log("Puedes realizar la inscripción");
} else {
  console.log("Entradas agotadas");
}
```

La estructura general es:

```js
if (condicion) {
  // Se ejecuta si la condición es verdadera.
} else {
  // Se ejecuta si la condición es falsa.
}
```

Solo se ejecuta uno de los dos bloques.

### 10.4. Estructura `if...else if...else`

Cuando existen más de dos posibilidades podemos encadenar varias condiciones.

```js
const entradasDisponibles = 3;

if (entradasDisponibles === 0) {
  console.log("Entradas agotadas");
} else if (entradasDisponibles <= 5) {
  console.log("Últimas entradas disponibles");
} else {
  console.log("Entradas disponibles");
}
```

Las condiciones se comprueban de arriba abajo. Cuando una condición es verdadera:

1. Se ejecuta su bloque.
2. Se omiten las condiciones restantes.
3. El programa continúa después de la estructura.

Por ello, el orden de las condiciones es importante.

```js
const entradasDisponibles = 3;

if (entradasDisponibles > 0) {
  console.log("Entradas disponibles");
} else if (entradasDisponibles <= 5) {
  console.log("Últimas entradas disponibles");
}
```

El segundo bloque nunca se ejecutará cuando el valor sea `3`, porque la primera condición ya es verdadera.

Una ordenación adecuada sería:

```js
if (entradasDisponibles === 0) {
  console.log("Entradas agotadas");
} else if (entradasDisponibles <= 5) {
  console.log("Últimas entradas disponibles");
} else {
  console.log("Entradas disponibles");
}
```

### 10.5. Condiciones compuestas

Podemos utilizar operadores lógicos para combinar condiciones.

#### Cumplimiento simultáneo

Una persona puede inscribirse si la inscripción está abierta y quedan entradas:

```js
const inscripcionAbierta = true;
const entradasDisponibles = 25;

if (inscripcionAbierta && entradasDisponibles > 0) {
  console.log("La inscripción puede realizarse");
}
```

!!! salto-pagina-pdf ""

#### Cumplimiento alternativo

Una persona puede acceder si tiene una entrada o una invitación:

```js
const tieneEntrada = false;
const tieneInvitacion = true;

if (tieneEntrada || tieneInvitacion) {
  console.log("Acceso permitido");
}
```

#### Negación

Podemos comprobar que una condición no se cumple:

```js
const entradasAgotadas = false;

if (!entradasAgotadas) {
  console.log("Todavía quedan entradas");
}
```

Cuando una expresión resulta difícil de interpretar, utilizaremos identificadores intermedios:

```js
const cumpleEdadMinima = true;
const tieneAutorizacion = false;
const puedeAcceder = cumpleEdadMinima || tieneAutorizacion;

if (puedeAcceder) {
  console.log("Acceso permitido");
}
```

!!! salto-pagina-pdf ""

### 10.6. Valores *truthy* y *falsy*

La condición de un `if` no tiene que ser necesariamente el valor literal `true` o `false`. JavaScript convierte el valor a booleano.

```js
const nombreEvento = "Festival Mediterránea";

if (nombreEvento) {
  console.log("El evento tiene nombre");
}
```

La cadena contiene caracteres y se considera *truthy*.

Los principales valores *falsy* son:

- `false`
- `0`
- `-0`
- `0n`
- `""`
- `null`
- `undefined`
- `NaN`

Ejemplo:

```js
const nombreEvento = "";

if (nombreEvento) {
  console.log("El evento tiene nombre");
} else {
  console.log("El nombre está vacío");
}
```

!!! advertencia "La cadena «false»"

    La cadena `"false"` se considera verdadera porque contiene caracteres. No debe confundirse con el valor booleano `false`.

Para facilitar la lectura, utilizaremos comparaciones explícitas cuando la intención no resulte evidente.

!!! salto-pagina-pdf ""

### 10.7. Condicionales anidados

Un condicional puede contener otro condicional:

```js
const inscripcionAbierta = true;
const entradasDisponibles = 3;
const edad = 17;
const edadMinima = 18;

if (inscripcionAbierta && entradasDisponibles > 0) {
  if (edad >= edadMinima) {
    console.log("Inscripción aceptada");
  } else {
    console.log("No se cumple la edad mínima");
  }
} else {
  console.log("La inscripción no está disponible");
}
```

Los condicionales anidados permiten representar decisiones dependientes, pero demasiados niveles dificultan la lectura.

Siempre que sea posible, combinaremos condiciones o utilizaremos identificadores descriptivos:

```js
const cumpleEdad = edad >= edadMinima;
const hayDisponibilidad =
  inscripcionAbierta && entradasDisponibles > 0;

if (hayDisponibilidad && cumpleEdad) {
  console.log("Inscripción aceptada");
}
```

### 10.8. Operador ternario

El operador ternario permite obtener uno de dos valores según una condición.

```js
const entradasDisponibles = 3;

const estado = entradasDisponibles > 0
  ? "Disponible"
  : "Agotado";

console.log(estado);
```

Su estructura es:

```text
condición ? valorSiEsVerdadera : valorSiEsFalsa
```

Es adecuado para asignaciones sencillas:

```js
const edad = 20;
const tipoEntrada = edad < 18 ? "Menor" : "General";
```

No lo utilizaremos para decisiones largas ni encadenaremos múltiples operadores ternarios, porque el código pierde legibilidad.

### 10.9. Estructura `switch`

La estructura `switch` permite seleccionar una opción a partir del valor de una expresión.

```js
const categoria = "Música";

switch (categoria) {
  case "Música":
    console.log("Evento musical");
    break;

  case "Teatro":
    console.log("Evento teatral");
    break;

  case "Deporte":
    console.log("Evento deportivo");
    break;

  default:
    console.log("Categoría no reconocida");
}
```

La expresión se compara con cada `case` utilizando igualdad estricta.

La instrucción `break` finaliza el bloque correspondiente. Si se omite, la ejecución continúa en los casos posteriores.

```js
const tipoEntrada = "premium";

switch (tipoEntrada) {
  case "premium":
    console.log("Acceso prioritario");

  case "general":
    console.log("Acceso al recinto");
    break;

  default:
    console.log("Tipo de entrada desconocido");
}
```

En este ejemplo se muestran dos mensajes para `"premium"` porque el primer caso no contiene `break`.

#### Agrupar varios casos

Varios valores pueden compartir las mismas instrucciones:

```js
const categoria = "Concierto";

switch (categoria) {
  case "Música":
  case "Concierto":
  case "Festival":
    console.log("Evento musical");
    break;

  case "Teatro":
    console.log("Evento teatral");
    break;

  default:
    console.log("Otra categoría");
}
```

### 10.10. Elección de la estructura

| Situación { .table-main-column .table-bg-principal .table-cl-secundario } | Estructura recomendada { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|
| Ejecutar un bloque si se cumple una condición | `if` |
| Elegir entre dos posibilidades | `if...else` |
| Evaluar intervalos o condiciones diferentes | `if...else if...else` |
| Obtener uno de dos valores sencillos | Operador ternario |
| Comparar un mismo valor con varias opciones concretas | `switch` |

No existe una única estructura válida para todos los problemas. Elegiremos la que exprese la decisión con mayor claridad.

### 10.11. Errores frecuentes

#### Confundir asignación y comparación

```js
let edad = 20;

// Incorrecto:
// if (edad = 18) {
//   console.log("Tiene 18 años");
// }
```

`=` asigna un valor. Para comparar utilizaremos `===`:

```js
if (edad === 18) {
  console.log("Tiene 18 años");
}
```

#### Escribir una condición imposible

```js
const edad = 20;

if (edad < 18 && edad >= 65) {
  console.log("Entrada reducida");
}
```

Una persona no puede ser simultáneamente menor de 18 años y tener 65 o más.

La condición correcta utilizaría `||`:

```js
if (edad < 18 || edad >= 65) {
  console.log("Entrada reducida");
}
```

#### Ordenar incorrectamente los intervalos

```js
const entradasDisponibles = 3;

if (entradasDisponibles > 0) {
  console.log("Disponibles");
} else if (entradasDisponibles <= 5) {
  console.log("Últimas entradas");
}
```

La condición más específica debe comprobarse antes.

#### Omitir `break` accidentalmente

```js
switch (categoria) {
  case "Música":
    console.log("Evento musical");
    break;

  case "Teatro":
    console.log("Evento teatral");
    break;
}
```

#### Escribir una condición redundante

```js
const disponible = true;

if (disponible === true) {
  console.log("Disponible");
}
```

Puede simplificarse:

```js
if (disponible) {
  console.log("Disponible");
}
```

### 10.12. Control de una inscripción en FestWeb

Vamos a desarrollar la lógica necesaria para decidir si una inscripción puede completarse y qué precio debe aplicarse.

#### Datos disponibles

- Inscripción abierta: **sí**.
- Entradas disponibles: **3**.
- Entradas solicitadas: **2**.
- Edad de la persona: **17 años**.
- Edad mínima: **18 años**.
- Tiene autorización: **sí**.
- Tipo de entrada: **estudiante**.
- Precio general: **35 €**.
- Descuento para estudiantes: **20 %**.

#### Reglas de la aplicación

1. La inscripción debe estar abierta.
2. Debe existir un número suficiente de entradas.
3. La persona debe cumplir la edad mínima o disponer de autorización.
4. El descuento depende del tipo de entrada:
    - `general`: sin descuento.
    - `estudiante`: 20 %.
    - `reducida`: 30 %.
5. Si se cumplen todos los requisitos, debe mostrarse el precio final.
6. Si no se cumplen, debe explicarse el motivo.

#### Resultado esperado

```text
Inscripción aceptada
Tipo de entrada: estudiante
Descuento aplicado: 20 %
Precio por entrada: 28 €
Importe total: 56 €
```

!!! reto "Live coding"

    Construiremos el programa decidiendo:

    1. Qué condiciones deben evaluarse primero.
    2. Qué expresiones pueden combinarse mediante `&&` y `||`.
    3. Qué decisiones se representan mejor mediante `if`.
    4. Cómo utilizar `switch` para calcular el descuento.
    5. Cómo evitar condicionales excesivamente anidados.
    6. Qué mensaje debe mostrarse cuando una regla no se cumple.

!!! actividad "Actividad opcional"

    Prueba el programa anterior con estas situaciones:

    1. La inscripción está cerrada.
    2. Solo queda una entrada.
    3. La persona tiene 16 años y no dispone de autorización.
    4. La entrada es de tipo `general`.
    5. La entrada es de tipo `reducida`.
    6. El tipo de entrada no existe.

    Antes de ejecutar el programa, predice el mensaje y el precio que debería obtenerse en cada caso.

!!! salto-pagina-pdf ""