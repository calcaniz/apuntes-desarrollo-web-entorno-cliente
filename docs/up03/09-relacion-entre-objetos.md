---

title: UP03 · Relaciones entre objetos

---

## 6. Relaciones entre objetos

Una aplicación suele estar formada por varios objetos que colaboran entre sí. Cada clase debe representar una responsabilidad concreta y relacionarse con otras clases cuando sea necesario.

En FestWeb, por ejemplo, un evento puede tener una ubicación y estar gestionado por un organizador.

### 6.1. Objetos como propiedades

Una propiedad puede contener una instancia de otra clase.

```ts
class Ubicacion {
  constructor(
    public recinto: string,
    public localidad: string
  ) {}
}

class Evento {
  constructor(
    public nombre: string,
    public ubicacion: Ubicacion
  ) {}
}
```

Primero creamos la ubicación y después la utilizamos para construir el evento:

```ts
const ubicacion = new Ubicacion(
  "Recinto de conciertos",
  "Cullera"
);

const evento = new Evento(
  "Festival Mediterránea",
  ubicacion
);
```

Para acceder a sus datos encadenamos las propiedades:

```ts
console.log(evento.ubicacion.localidad);
```

!!! salto-pagina-pdf ""

### 6.2. Objetos como parámetros

Un objeto también puede recibirse como parámetro de un método.

```ts
class Organizador {
  constructor(
    public nombre: string,
    public correo: string
  ) {}
}

class Evento {
  private organizador?: Organizador;

  constructor(public nombre: string) {}

  asignarOrganizador(organizador: Organizador): void {
    this.organizador = organizador;
  }
}
```

```ts
const organizador = new Organizador(
  "FestWeb Producciones",
  "info@festweb.test"
);

const evento = new Evento("Festival Mediterránea");

evento.asignarOrganizador(organizador);
```

TypeScript comprueba que el argumento recibido sea compatible con la clase `Organizador`.

### 6.3. Referencias a objetos

Cuando asignamos un objeto a otra variable, ambas variables hacen referencia a la misma instancia.

```ts
const ubicacionPrincipal = new Ubicacion(
  "Auditorio Municipal",
  "Sueca"
);

const otraReferencia = ubicacionPrincipal;

otraReferencia.localidad = "Cullera";

console.log(ubicacionPrincipal.localidad);
```

!!! salto-pagina-pdf ""

El resultado será `"Cullera"` porque no se ha creado una copia independiente.

!!! importante "Importante"

    Las variables que contienen objetos almacenan referencias. Modificar el objeto mediante una referencia afecta a todas las variables que apuntan a esa misma instancia.

### 6.4. Asociación y composición

La **asociación** aparece cuando dos objetos colaboran, pero pueden existir de forma independiente.

Por ejemplo, un organizador puede existir sin estar asignado a un evento:

```ts
evento.asignarOrganizador(organizador);
```

La **composición** representa una relación más fuerte. Un objeto forma parte de otro y normalmente no tiene sentido fuera de él.

```ts
class Reserva {
  constructor(
    public codigo: string,
    public evento: Evento,
    public cantidad: number
  ) {}
}
```

En este caso, la reserva está vinculada a un evento concreto.


!!! salto-pagina-pdf ""

### 6.5. Herencia

La **herencia** permite crear una clase especializada a partir de otra. Se utiliza cuando existe una relación de tipo «es un».

```ts
class Evento {
  constructor(
    public nombre: string,
    public precioEntrada: number
  ) {}

  mostrarResumen(): string {
    return `${this.nombre}: ${this.precioEntrada} €`;
  }
}

class EventoOnline extends Evento {
  constructor(
    nombre: string,
    precioEntrada: number,
    public plataforma: string
  ) {
    super(nombre, precioEntrada);
  }
}
```

`EventoOnline` hereda las propiedades y métodos de `Evento` y añade la propiedad `plataforma`.

```ts
const conferencia = new EventoOnline(
  "Conferencia TypeScript",
  10,
  "FestWeb Live"
);

console.log(conferencia.mostrarResumen());
```

### 6.6. Sobrescritura de métodos

Una clase derivada puede adaptar un método heredado a sus necesidades.

```ts
class EventoOnline extends Evento {
  constructor(
    nombre: string,
    precioEntrada: number,
    public plataforma: string
  ) {
    super(nombre, precioEntrada);
  }

  mostrarResumen(): string {
    return `${super.mostrarResumen()} · ${this.plataforma}`;
  }
}
```

Esta capacidad permite tratar objetos relacionados mediante una estructura común, aunque cada clase pueda proporcionar su propio comportamiento.

### 6.7. Distribución de responsabilidades

Cada clase debe encargarse únicamente de las operaciones relacionadas con su información.

| Clase | Responsabilidad principal |
|---|---|
| `Evento` | Gestionar los datos y la disponibilidad del evento. |
| `Ubicacion` | Representar el recinto y la localidad. |
| `Organizador` | Representar a la entidad responsable. |
| `Entrada` | Representar el acceso individual al evento. |
| `Reserva` | Relacionar una compra con un evento y una cantidad. |

Dividir el modelo en clases evita crear una única clase excesivamente grande y facilita la reutilización del código.

!!! pregunta "Comprueba tu comprensión"

    ¿Qué diferencia existe entre que un evento contenga una ubicación y que una clase herede de otra?

    
!!! salto-pagina-pdf ""