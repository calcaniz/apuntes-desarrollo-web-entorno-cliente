## 8. Programación mediante guiones

JavaScript comenzó utilizándose para pequeños guiones o *scripts*, aunque actualmente permite desarrollar aplicaciones completas.

### 8.1. El concepto de script

Un **script** es un conjunto de instrucciones ejecutado dentro de un entorno anfitrión. En el desarrollo web, el navegador descarga el código JavaScript, lo ejecuta en el dispositivo del usuario y le proporciona APIs para interactuar con la página.

Un mismo lenguaje puede ejecutarse en otros entornos, como Node.js, pero las capacidades disponibles serán diferentes.

### 8.2. Características principales

| Característica { .table-full-container .table-bg-principal .table-cl-secundario } | Consecuencia { .table-full-container .table-bg-principal .table-cl-secundario } |
|---|---|
| Tipado dinámico | Una variable puede almacenar valores de tipos diferentes |
| Coerción de tipos | JavaScript puede convertir valores automáticamente |
| Ejecución mediante un motor | El motor analiza, ejecuta y optimiza el código mediante JIT |
| Programación dirigida por eventos | Parte del código responde a acciones o acontecimientos |
| Operaciones asíncronas | La aplicación puede esperar resultados sin bloquear toda la interfaz |
| Código visible | El usuario puede inspeccionarlo y modificarlo |
| Sandbox | El navegador restringe el acceso al dispositivo y a otros orígenes |
| Dependencia del entorno | Las APIs y capacidades disponibles pueden variar |

El tipado dinámico aporta flexibilidad, pero puede generar resultados inesperados:

```js
const precio = "20";
const gastosEnvio = 5;

console.log(precio + gastosEnvio); // "205"
```

El operador `+` concatena los valores porque `precio` es una cadena. La conversión explícita evita la ambigüedad:

```js
console.log(Number(precio) + gastosEnvio); // 25
```

Los errores pueden ser:

- **De sintaxis:** el código no respeta las reglas del lenguaje.
- **De ejecución:** una instrucción falla mientras se ejecuta.
- **Lógicos:** el programa termina, pero el resultado es incorrecto.

### 8.3. Programación dirigida por eventos

Una aplicación web permanece a la espera de eventos como la carga del documento, la pulsación de un botón o la llegada de una respuesta.

```js
const boton = document.querySelector("#inscribirse");

boton.addEventListener("click", () => {
  console.log("El usuario quiere inscribirse");
});
```

El navegador detecta el evento `click` y ejecuta la función asociada. Los eventos se estudiarán en profundidad en una unidad posterior.

### 8.4. Ventajas e inconvenientes

| Ventajas { .table-bg-principal .table-cl-secundario } | Inconvenientes { .table-bg-principal .table-cl-secundario } |
|---|---|
| Respuesta inmediata e interfaces dinámicas | El código puede inspeccionarse y modificarse |
| Actualización parcial del contenido | No debe contener secretos ni aplicar por sí solo la seguridad |
| Menos peticiones para operaciones locales | El rendimiento depende del dispositivo |
| Portabilidad entre navegadores compatibles | Pueden existir diferencias de compatibilidad |
| Desarrollo y despliegue rápidos | Algunos errores solo aparecen durante la ejecución |

!!! actividad "Actividad opcional"

    Responde brevemente:

    1. ¿Qué proporciona el navegador al código JavaScript?
    2. ¿Por qué `"20" + 5` produce `"205"`?
    3. ¿Qué diferencia existe entre un error de ejecución y uno lógico?
    4. ¿Qué significa programación dirigida por eventos?
    5. ¿Por qué el código cliente no debe contener secretos?

!!! salto-pagina-pdf ""
