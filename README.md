# 📊 **Proyecto de Análisis y Reporting de Ventas en eCommerce**

Este proyecto analiza datos de ventas de una empresa de eCommerce utilizando BigQuery para la limpieza y transformación de los datos, y Google Sheets/Excel para el análisis avanzado y la creación de un dashboard interactivo.

El flujo de trabajo combina:
* Queries en BigQuery para crear tablas limpias y dimensionales.
* Conexión directa de los resultados a Google Sheets.
* Uso de tablas dinámicas y fórmulas personalizadas para calcular KPIs clave y construir el dashboard final.
---
## 📌 **Estructura del Proyecto**
```
/ecommerce-dashboard
│── /dashboards
│   ├── eCommerce_Dashboard.xlsx
│   ├── /images
│   │   ├── Dashboard_Complete.png
│   │   ├── dashboard_France_november.png
│   │   ├── dashboard_UK_holidays.png
│── /data
│   ├── /datamodel # Tablas de hechos y dimensiones
│   │   ├── Customers.csv
│   │   ├── OrderProducts.csv
│   │   ├── Orders.csv
│   │   ├── Products.csv
│   ├── CleanedData.csv # Rename de columnas y fechas en formato correcto
│   ├── data.csv # Dataset original de kaggle
│   ├── RawData.csv # Data volcada inicialmente en BigQuery
│── /sql-queries
│   ├── /Analysis 
│   │   ├── most-spent-client-country.sql
│   │   ├── net-income-country-month.sql
│   │   ├── new-clients-country-month.sql
│   │   ├── products-returned-country-date.sql
│   │   ├── products-sold-country-date.sql
│   │   ├── recurrent-clients-country.sql
│   │   ├── return-rate-country.sql
│   │   ├── return-rate-product.sql
│   │   ├── return-client-country-date.sql
│   │   ├── return-country-month.sql
│   │   ├── sales-country-day.sql
│   │   ├── sales-country-month.sql
│   │   ├── sales-country-year.sql
│   │   ├── sales-hour.sql
│   │   ├── sales-weekday.sql
│   │   ├── spent-client-order.sql
│   │   ├── unique-client-country-month.sql
│   ├── Dimension_Tables.sql
│   ├── Format_Data.sql # Crea la tabla CleanedData
│── README.md
```
---
## 📊 **1. Preparación de Datos (BigQuery)**

Las queries en la carpeta /queries incluyen:
✅ Limpieza de RawData → Creación de CleanedData con fechas en formato correcto.
✅ Tablas Dimensionales → Clientes, Productos y Pedidos.
✅ Consultas de análisis → Ventas por país, clientes, productos más vendidos y devoluciones.

📌 Esto permite una base sólida para análisis posteriores y vinculación directa con Google Sheets.

---
## ⚙️ **2. Dashboard en Google Sheets**

El dashboard interactivo se creó en Google Sheets, usando datos conectados directamente desde BigQuery con:
* Tablas dinámicas para segmentar ventas, devoluciones y clientes.
* Fórmulas avanzadas (ej. cálculos de ratios, KPIs financieros y de clientes).

📌 El dashboard final: dashboards/eCommerce_Dashboard.xlsx

### 🔎 **¿Qué contiene este dashboard?**

✅ KPIs Clave de Negocio: Ventas totales, Net Revenue, Average Order Value, clientes únicos...
✅ Análisis temporal: Crecimiento anual y mensual de ventas.
✅ Clientes top: Identificación de clientes de alto valor.
✅ Análisis de devoluciones: Net Revenue vs Return Cost, información sobre devoluciones en los países y productos con más ventas.
✅ Filtros interactivos: Se pueden filtrar los resultados por país y fecha.

### 📷 **Dashboard Previews**
#### 🔹 **Dashboard**
<img src="dashboards/images/Dashboard_Complete.png" alt="Dashboard" width="500"/>

#### 🔹 **Último cuatrimestre de Reino Unido**
<img src="dashboards/images/dashboard_UK_holidays.png" alt="Dashboard" width="500"/>

#### 🔹 **Francia en Noviembre**
<img src="dashboards/images/dashboard_France_november.png" alt="Dashboard" width="500"/>

---
## 📈 **3. Insights Clave del Análisis**
**Ventas y rendimiento general**
* Ventas totales: £8.9M
* Average Order Value: £374
* Frecuencia de compra: 1.62 pedidos por cliente.
* 
**Devoluciones**
* 19.7% de unidades devueltas, pero solo constituyen el 6.86% del valor total.
* El Reino Unido concentra la mayoría de devoluciones (£540k).
* Algunos productos clave como PAPER CRAFT, LITTLE BIRDIE, MEDIUM CERAMIC TOP STORAGE JAR destacan tanto en ventas como en devoluciones.

**Crecimiento anual**
* Crecimiento YoY alto (+1,356%), debido en gran parte a un periodo inicial reducido.

**Segmentación geográfica**
* La mayor parte de las ventas se dan en Reino Unido.
* Otros países (Países Bajos, EIRE, Alemania, Francia, España, Australia) muestran potencial de expansión.

**Clientes**
* 13,675 clientes únicos, de los cuales, aproximadamente un tercio (4,372), son nuevos.
* Los clientes top generan gran parte de ingresos.

---
## 📥 **4. Instalación y Uso**
### *Descargar el Repositorio*
```
git clone https://github.com/angelfergar/ecommerce-dashboard.git
cd ecommerce-dashboard
```
### **Reproducir el análisis**
* Volcar data en BigQuery y usar los archivos en /queries en BigQuery.
* Vincular cada resultado en Google Sheets.
* Usar el archivo dashboards/ecommerce_dashboard.xlsx para explorar KPIs y gráficos.

---
## 📈 **5. Resultados Clave**
* El negocio está en crecimiento, con mayor concentración en Reino Unido.
* Alta tasa de devoluciones en unidades (19.7%), pero bajo impacto en valor (6.9%).
* Los clientes top y productos más vendidos concentran la mayor parte de ingresos, lo que abre oportunidades en retención y fidelización.
* Mercados secundarios ofrecen espacio para expansión.

📊 _El dashboard ofrece visualizaciones detalladas para profundizar en cada insight._

---
## 🤝 **6. Contribución**
¡Sugerencias y mejoras son bienvenidas! 🚀

📌** Desarrollado por:** Ángel Fernández
✉️ **Contacto:** anfernagar@gmail.com

