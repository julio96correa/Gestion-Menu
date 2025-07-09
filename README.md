# 🍽️ Sistema de Restaurante Web

Este es un proyecto de sistema web sencillo para gestión de platos en un restaurante, desarrollado con Java EE (Servlets + JSP), JDBC y MySQL. Permite listar, agregar, editar y eliminar platos desde una interfaz web.

## 🧑‍💻 Tecnologías usadas

- Java 
- JSP / Servlets
- Apache Tomcat 
- MySQL
- JDBC
- HTML + CSS 
- Maven

## 🧾 Configuración de la base de datos

Debes crear una base de datos llamada `restaurante` con la siguiente tabla:

```sql
CREATE DATABASE restaurante;
USE restaurante;

CREATE TABLE platos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DOUBLE NOT NULL
);
