---

title: 6. El navegador como entorno de ejecución

---

# 6. El navegador como entorno de ejecución

El navegador no se limita a mostrar documentos: solicita recursos, interpreta HTML y CSS, ejecuta JavaScript, representa la interfaz y protege al usuario. Por ello, constituye el entorno de ejecución de las aplicaciones web en el cliente.

### 6.1. Funciones principales del navegador

Un navegador realiza de forma coordinada las siguientes tareas:

1. Interpreta una URL y localiza el recurso solicitado.
2. Se comunica con servidores y descarga HTML, CSS, JavaScript, imágenes o datos.
3. Construye y representa la página.
4. Ejecuta JavaScript y gestiona las interacciones.
5. Conserva determinados datos en el dispositivo.
6. Aplica restricciones de seguridad y permisos.

!!! pregunta "Pregunta"

    Si el navegador solo mostrara documentos, ¿podría FestWeb filtrar eventos, validar formularios o actualizar el catálogo sin recargar la página?

### 6.2. Componentes generales

| Componente { .table-full-container .table-bg-principal .table-cl-secundario } | Función { .table-bg-principal .table-cl-secundario } |
|---|---|
| Interfaz de usuario | Barras, pestañas, botones y menús del navegador |
| Motor del navegador | Coordina los componentes y la navegación |
| Motor de renderizado | Interpreta HTML y CSS y genera la representación visual |
| Motor JavaScript | Analiza y ejecuta JavaScript |
| Módulo de red | Gestiona peticiones, respuestas, caché y cookies |
| Almacenamiento | Conserva información en el dispositivo |
| Seguridad | Aplica aislamiento, permisos y restricciones |
| DevTools | Permite inspeccionar y depurar la aplicación |

Los motores más utilizados son:

| Navegadores { .table-full-container .table-bg-principal .table-cl-secundario } | Motor de renderizado { .table-bg-principal .table-cl-secundario } | Motor JavaScript { .table-bg-principal .table-cl-secundario } |
|---|---|---|
| Chrome, Edge y Opera | Blink | V8 |
| Firefox | Gecko | SpiderMonkey |
| Safari | WebKit | JavaScriptCore |

Un navegador completo no es lo mismo que su motor de renderizado ni que su motor JavaScript.

### 6.3. Construcción de la página

El navegador transforma los recursos recibidos en una interfaz mediante este proceso:

1. **DOM:** representa la estructura creada a partir del HTML.
2. **CSSOM:** representa las reglas obtenidas del CSS.
3. **Render Tree:** combina los elementos visibles con sus estilos.
4. **Layout:** calcula tamaños y posiciones.
5. **Paint y composición:** dibuja y combina las capas en pantalla.

```text
HTML → DOM ───────────────┐
                         ├→ Render Tree → Layout → Paint
CSS  → CSSOM ────────────┘
```

JavaScript puede modificar el DOM o los estilos. Cuando el cambio afecta a la presentación, el navegador actualiza las fases necesarias.

!!! importante "DOM y página visible"

    El DOM representa el documento, pero no es una imagen de la página. Un elemento con `display: none` puede existir en el DOM y no aparecer en el Render Tree.

### 6.4. APIs del navegador

JavaScript proporciona el lenguaje; el navegador añade objetos y APIs para interactuar con la página, la red o el dispositivo.

| API { .table-main-column .table-bg-principal .table-cl-secundario }| Utilidad { .table-full-container .table-bg-principal .table-cl-secundario }|
|---|---|
| DOM | Consultar y modificar el documento |
| Eventos | Responder a acciones del usuario o del navegador |
| Web Storage | Conservar preferencias y datos sencillos |
| Fetch | Intercambiar datos con servidores |
| Geolocalización | Solicitar la ubicación del dispositivo |
| Multimedia | Utilizar audio, vídeo, cámara o micrófono |
| Notificaciones | Mostrar avisos con autorización del usuario |

```js
const boton = document.querySelector("#inscribirse");

boton.addEventListener("click", () => {
  console.log("Inscripción solicitada");
});
```

`document` y `addEventListener()` son capacidades proporcionadas por el navegador, no por el núcleo de JavaScript.

Antes de utilizar una API conviene comprobar que está disponible:

```js
if ("geolocation" in navigator) {
  console.log("Geolocalización disponible");
}
```

Las APIs se estudiarán con más profundidad en las unidades correspondientes.

### 6.5. Seguridad y aislamiento

El navegador ejecuta código descargado de Internet dentro de un entorno restringido o **sandbox**. Un script no puede acceder libremente a los archivos, programas, cámara, micrófono o datos de otras aplicaciones.

Un **origen** está formado por el protocolo, el dominio y el puerto. Dos URL pertenecen al mismo origen únicamente si coinciden los tres elementos.

| URL respecto a `https://festweb.es` { .table-full-container .table-bg-principal .table-cl-secundario } | ¿Mismo origen? { .table-full-container .table-bg-principal .table-cl-secundario }|
|---|:---:|
| `https://festweb.es/eventos` | Sí |
| `http://festweb.es` | No: cambia el protocolo |
| `https://api.festweb.es` | No: cambia el dominio |
| `https://festweb.es:8443` | No: cambia el puerto |

La **política del mismo origen** impide que una página lea libremente información de otro origen. Cuando una API desea autorizar una comunicación externa puede utilizar **CORS**, indicando mediante cabeceras qué orígenes pueden leer sus respuestas.

Además:

- Las capacidades sensibles requieren permiso del usuario.
- Algunas APIs solo funcionan en contextos seguros mediante HTTPS.
- El código del cliente puede inspeccionarse y modificarse.
- Las validaciones y reglas de seguridad deben comprobarse también en el servidor.

!!! peligro "El cliente no es un entorno de confianza"

    El código JavaScript nunca debe contener contraseñas, credenciales ni claves secretas.

### 6.6. Interpretación y compilación JIT

JavaScript se ha descrito tradicionalmente como un lenguaje interpretado. Sin embargo, los motores actuales analizan el código, comienzan a ejecutarlo y compilan u optimizan las partes utilizadas con frecuencia. Este proceso se denomina **compilación JIT** (*Just in Time*).

Por tanto, resulta más preciso afirmar que los motores modernos combinan interpretación y compilación dinámica.

### 6.7. Compatibilidad y estándares web

Los estándares permiten que HTML, CSS y JavaScript funcionen de forma previsible en navegadores diferentes. En su elaboración participan organismos como W3C, WHATWG y Ecma International.

No todos los navegadores incorporan las novedades simultáneamente. Por ello debemos:

- Utilizar tecnologías estandarizadas.
- Comprobar la disponibilidad de las características.
- Proporcionar alternativas cuando sea posible.
- Probar la aplicación en los navegadores y dispositivos relevantes.

!!! actividad "Actividad opcional"

    Responde brevemente:

    1. ¿Qué diferencia existe entre navegador, motor de renderizado y motor JavaScript?
    2. ¿Qué representaciones se construyen a partir de HTML y CSS?
    3. ¿Qué diferencia existe entre layout y paint?
    4. ¿Qué proporciona una Web API?
    5. ¿Qué tres elementos forman un origen?
    6. ¿Por qué no debemos confiar únicamente en la validación del cliente?
    7. ¿Qué significa compilación JIT?
    8. ¿Por qué es necesario probar una aplicación en varios navegadores?

!!! salto-pagina-pdf ""
