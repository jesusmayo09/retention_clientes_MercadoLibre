# 📊 Análisis de Retención de Clientes para MercadoLibre

![Status](https://img.shields.io/badge/status-completed-brightgreen)
![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blue)
![Data Analysis](https://img.shields.io/badge/Analysis-Funnel%20%26%20Retention-orange)
![License](https://img.shields.io/badge/license-MIT-green)

> **Análisis estratégico del embudo de conversión y retención de usuarios en MercadoLibre**, identificando puntos críticos de pérdida de clientes y patrones de comportamiento por geografía y cohortes temporales.

---

## 🎯 Descripción del Proyecto

Este proyecto realiza un **análisis integral de datos de usuarios** de MercadoLibre enfocado en dos áreas críticas:

1. **📉 Embudo de Conversión (Funnel Analysis)**
   - Identificar en qué etapa del customer journey se pierden más usuarios
   - Calcular tasas de conversión entre etapas clave
   - Analizar diferencias por país y geografía

2. **📈 Retención de Usuarios (Cohort Analysis)**
   - Medir la retención en los primeros 28 días (D7, D14, D21, D28)
   - Segmentar usuarios por cohortes mensuales de registro
   - Identificar patrones de retención por país

**Período analizado:** Enero 1, 2025 - Agosto 31, 2025

---

## 📋 Preguntas de Negocio

### Pregunta 1: ¿En qué etapa se pierden más usuarios?

- **¿Cuál es la tasa de conversión entre cada etapa del embudo?**
  - Comparar usuarios que avanzan de una etapa a otra
  - Calcular porcentaje de conversión en cada paso

- **¿En qué paso se observa la mayor caída?**
  - Identificar el cuello de botella del funnel
  - Cuantificar el impacto en términos de usuarios perdidos

- **¿Cómo varía por país?**
  - Segmentar el análisis por geografía
  - Identificar patrones específicos por mercado

---

### Pregunta 2: ¿Qué tan bien retenemos a los usuarios?

- **¿Cuál es la tasa de retención en D7, D14, D21, D28?**
  - Usuarios que regresan el día 7 después del registro
  - Usuarios que regresan el día 14, 21 y 28
  - Tendencia de retención a lo largo del tiempo

- **¿Cómo se comporta la retención por país?**
  - Diferencias geográficas en patrones de retención
  - Mercados de alto/bajo rendimiento

- **¿Cómo se comporta por cohorte de registro?**
  - Análisis por mes de registro (YYYY-MM)
  - Tendencias temporales de retención

---

## 🔍 Conceptos Clave

### 📊 Embudo de Conversión (Funnel)

Etapas del customer journey que analizamos:

```
first_visit → signup → first_purchase → repeat_purchase
     100%       ↓        ↓                ↓
             (X%)     (Y%)             (Z%)
```

- **first_visit**: Primer acceso del usuario a la plataforma
- **signup**: Registro/creación de cuenta
- **first_purchase**: Primer compra realizada
- **repeat_purchase**: Compra adicional (retención)

**Métrica clave:** Tasa de conversión = (usuarios en etapa N / usuarios en etapa N-1) × 100%

---

### 📈 Retención (Retention)

Medida de cuántos usuarios activos regresan a la plataforma después del registro inicial.

```
Retención D7  = (Usuarios activos en día 7 / Total registrados) × 100%
Retención D14 = (Usuarios activos en día 14 / Total registrados) × 100%
Retención D21 = (Usuarios activos en día 21 / Total registrados) × 100%
Retención D28 = (Usuarios activos en día 28 / Total registrados) × 100%
```

**Interpretación:**
- **D7 > 50%**: Retención excelente
- **D7 30-50%**: Retención buena
- **D7 < 30%**: Requiere mejora

---

### 👥 Análisis de Cohortes

Agrupa usuarios por su mes de registro (YYYY-MM) y sigue su comportamiento a lo largo del tiempo.

**Beneficio:** Identifica si la retención mejora o empeora con el tiempo

```
Cohorte 2025-01: 100% (registro) → 45% (D7) → 32% (D14) → 25% (D28)
Cohorte 2025-02: 100% (registro) → 50% (D7) → 38% (D14) → 30% (D28)
```

---

## 🛠️ Stack Tecnológico

| Componente | Tecnología |
|-----------|-----------|
| **Base de Datos** | PostgreSQL / SQL |
| **Lenguaje de Consultas** | SQL (CTEs, Window Functions, JOINs) |
| **Análisis y Visualización** | Excel / Google Sheets |
| **Formato de Reportes** | XLSX (Resumen Ejecutivo) |

---

## 📈 Hallazgos Clave

### 🔴 Puntos Críticos Identificados

1. **Mayor caída en el embudo**
   - El paso crítico es entre **signup → first_purchase**
   - Aproximadamente **50% de abandono** en esta etapa

2. **Variación significativa por país**
   - Brasil presenta mejor conversión (≈52% en repeat)
   - Argentina tiene conversión más baja (≈48% en repeat)

3. **Retención decae rápidamente**
   - D7: ~60% (inicial)
   - D28: ~32% (final)
   - **Pérdida del 47% de usuarios en 28 días**

---

### 🟢 Oportunidades

1. **Optimizar experiencia post-signup**
   - Reducir fricción en primer compra
   - Incentivos tempranos para conversión

2. **Mejorar retención temprana (D1-D7)**
   - Email de bienvenida personalizado
   - Ofertas de primer compra

3. **Análisis por país**
   - Replicar estrategias de Brasil en otros mercados
   - Investigar barreras en Argentina

---

## 📋 Métricas Principales

| Métrica | Fórmula | Interpretación |
|---------|---------|----------------|
| **Tasa de Conversión** | (Usuarios en etapa N / Usuarios en etapa N-1) × 100 | % de usuarios que avanzan |
| **Retención D7** | (Activos en D7 / Registrados) × 100 | % que vuelven a los 7 días |
| **Drop-off** | 100% - Tasa de Conversión | % de usuarios que abandonan |
| **Lifetime Retention** | Usuarios en D28 / Registrados | Retención a 28 días |

---

## 💡 Recomendaciones de Negocio

### 1. **Reducir Fricción en Primer Compra**
- **Problema:** 50% abandono entre signup → first_purchase
- **Acción:** Simplificar checkout, reducir pasos, ofrecer cupón de bienvenida
- **KPI Esperado:** Aumentar conversión a 60%+

### 2. **Mejorar Retención Temprana**
- **Problema:** Pérdida del 40% entre D7 → D28
- **Acción:** 
  - Email de confirmación personalizado
  - Recordatorios de carrito abandonado
  - Recomendaciones personalizadas
- **KPI Esperado:** Retención D28 > 40%

### 3. **Localizar por País**
- **Problema:** Variación geográfica significativa
- **Acción:** 
  - Investigar barreras en Argentina
  - Replicar mejores prácticas de Brasil
  - Ajustar ofertas por región
- **KPI Esperado:** Reducir varianza entre países

### 4. **Análisis Cohortes**
- **Acción:** Monitorear si nuevas cohortes tienen mejor/peor retención
- **Beneficio:** Detectar impacto de cambios recientes
- **Frecuencia:** Análisis mensual

