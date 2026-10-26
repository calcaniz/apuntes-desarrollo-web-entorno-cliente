---

title: UP03 · Métodos y encapsulación

---

## 5. Métodos y encapsulación

Las propiedades representan el estado de un objeto. Los **métodos** definen las operaciones que puede realizar.

En una clase, los métodos permiten modificar sus propiedades de forma controlada y agrupar la lógica relacionada con el objeto.

### 5.1. Definición de métodos

Un método se declara dentro de la clase indicando su nombre, parámetros y tipo de retorno.

```ts
class Evento {
  constructor(
    public nombre: string,
    public precioEntrada: number,
    private entradasVendidas: number,
    public aforoTotal: number
  ) {}

  mostrarResumen(): string {
    return `${this.nombre}: ${this.precioEntrada} €`;
  }
}
```

Para ejecutar el método se utiliza la notación de punto:

```ts
const evento = new Evento(
  "Festival Mediterránea",
  35,
  3200,
  5000
);

console.log(evento.mostrarResumen());
```

!!! salto-pagina-pdf ""

### 5.2. Uso de `this`

La palabra `this` hace referencia a la instancia concreta que ejecuta el método.

```ts
class Evento {
  constructor(
    public nombre: string,
    private entradasVendidas: number
  ) {}

  mostrarVentas(): string {
    return `${this.nombre} ha vendido ${this.entradasVendidas} entradas`;
  }
}
```

Cada instancia utiliza sus propios valores al ejecutar el método.

### 5.3. Métodos con parámetros

Los métodos pueden recibir información mediante parámetros tipados.

```ts
class Evento {
  constructor(
    public nombre: string,
    private entradasVendidas: number
  ) {}

  venderEntradas(cantidad: number): void {
    this.entradasVendidas += cantidad;
  }
}
```

El tipo `void` indica que el método realiza una operación, pero no devuelve ningún valor.

```ts
evento.venderEntradas(5);
```

!!! salto-pagina-pdf ""

### 5.4. Métodos que devuelven valores

Un método también puede calcular y devolver información sin modificar el objeto.

```ts
class Evento {
  constructor(
    private entradasVendidas: number,
    public aforoTotal: number
  ) {}

  calcularDisponibles(): number {
    return this.aforoTotal - this.entradasVendidas;
  }

  estaAgotado(): boolean {
    return this.calcularDisponibles() === 0;
  }
}
```

Un método puede utilizar otros métodos de la misma clase mediante `this`.

### 5.5. Encapsulación

La **encapsulación** consiste en proteger el estado interno de un objeto y permitir su modificación únicamente mediante operaciones controladas.

Si `entradasVendidas` fuera pública, cualquier parte del programa podría asignarle valores incorrectos:

```ts
evento.entradasVendidas = -500;
```

Al declararla como privada, obligamos a utilizar un método que valide la operación:

```ts
class Evento {
  constructor(
    private entradasVendidas: number,
    public aforoTotal: number
  ) {}

  venderEntradas(cantidad: number): boolean {
    const disponibles = this.aforoTotal - this.entradasVendidas;

    if (cantidad <= 0 || cantidad > disponibles) {
      return false;
    }

    this.entradasVendidas += cantidad;
    return true;
  }
}
```

El método devuelve `true` si la venta se completa y `false` si la cantidad solicitada no es válida.


!!! salto-pagina-pdf ""

### 5.6. Métodos de acceso: `get`

Un método `get` permite consultar una propiedad como si fuera una propiedad pública.

```ts
class Evento {
  constructor(private entradasVendidas: number) {}

  get ventas(): number {
    return this.entradasVendidas;
  }
}
```

Se consulta sin utilizar paréntesis:

```ts
console.log(evento.ventas);
```

### 5.5. Métodos de modificación: `set`

Un método `set` permite controlar la asignación de un valor.

```ts
class Evento {
  private _precioEntrada: number;

  constructor(precioEntrada: number) {
    this._precioEntrada = precioEntrada;
  }

  get precioEntrada(): number {
    return this._precioEntrada;
  }

  set precioEntrada(nuevoPrecio: number) {
    if (nuevoPrecio >= 0) {
      this._precioEntrada = nuevoPrecio;
    }
  }
}
```

```ts
evento.precioEntrada = 40;
console.log(evento.precioEntrada);
```

!!! importante "Importante"

    Los métodos `get` y `set` se utilizan como propiedades, sin añadir paréntesis al consultarlos o modificarlos.

### 5.8. Responsabilidad de la clase

Una clase debe encargarse de las operaciones directamente relacionadas con sus datos. La clase `Evento`, por ejemplo, puede:

- Calcular las entradas disponibles.
- Comprobar si está agotado.
- Registrar o cancelar una reserva.
- Calcular el importe de una compra.
- Controlar los cambios de precio.

Este enfoque evita repartir la lógica del evento por diferentes partes de la aplicación.

!!! pregunta "Comprueba tu comprensión"

    ¿Por qué es preferible modificar una propiedad privada mediante un método en lugar de hacerla pública?

    
!!! salto-pagina-pdf ""