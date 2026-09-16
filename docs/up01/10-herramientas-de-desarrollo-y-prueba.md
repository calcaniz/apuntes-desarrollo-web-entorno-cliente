El desarrollo web en cliente requiere herramientas para escribir, ejecutar, inspeccionar y depurar el código. A lo largo del curso utilizaremos principalmente:

- **Visual Studio Code:** editor de código que proporciona las herramientas necesarias para trabajar con el proyecto. Debemos abrir la carpeta completa para que el editor interprete su estructura y resuelva las relaciones entre archivos.
- **Herramientas de desarrollo del navegador:** conjunto de herramientas denominado habitualmente *DevTools*, que puede abrirse con `F12` o `Ctrl + Shift + i`. Sus paneles principales son:
    - **Elementos:** examinar HTML y CSS.
    - **Consola:** consultar mensajes y errores.
    - **Fuentes:** examinar y depurar JavaScript.
    - **Red:** analizar peticiones y recursos.
    - **Aplicación:** consultar almacenamiento y otros datos.
    - **Rendimiento:** detectar problemas de ejecución.

### 10.1. Node.js y npm

Node.js permite ejecutar JavaScript fuera del navegador. En el desarrollo *front-end* se utiliza para ejecutar herramientas como Vite, TypeScript o ESLint. Esto no significa que el código de FestWeb deje de ejecutarse en el navegador: Node.js se utiliza principalmente para preparar y gestionar el proyecto durante el desarrollo.

**npm** es el gestor de paquetes que acompaña habitualmente a Node.js. Permite instalar herramientas, incorporar dependencias, ejecutar comandos del proyecto y mantener un registro de los paquetes utilizados.

Una **dependencia** es un paquete externo utilizado por el proyecto. Las dependencias se registran en el archivo `package.json`, que suele incluir el nombre del proyecto, la versión, los comandos disponibles y los paquetes utilizados. Todo lo descargado se almacena normalmente en `node_modules/` y se genera mediante `npm install`.

### 10.2. Vite

Vite es una herramienta de desarrollo que proporciona un servidor local, actualización rápida de los cambios, gestión de módulos, integración con TypeScript y preparación del proyecto para producción. También ofrece plantillas para tecnologías como Vue.

Para generar un proyecto JavaScript básico se utiliza:

```bash
npm create vite@latest festweb
```

Durante el proceso seleccionaremos una plantilla sencilla de JavaScript y ejecutaremos:

```bash
cd festweb
npm install
npm run dev
```

El último comando inicia el servidor y muestra una dirección local semejante a:

```text
http://localhost:5173
```

### 10.3. Git

Git permite registrar la evolución de los archivos de un proyecto. Sus principales ventajas son:

- Conservar el historial.
- Comparar cambios.
- Recuperar versiones anteriores.
- Trabajar mediante ramas.
- Facilitar la colaboración.
- Identificar quién realizó cada modificación.

Para utilizar Git emplearemos **SourceTree**, que incluye el flujo de trabajo GitFlow, aplicando una metodología de desarrollo incremental versionado.

!!! actividad "Actividad opcional"
    Relaciona cada necesidad con su herramienta:

    1. Examinar una petición fallida.
    2. Detener la ejecución en una línea.
    3. Instalar las dependencias.
    4. Ejecutar el servidor de desarrollo.
    5. Registrar una versión estable.

