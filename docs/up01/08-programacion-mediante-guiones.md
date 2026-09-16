## 8. Programación mediante guiones

La programación web en cliente se ha basado tradicionalmente en el uso de guiones o *scripts*. JavaScript comenzó utilizándose para tareas sencillas, como validar formularios o mostrar mensajes. Actualmente permite desarrollar aplicaciones completas como FestWeb.

### 8.1. El concepto de script

Un **script** es un conjunto de instrucciones que se ejecuta dentro de un entorno anfitrión. En el desarrollo web suele escribirse en JavaScript y el navegador proporciona el entorno de ejecución. El código puede estar integrado en el HTML o almacenado en un fichero externo. Su ejecución puede comenzar al cargar la página o al producirse un evento.

### 8.2. Programación dirigida a eventos

Las aplicaciones web no ejecutan siempre sus instrucciones de principio a fin y terminan. Muchas permanecen a la espera de que ocurra algún acontecimiento. A este concepto se le llama **evento**.

Un evento es un hecho que el navegador puede detectar, como la carga de un documento, la pulsación de un botón o la llegada de una respuesta del servidor.

```js
const boton = document.querySelector("#inscribirse");

boton.addEventListener("click", () => {
  console.log("El usuario quiere inscribirse");
});
```

### 8.3. Ventajas, limitaciones e inconvenientes

| Ventajas { .table-bg-principal .table-cl-secundario } | Inconvenientes { .table-bg-principal .table-cl-secundario } |
|---|---|
| Respuesta inmediata ante determinadas acciones | El código puede inspeccionarse y modificarse |
| Interfaces más dinámicas | No debe contener secretos ni credenciales |
| Actualización parcial del contenido | Los datos enviados por el cliente no son completamente fiables |
| Validación inicial de formularios | Existen diferencias entre navegadores y dispositivos |
| Menos peticiones para operaciones locales | El rendimiento depende del equipo del usuario |
| Aprovechamiento de los recursos del dispositivo | El navegador restringe el acceso al sistema |
| Separación entre presentación, comportamiento y procesamiento del servidor | Un error de JavaScript puede impedir parte del funcionamiento |
|  | La aplicación puede depender excesivamente de que JavaScript esté disponible |

!!! actividad "Actividad opcional"
    Clasifica estas situaciones como **evento**, **respuesta del script** o **responsabilidad del servidor**:

    1. El usuario pulsa **Inscribirme**.
    2. El botón cambia a **Procesando**.
    3. Se comprueba si quedan plazas.
    4. Se registra la inscripción.
    5. Aparece un mensaje de confirmación.

!!! salto-pagina-pdf ""