El navegador es el programa que permite acceder a las aplicaciones web, pero su función no se limita a descargar y mostrar documentos. Los navegadores actuales son capaces de interpretar HTML, ejecutar JavaScript y aplicar medidas de seguridad. Gracias a estas capacidades, aplicaciones como FestWeb pueden ofrecer una interfaz interactiva sin necesidad de instalar un programa tradicional.

### 6.1. Funciones principales del navegador

Cuando una persona utiliza una aplicación web, el navegador realiza numerosas tareas de forma coordinada:

1. **Interpreta direcciones:** permite introducir una URL y determina qué recurso debe solicitar.
2. **Se comunica con servidores:** envía peticiones y procesa las respuestas recibidas mediante protocolos web.
3. **Descarga recursos:** obtiene los archivos necesarios para construir la aplicación.
4. **Interpreta HTML:** analiza la estructura del documento y reconoce sus elementos.
5. **Aplica CSS:** determina la apariencia y distribución de los elementos.
6. **Ejecuta JavaScript:** procesa el código que proporciona comportamiento a la interfaz.
7. **Representa el resultado:** combina estructura, estilos y estado para dibujar la interfaz.
8. **Gestiona la interacción:** detecta pulsaciones, escritura, movimientos del puntero y otras acciones.
9. **Protege al usuario:** limita el acceso del código web al sistema operativo y separa, en la medida de lo posible, unas aplicaciones de otras.

!!! pregunta "Pregunta"
    Si el navegador únicamente mostrara documentos, ¿podría FestWeb validar formularios, actualizar el catálogo sin recargar o responder al botón **Inscribirme**?

### 6.2. Componentes generales del navegador

La organización concreta depende de cada producto, pero podemos distinguir estos componentes generales:

- **Interfaz de usuario:** parte visible del propio navegador, como la barra de direcciones, las pestañas y los botones de navegación. No debe confundirse con la interfaz de la página web.
- **Gestión de red:** se ocupa de las comunicaciones necesarias para solicitar y recibir recursos.
- **Motor de renderizado:** interpreta principalmente HTML y CSS y participa en la construcción de la representación visual.
- **Motor JavaScript:** procesa y ejecuta el código JavaScript.
- **Almacenamiento:** gestiona mecanismos que permiten conservar información en el dispositivo.
- **Gestión de seguridad:** controla permisos y restricciones para evitar que el código web acceda libremente al dispositivo o a información de otras aplicaciones.
- **Herramientas de desarrollo:** permiten inspeccionar el documento, los estilos, los scripts, las comunicaciones y el rendimiento.

### 6.3. Interpretación y compilación JIT

JavaScript se ha descrito tradicionalmente como un lenguaje interpretado. Sin embargo, los motores actuales utilizan estrategias más complejas. El motor puede analizar el código, comenzar a ejecutarlo, detectar las partes utilizadas con frecuencia, transformarlas y optimizarlas, y ejecutar versiones más eficientes.

Este proceso recibe habitualmente el nombre de **compilación JIT** (*Just in Time*). Por tanto, es más preciso afirmar que los motores actuales combinan interpretación y compilación dinámica para ejecutar JavaScript.

!!! actividad "Actividad opcional"
    Indica qué componente interviene principalmente en cada operación:

    1. Ejecutar una función JavaScript.
    2. Calcular el tamaño de una tarjeta.
    3. Enviar una petición al servidor.
    4. Mostrar las pestañas del navegador.
    5. Examinar una variable durante la depuración.

### 6.4. Compatibilidad y estándares web

Las aplicaciones web pueden utilizarse desde navegadores y dispositivos diferentes. Para que esto sea posible, las tecnologías deben seguir especificaciones compartidas. Los estándares web describen cómo deben funcionar tecnologías como HTML, CSS, JavaScript, los gráficos y el contenido multimedia.

Organismos como el **W3C** y el **WHATWG**, junto con **Ecma International** en el caso de ECMAScript, participan en la elaboración y evolución de estas especificaciones. Sin estándares comunes, cada navegador podría interpretar de forma completamente distinta el mismo código.

Los estándares permiten crear aplicaciones más portables, reducir diferencias entre navegadores, mejorar la interoperabilidad, incorporar nuevas capacidades de forma coordinada y establecer comportamientos previsibles. Sin embargo, que exista un estándar no significa que todos los navegadores incorporen una característica al mismo tiempo. Por ello, una aplicación debe probarse en los navegadores y dispositivos relevantes para su público.

Una estrategia consiste en proporcionar primero una experiencia básica y compatible y añadir capacidades avanzadas cuando estén disponibles. Es preferible comprobar si una capacidad existe antes de utilizarla:

```js
if ("geolocation" in navigator) {
  console.log("La geolocalización está disponible");
}
```

!!! actividad "Actividad opcional"
    Responde a las siguientes preguntas:

    1. ¿Por qué el navegador se considera un entorno de ejecución?
    2. ¿Qué funciones realiza además de mostrar páginas?
    3. ¿Qué diferencia existe entre el navegador y su motor de renderizado?
    4. ¿Qué función desempeña el motor JavaScript?
    5. ¿Qué significa compilación JIT?
    6. ¿Qué representación construye el navegador a partir del HTML?
    7. ¿Cómo colaboran HTML, CSS y JavaScript durante la representación?
    8. ¿Qué tipos de características proporciona el navegador?
    9. ¿Por qué el código web se ejecuta en un entorno aislado?
    10. ¿Puede JavaScript acceder libremente a los archivos del dispositivo?
    11. ¿Por qué deben probarse las aplicaciones en diferentes navegadores?
    12. ¿Qué relación existe entre los estándares y la compatibilidad?

!!! salto-pagina-pdf ""