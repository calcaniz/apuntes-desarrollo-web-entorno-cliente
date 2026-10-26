---

title: A03.02 · Construcción de la clase Evento

---

## 6. Actividad guiada: construcción de la clase `Evento`

En esta actividad sustituiremos el objeto literal anterior por una clase que permita crear diferentes eventos con una estructura común.

La actividad se realizará mediante **live coding** y no será calificable.

| Actividad { .table-main-column .table-bg-principal .table-cl-secundario } | Información { .table-full-container .table-bg-principal .table-cl-secundario }|
|---|---|
| **Código** | A03.02 |
| **Modalidad** | Guiada y formativa |
| **Duración** | 45 minutos |
| **Criterios relacionados** | CE04-g · CE04-h |

### 6.1. Punto de partida

Partiremos de la siguiente interfaz:

```ts
type CategoriaEvento =
  | "Música"
  | "Tecnología"
  | "Gastronomía"
  | "Deporte";

interface EventoBase {
  readonly id: number;
  nombre: string;
  categoria: CategoriaEvento;
  precioEntrada: number;
  aforoTotal: number;
  ubicacion?: string;
}
```

### 6.2. Tareas

Durante el desarrollo guiado realizaremos los siguientes pasos:

1. Crear una clase llamada `Evento`.

2. Indicar que la clase implementa la interfaz `EventoBase`.

3. Definir mediante el constructor las siguientes propiedades:

    - `id`.
    - `nombre`.
    - `categoria`.
    - `precioEntrada`.
    - `aforoTotal`.
    - `ubicacion`.
    - `entradasVendidas`.

4. Establecer `id` como propiedad pública y de solo lectura.

5. Establecer `entradasVendidas` como propiedad privada.

6. Asignar a `entradasVendidas` el valor inicial `0`.

7. Utilizar la declaración abreviada de propiedades en el constructor.

8. Crear al menos tres instancias diferentes de la clase.

9. Consultar desde el exterior las propiedades públicas.

10. Intentar acceder directamente a la propiedad privada y analizar el error.

### 6.3. Eventos que debemos crear

Utilizaremos los siguientes datos:

| Evento | Categoría | Precio | Aforo | Ubicación |
|---|---|---:|---:|---|
| Festival Mediterránea | Música | 35 € | 5000 | Cullera |
| Valencia Tech Meeting | Tecnología | 15 € | 800 | València |
| Carrera FestWeb | Deporte | 10 € | 1200 | Sueca |

### 6.4. Comprobaciones

Una vez creada la clase, comprobaremos:

1. Si pueden crearse objetos con propiedades de tipos incorrectos.
2. Si puede modificarse el identificador después de crear la instancia.
3. Si puede accederse directamente a `entradasVendidas`.
4. Si cada instancia conserva sus propios datos.
5. Si la clase cumple completamente la interfaz `EventoBase`.

### 6.5. Resultado esperado

Al finalizar la actividad tendremos:

- Una interfaz que defina la estructura mínima de un evento.
- Una clase que implemente dicha interfaz.
- Propiedades públicas, privadas y de solo lectura.
- Un constructor con parámetros tipados.
- Tres instancias independientes de la clase `Evento`.

!!! reto "Ampliación opcional"

    Añade una propiedad `estado` cuyos únicos valores posibles sean `programado`, `agotado` o `cancelado`, y establece `programado` como valor inicial.