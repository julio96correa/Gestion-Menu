<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.restaurante.model.Plato" %>
<%
    Plato plato = (Plato) request.getAttribute("plato");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Plato</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f9fc;
            padding: 30px;
        }

        h1 {
            color: #333;
        }

        form {
            background-color: #fff;
            padding: 20px;
            width: 300px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 6px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            margin-top: 15px;
            background-color: #007bff;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0069d9;
        }

        a {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            color: #555;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Editar Plato</h1>
    <form action="PlatoServlet" method="post">
        <input type="hidden" name="id" value="<%= plato.getId() %>"/>

        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" id="nombre" value="<%= plato.getNombre() %>" required/>

        <label for="precio">Precio:</label>
        <input type="number" name="precio" id="precio" value="<%= plato.getPrecio() %>" required/>

        <input type="submit" value="Guardar cambios"/>
        <a href="PlatoServlet">Cancelar</a>
    </form>
</body>
</html>
