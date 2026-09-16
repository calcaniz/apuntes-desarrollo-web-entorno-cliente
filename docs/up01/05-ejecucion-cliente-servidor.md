
En una aplicación web, el código puede ejecutarse en distintos entornos. Una parte se ejecuta en el navegador del usuario y otra en los sistemas que proporcionan el servicio. Esta distribución permite aprovechar las capacidades de cada entorno:

- El navegador presenta la interfaz y responde rápidamente a las interacciones.
- El servidor protege el acceso a los datos y realiza operaciones que no deben confiarse al cliente.
- Ambos se comunican mediante peticiones y respuestas.
- Algunas funcionalidades necesitan colaborar en los dos entornos.

Decidir dónde debe ejecutarse cada operación es una de las decisiones fundamentales al diseñar una aplicación web.

!!! pregunta "Pregunta"
    Cuando una persona se inscribe en un evento de FestWeb, ¿basta con cambiar el botón a **Inscrito** en su navegador o es necesario registrar la operación en algún otro lugar?

### 5.1. Código ejecutado en el navegador

El código ejecutado en el navegador recibe habitualmente el nombre de **código de cliente** o código del **front-end**. Se descarga desde un servidor y se procesa en el dispositivo del usuario. En el desarrollo web actual, JavaScript es el lenguaje que permite incorporar comportamiento e interactividad en el navegador.

El código del cliente puede mostrar la interfaz, detectar las acciones del usuario, abrir o cerrar menús, mostrar ventanas o paneles, actualizar elementos visibles, comprobar inicialmente los datos de un formulario o aplicar filtros sobre información descargada.

**Ventajas:**

- **Respuesta inmediata:** el navegador puede reaccionar a determinadas acciones sin esperar una nueva respuesta del servidor.
- **Menor carga para el servidor:** algunas operaciones se realizan directamente en el dispositivo del usuario.
- **Interfaces más interactivas:** se actualizan solo las partes de la interfaz que han cambiado.
- **Aprovechamiento del dispositivo:** cada cliente aporta parte de la capacidad de procesamiento.

**Desventajas:**

- **El usuario puede inspeccionarlo:** los archivos enviados al navegador pueden visualizarse mediante las herramientas de desarrollo. No deben incluir contraseñas ni credenciales.
- **Puede modificarse o evitarse:** una persona con conocimientos técnicos puede modificar el comportamiento del código recibido o enviar peticiones sin utilizar la interfaz prevista. El servidor no debe confiar automáticamente en los datos enviados por el cliente.
- **Está sometido a restricciones de seguridad:** el navegador limita determinadas operaciones para proteger al usuario y al sistema.

### 5.2. Código ejecutado en el servidor

El código ejecutado en el servidor pertenece normalmente al **back-end** de la aplicación. No se descarga ni se ejecuta en el navegador, sino que permanece en sistemas controlados por la organización responsable del servicio.

Sus responsabilidades habituales son:

- Autenticar a los usuarios y comprobar permisos.
- Aplicar reglas de negocio.
- Consultar y modificar la base de datos.
- Procesar pagos y registrar operaciones.
- Proteger información sensible.
- Coordinarse con servicios externos.
- Generar documentos o mensajes.
- Devolver recursos o datos.
- Mantener la coherencia de la información.

**Ventajas:**

- **Control sobre el entorno:** la organización controla el software, la configuración y los permisos.
- **Acceso protegido a los datos:** puede utilizar credenciales que nunca deben enviarse al navegador.
- **Reglas centralizadas:** se aplican de forma común con independencia del dispositivo utilizado.
- **Persistencia:** las operaciones se guardan para que estén disponibles posteriormente y desde otros dispositivos.
- **Mayor confianza:** constituye un entorno más controlado que el dispositivo del usuario.

**Desventajas:**

- **Necesidad de comunicación:** el cliente debe enviar una petición y esperar una respuesta.
- **Latencia:** la velocidad depende de la red, la distancia y la carga de los sistemas implicados.
- **Consumo de recursos:** cada petición utiliza procesamiento, memoria, almacenamiento o conexiones.
- **Disponibilidad:** si el servidor no está disponible, algunas o todas las funciones pueden dejar de funcionar.
- **Escalabilidad y mantenimiento:** el sistema debe dimensionarse y mantenerse para atender a los usuarios previstos.

!!! actividad "Actividad opcional"
    Indica si cada opción corresponde al **cliente** o al **servidor**:

    1. Infraestructura controlada por la organización / navegador del usuario.
    2. Código que permanece en el servidor / código que se descarga y puede inspeccionarse.
    3. JavaScript y tecnologías transformadas a JavaScript / JavaScript, Java, PHP, Python, C#…
    4. Construye y actualiza la interfaz / proporciona datos o contenido para construirla.
    5. Necesita comunicación con el cliente / ofrece interacción inmediata.
    6. No debe acceder directamente a la base de datos / puede acceder de forma controlada.
    7. No debe contener secretos / puede gestionar credenciales protegidas.
    8. Mejora la experiencia del usuario / garantiza la validez definitiva.
    9. Persistencia limitada al dispositivo / persistencia centralizada y compartida.
    10. Utiliza el dispositivo del usuario / utiliza la infraestructura del servicio.
    11. Control limitado / mayor control del entorno.
    12. Algunas tareas pueden ser locales / la comunicación requiere red.

!!! actividad "Actividad opcional"
    Decide si estas operaciones deberían realizarse principalmente en el cliente, en el servidor o en ambos:

    1. Abrir el menú de navegación.
    2. Comprobar que un correo contiene `@`.
    3. Confirmar que el correo no está registrado.
    4. Calcular visualmente el total provisional de una compra.
    5. Registrar el importe definitivo.
    6. Cambiar entre modo claro y oscuro.
    7. Comprobar la contraseña de acceso.
    8. Mostrar una animación.

### 5.3. Aplicaciones web de arquitectura combinada

Las aplicaciones modernas suelen utilizar una arquitectura combinada en la que cliente y servidor colaboran continuamente. El navegador ya no se limita a mostrar documentos completos: puede mantener una interfaz activa, gestionar su estado y solicitar únicamente la información necesaria.

1. **Carga inicial:** el navegador descarga los recursos fundamentales.
2. **Ejecución e interacción:** el código del cliente responde a las acciones del usuario.
3. **Comunicación posterior:** cuando necesita información nueva o debe registrar una operación, el cliente se comunica con el servidor.
4. **Actualización de la interfaz:** después de recibir la respuesta, el cliente actualiza únicamente los elementos necesarios.

### 5.4. Aplicaciones SPA

Una aplicación **SPA** (*Single Page Application*) mantiene un documento principal y modifica dinámicamente su contenido a medida que el usuario navega e interactúa. Esto no significa que tenga una única pantalla: puede tener numerosas vistas y funcionalidades, pero no necesita solicitar un documento HTML completo para cada cambio.

!!! actividad "Actividad opcional"
    Responde a las siguientes preguntas:

    1. ¿Qué significa que un código se ejecute en el cliente?
    2. ¿Qué operaciones son adecuadas para el navegador?
    3. ¿Por qué el código del cliente no debe contener información secreta?
    4. ¿Qué responsabilidades corresponden habitualmente al servidor?
    5. ¿Por qué el navegador no debe ser la única fuente de validación?
    6. ¿Qué ventajas proporciona la ejecución en el cliente?
    7. ¿Qué ventajas proporciona la ejecución en el servidor?
    8. ¿Por qué una misma funcionalidad puede necesitar ambos entornos?
    9. ¿Cómo se distribuye una inscripción de FestWeb entre cliente y servidor?
    10. ¿Qué caracteriza a una aplicación web de arquitectura combinada?
    11. ¿Qué significa SPA?
    12. ¿Por qué una respuesta visual del cliente no garantiza que una operación se haya registrado?

!!! salto-pagina-pdf ""
