## 10. Herramientas de desarrollo y prueba

El desarrollo web requiere herramientas para editar, ejecutar, inspeccionar, depurar, transformar y versionar el código.

### 10.1. Entorno de trabajo

| Herramienta { .table-bg-principal .table-cl-secundario } | Función { .table-bg-principal .table-cl-secundario } |
|---|---|
| Visual Studio Code | Editar y organizar los archivos del proyecto |
| DevTools | Inspeccionar y depurar la aplicación en el navegador |
| Node.js | Ejecutar herramientas JavaScript fuera del navegador |
| npm | Gestionar paquetes y comandos del proyecto |
| Vite | Proporcionar un servidor local y preparar la aplicación |
| Git y SourceTree | Registrar y gestionar la evolución del código |
| ESLint | Analizar el código y detectar posibles problemas |
| Prettier | Aplicar un formato uniforme |
| TypeScript | Comprobar tipos y transformar TypeScript en JavaScript |

En Visual Studio Code debemos abrir la carpeta completa del proyecto para que el editor pueda interpretar su estructura y las relaciones entre archivos.

### 10.2. Herramientas de desarrollo del navegador

Las DevTools pueden abrirse habitualmente con <kbd>F12</kbd> o <kbd>Ctrl</kbd> + <kbd>Mayús</kbd> + <kbd>I</kbd>.

| Panel | Utilidad |
|---|---|
| Elements o Inspector | Examinar temporalmente el HTML y el CSS |
| Console | Consultar errores, mostrar mensajes y ejecutar JavaScript |
| Sources o Debugger | Examinar archivos y depurar el código |
| Network | Analizar peticiones, respuestas y tiempos de carga |
| Application | Consultar cookies, almacenamiento y caché |
| Performance | Analizar el rendimiento |

```js
console.log("Aplicación iniciada");
console.warn("Quedan pocas plazas");
console.error("No se han podido cargar los eventos");
```

Los cambios realizados desde el inspector son temporales y desaparecen normalmente al recargar la página.

### 10.3. Depuración de JavaScript

Depurar consiste en localizar, comprender y corregir un error. El panel Sources permite detener el programa mediante un **breakpoint** y examinar su estado.

Las principales herramientas son:

| Herramienta | Función |
|---|---|
| Breakpoint | Detiene la ejecución antes de una línea |
| Scope | Muestra las variables accesibles y sus valores |
| Watch | Observa expresiones seleccionadas |
| Call Stack | Muestra la cadena de funciones llamadas |
| Resume | Continúa hasta el siguiente breakpoint |
| Step over | Ejecuta la línea sin entrar en las funciones llamadas |
| Step into | Entra en la función llamada |
| Step out | Finaliza la función actual y regresa a la anterior |

La instrucción `debugger` también detiene la ejecución cuando las DevTools están abiertas:

```js
function calcularTotal(precio, gastosEnvio) {
  debugger;
  return precio + gastosEnvio;
}
```

Debe eliminarse antes de publicar la aplicación.

#### Ejemplo guiado

El siguiente programa pretende sumar cinco euros de envío:

```js
function calcularConEnvio(subtotal) {
  const gastosEnvio = 5;
  return subtotal + gastosEnvio;
}

const precio = prompt("Precio del producto");
console.log(calcularConEnvio(precio));
```

Si el usuario introduce `20`, el resultado es `205` en lugar de `25`. Un breakpoint en el `return` permite observar en Scope:

```text
subtotal: "20"
gastosEnvio: 5
```

`prompt()` devuelve una cadena y el operador `+` concatena ambos valores. La conversión explícita corrige el problema:

```js
const precio = Number(prompt("Precio del producto"));
```

Un proceso básico de depuración es:

1. Reproducir el error.
2. Formular una posible causa.
3. Detener la ejecución.
4. Inspeccionar variables y tipos.
5. Avanzar paso a paso.
6. Corregir la causa.
7. Probar nuevamente con diferentes datos.

!!! importante "Depurar no es cambiar al azar"

    Antes de modificar el código debemos comprender qué está ocurriendo y comprobar que la corrección resuelve la causa del problema.

### 10.4. Node.js, npm y Vite

Node.js permite ejecutar JavaScript fuera del navegador. En este módulo lo utilizaremos principalmente para ejecutar herramientas de desarrollo, no para desarrollar el servidor de FestWeb.

npm permite instalar dependencias y ejecutar los comandos registrados en `package.json`. Los paquetes descargados se almacenan normalmente en `node_modules/`.

Vite proporciona un servidor local, recarga rápida, gestión de módulos, integración con TypeScript y preparación para producción.

```bash
npm create vite@latest festweb
cd festweb
npm install
npm run dev
```

El último comando inicia una dirección local semejante a:

```text
http://localhost:5173
```

### 10.5. Git

Git es un sistema de control de versiones que permite:

- Conservar el historial del proyecto.
- Comparar y recuperar versiones.
- Trabajar mediante ramas.
- Facilitar la colaboración.
- Identificar los cambios realizados.

Utilizaremos SourceTree como interfaz gráfica y un flujo de trabajo incremental basado en GitFlow.

### 10.6. Calidad y transformación

Estas herramientas tienen funciones diferentes y complementarias:

| Herramienta | Función principal |
|---|---|
| ESLint | Detectar posibles errores y aplicar reglas de calidad |
| Prettier | Formatear el código de manera uniforme |
| TypeScript | Comprobar tipos y generar JavaScript |
| Babel | Transformar sintaxis JavaScript |
| Vite | Coordinar el desarrollo y la construcción |

Un programa puede superar estas comprobaciones y contener errores lógicos. Por ello, también debe probarse.

### 10.7. Tipos de prueba

| Tipo { .table-bg-principal .table-cl-secundario } | Alcance { .table-bg-principal .table-cl-secundario } | Ejemplo en FestWeb { .table-bg-principal .table-cl-secundario } |
|---|---|---|
| Manual | Uso directo de la interfaz | Comprobar el formulario en varios navegadores |
| Unitaria | Una función aislada | Calcular el precio de una inscripción |
| Integración | Varias partes relacionadas | Obtener eventos y crear las tarjetas |
| Extremo a extremo | Aplicación completa | Iniciar sesión e inscribirse en un evento |

En proyectos con Vite y Vue pueden utilizarse herramientas como Vitest para pruebas unitarias, Vue Test Utils para componentes y Playwright o Cypress para pruebas de extremo a extremo. Se estudiarán cuando el desarrollo de la aplicación lo requiera.

!!! actividad "Actividad opcional"

    1. Abre las DevTools e identifica los paneles Elements, Console, Sources, Network y Application.
    2. Depura el ejemplo de `"20" + 5` y comprueba el tipo de `subtotal`.
    3. Relaciona ESLint, Prettier, TypeScript y Vite con su función.
    4. Clasifica como unitaria, integración o extremo a extremo una prueba que compruebe:
        - Una función de cálculo.
        - La creación de tarjetas a partir de datos.
        - El proceso completo de inscripción.

!!! salto-pagina-pdf ""
