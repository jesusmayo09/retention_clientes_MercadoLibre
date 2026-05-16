### Analisis de Retencion de Clientes para MercadoLibre

### Contexto del Negocio

¿En qué etapa se pierden más usuarios?

* Entre el [01/01/2025] y el [08/31/2025], ¿cuál es la tasa de conversión entre cada etapa clave del embudo?.
* ¿En qué paso se observa la mayor caída porcentual de usuarios?
* ¿Cómo varía esta pérdida por país (country)?

¿Qué tan bien retenemos a los usuarios a lo largo del tiempo?

* Para los usuarios que se registraron entre el [01/01/2025] y el [06/01/2025], ¿cuál es la tasa de retención en D7, D14, D21, D28?

* ¿Cómo se comporta la retención por país (country)?

### PARTE 1 – Explorar el esquema y comprender el flujo

### PARTE 2 - Construir el embudo de conversion

* Crear CTEs por etapa

Objetivo: Construir bloques de usuarios únicos por evento (CTEs) en el rango 2025-01-01 → 2025-08-31, unirlos y contar usuarios por etapa del embudo.

*  Calcular conversiones entre etapas

Objetivo: A partir de los conteos por etapa del embudo, calcular el porcentaje de conversión desde la etapa inicial (first_visit) hacia cada etapa.

*  Segmentar el Embudo General por país

Objetivo: agrupa las conversiones del embudo por país (country) y detecta en que etapa del funnel se pierde más a los usuarios.

### PARTE 3 - Analizar retencion y cohortes

* Contar usuarios activos acumulados por país (D7, D14, D21, D28)

Objetivo: Para cada país, contar usuarios activos acumulados desde su registro, en el rango 2025-01-01 → 2025-08-31, al día 7, día 14, día 21 y día 28.

* Convertir conteos a % de retención por país

Objetivo: Convertir los conteos del Task 1 en porcentajes de retención por país al día 7, día 14, día 21 y día 28.

*  Definir la cohorte de registro

Objetivo:  Ahora vamos a analizar la retención por cohort. El primer paso es crear una consulta SQL que asigne el cohort en formato YYYY-MM a cada usuario (usando su primera fecha de registro). 

* Calcular retención por cohorte y periodo D7, D14, D21, D28

Objetivo: Ahora, para cada cohorte mensual (YYYY-MM), vas a calcular el % de usuarios activos al día 7, 14, 21, y 28  desde su registro.
