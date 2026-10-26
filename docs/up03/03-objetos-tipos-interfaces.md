---

title: UP03 · Objetos, tipos e interfaces

---

Un objeto permite agrupar varios datos relacionados dentro de una misma estructura. En lugar de utilizar variables independientes para representar un evento, podemos reunir toda su información en un único valor.

### 3.1. Objetos literales

Un **objeto literal** se crea mediante llaves `{}`. Cada propiedad está formada por un nombre y un valor.

```ts
const evento = {
  nombre: "Festival Mediterránea",
  categoria: "Música",
  precioEntrada: 35,
  aforoTotal: 5000,
  entradasVendidas: 3200,
  requiereMayoriaEdad: false
};
```

Las propiedades pueden consultarse mediante la notación de punto:

```ts
console.log(evento.nombre);
console.log(evento.precioEntrada);
```

También pueden modificarse si el objeto y la propiedad lo permiten:

```ts
evento.entradasVendidas = 3250;
```

TypeScript infiere la estructura del objeto y comprueba que las asignaciones sean compatibles con los tipos originales.

```ts
evento.precioEntrada = "gratuito"; // Error: se esperaba un number
```

### 3.2. Alias de tipo

Un **alias de tipo** permite asignar un nombre a una estructura mediante la palabra reservada `type`.

```ts
type Evento = {
  nombre: string;
  categoria: string;
  precioEntrada: number;
  aforoTotal: number;
  entradasVendidas: number;
  requiereMayoriaEdad: boolean;
};
```

Una vez definido el tipo, podemos utilizarlo para comprobar diferentes objetos:

```ts
const eventoPrincipal: Evento = {
  nombre: "Festival Mediterránea",
  categoria: "Música",
  precioEntrada: 35,
  aforoTotal: 5000,
  entradasVendidas: 3200,
  requiereMayoriaEdad: false
};
```

Si falta una propiedad obligatoria, sobra una propiedad no contemplada o se utiliza un tipo incorrecto, TypeScript mostrará un error.

### 3.3. Interfaces

Una **interfaz** describe la estructura que debe tener un objeto. Se declara mediante la palabra reservada `interface`.

```ts
interface Evento {
  nombre: string;
  categoria: string;
  precioEntrada: number;
  aforoTotal: number;
  entradasVendidas: number;
  requiereMayoriaEdad: boolean;
}
```

Podemos crear tantos objetos como necesitemos respetando ese contrato:

```ts
const festival: Evento = {
  nombre: "Festival Mediterránea",
  categoria: "Música",
  precioEntrada: 35,
  aforoTotal: 5000,
  entradasVendidas: 3200,
  requiereMayoriaEdad: false
};

const feria: Evento = {
  nombre: "Feria del Videojuego",
  categoria: "Tecnología",
  precioEntrada: 12,
  aforoTotal: 800,
  entradasVendidas: 450,
  requiereMayoriaEdad: false
};
```

!!! info "Interfaz como contrato"

    Una interfaz no crea objetos ni contiene sus datos. Define las propiedades que deben presentar los objetos que la utilicen.

### 3.4. Propiedades opcionales

Una propiedad puede marcarse como opcional colocando `?` después de su nombre.

```ts
interface Evento {
  nombre: string;
  categoria: string;
  precioEntrada: number;
  ubicacion?: string;
}
```

En este caso, los siguientes objetos son válidos:

```ts
const eventoPresencial: Evento = {
  nombre: "Festival Mediterránea",
  categoria: "Música",
  precioEntrada: 35,
  ubicacion: "Cullera"
};

const eventoOnline: Evento = {
  nombre: "Conferencia TypeScript",
  categoria: "Tecnología",
  precioEntrada: 0
};
```

Antes de utilizar una propiedad opcional, debemos comprobar que contiene un valor:

```ts
if (eventoOnline.ubicacion !== undefined) {
  console.log(eventoOnline.ubicacion);
}
```

### 3.5. Propiedades de solo lectura

El modificador `readonly` impide modificar una propiedad después de crear el objeto.

```ts
interface Evento {
  readonly id: number;
  nombre: string;
  precioEntrada: number;
}
```

```ts
const evento: Evento = {
  id: 1,
  nombre: "Festival Mediterránea",
  precioEntrada: 35
};

evento.nombre = "Festival Mediterránea 2027";
evento.id = 2; // Error: id es de solo lectura
```

`readonly` resulta útil para identificadores y otros valores que no deberían cambiar durante la vida del objeto.

### 3.6. Diferencias entre `type` e `interface`

Tanto `type` como `interface` pueden describir la estructura de un objeto.

```ts
type Entrada = {
  codigo: string;
  precio: number;
};

interface Reserva {
  codigo: string;
  cantidad: number;
}
```

Para los modelos de objetos sencillos que desarrollaremos en esta unidad, ambas opciones son válidas. Utilizaremos preferentemente:

- `interface` para describir la estructura de objetos y clases.
- `type` para crear uniones, alias y combinaciones de tipos.

```ts
type EstadoEvento = "programado" | "agotado" | "cancelado";

interface Evento {
  nombre: string;
  estado: EstadoEvento;
}
```

!!! pregunta "Comprueba tu comprensión"

    ¿Qué diferencia existe entre crear un objeto y definir una interfaz para ese objeto?

    
!!! salto-pagina-pdf ""