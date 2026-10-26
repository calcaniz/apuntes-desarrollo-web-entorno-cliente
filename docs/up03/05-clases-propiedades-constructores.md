---

title: UP03 · Clases, propiedades y constructores

---

## 4. Clases, propiedades y constructores

Una **clase** define la estructura y el comportamiento de un tipo de objeto. A partir de ella podemos crear diferentes objetos que compartan las mismas propiedades y métodos.

La clase funciona como una plantilla, mientras que cada objeto creado a partir de ella es una **instancia**.

### 4.1. Definición de una clase

En TypeScript, una clase se declara mediante la palabra reservada `class`.

```ts
class Evento {
  nombre: string;
  categoria: string;
  precioEntrada: number;
  aforoTotal: number;
}
```

Esta clase define las propiedades que tendrán los eventos, pero todavía no ha creado ningún objeto.

### 4.2. El constructor

El método `constructor` se ejecuta al crear una instancia. Su función principal es recibir los datos iniciales y asignarlos a las propiedades del objeto.

```ts
class Evento {
  nombre: string;
  categoria: string;
  precioEntrada: number;
  aforoTotal: number;

  constructor(
    nombre: string,
    categoria: string,
    precioEntrada: number,
    aforoTotal: number
  ) {
    this.nombre = nombre;
    this.categoria = categoria;
    this.precioEntrada = precioEntrada;
    this.aforoTotal = aforoTotal;
  }
}
```

La palabra `this` hace referencia al objeto concreto sobre el que se está trabajando.


!!! salto-pagina-pdf ""

### 4.3. Creación de instancias

Para crear un objeto a partir de una clase se utiliza el operador `new`.

```ts
const festival = new Evento(
  "Festival Mediterránea",
  "Música",
  35,
  5000
);

const conferencia = new Evento(
  "Conferencia TypeScript",
  "Tecnología",
  0,
  300
);
```

Cada instancia conserva sus propios valores:

```ts
console.log(festival.nombre);
console.log(conferencia.nombre);
```

### 4.4. Declaración abreviada de propiedades

TypeScript permite declarar e inicializar las propiedades directamente desde los parámetros del constructor.

```ts
class Evento {
  constructor(
    public nombre: string,
    public categoria: string,
    public precioEntrada: number,
    public aforoTotal: number
  ) {}
}
```

Esta versión equivale a declarar las propiedades por separado y asignarlas mediante `this`.

!!! salto-pagina-pdf ""

### 4.4. Modificadores de acceso

Los modificadores de acceso determinan desde dónde puede utilizarse una propiedad.

| Modificador { .table-main-column .table-bg-principal .table-cl-secundario } | Acceso { .table-full-container .table-bg-principal .table-cl-secundario }|
|---|---|
| `public` | Desde cualquier parte del programa. |
| `private` | Únicamente desde la propia clase. |
| `protected` | Desde la clase y sus clases derivadas. |

Si no indicamos ningún modificador, la propiedad se considera pública.

```ts
class Evento {
  constructor(
    public nombre: string,
    private entradasVendidas: number
  ) {}
}
```

La propiedad `nombre` puede consultarse desde el exterior, pero `entradasVendidas` queda protegida dentro de la clase.

```ts
const evento = new Evento("Festival Mediterránea", 3200);

console.log(evento.nombre);
console.log(evento.entradasVendidas); // Error
```

El uso de propiedades privadas permite controlar cómo se consulta o modifica el estado interno de un objeto.


!!! salto-pagina-pdf ""

### 4.6. Propiedades de solo lectura

El modificador `readonly` impide modificar una propiedad después de inicializarla.

```ts
class Evento {
  constructor(
    public readonly id: number,
    public nombre: string
  ) {}
}
```

```ts
const evento = new Evento(1, "Festival Mediterránea");

evento.nombre = "Festival Mediterránea 2027";
evento.id = 2; // Error
```

### 4.7. Clases e interfaces

Una clase puede indicar que cumple el contrato definido por una interfaz mediante `implements`.

```ts
interface EventoBase {
  nombre: string;
  precioEntrada: number;
}

class Evento implements EventoBase {
  constructor(
    public nombre: string,
    public precioEntrada: number
  ) {}
}
```

TypeScript mostrará un error si la clase no incorpora alguna de las propiedades obligatorias de la interfaz.

!!! pregunta "Comprueba tu comprensión"

    ¿Qué diferencia existe entre una clase y una instancia creada a partir de ella?

    
!!! salto-pagina-pdf ""