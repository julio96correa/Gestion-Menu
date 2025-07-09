<%@ page import="com.mycompany.restaurante.model.Plato" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    List<Plato> lista = (List<Plato>) request.getAttribute("lista");
%>
<html>
<head><title>Lista de Platos</title>
<style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            padding: 40px;
            margin: 0;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        a.top-link, a[href*="accion=nuevo"] {
            display: inline-block;
            padding: 10px 18px;
            background-color: #28a745;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        a.top-link:hover, a[href*="accion=nuevo"]:hover {
            background-color: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #343a40;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .actions a {
            margin-right: 10px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        .actions a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            thead {
                display: none;
            }

            tr {
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 8px;
                padding: 10px;
                background-color: #fff;
            }

            td {
                padding: 10px;
                position: relative;
                padding-left: 50%;
            }

            td::before {
                content: attr(data-label);
                position: absolute;
                left: 15px;
                font-weight: bold;
                color: #555;
            }
        }
    </style>
</head>
<body>
    <h2>Lista de Platos</h2>
    <a href="PlatoServlet?accion=nuevo">Agregar Nuevo Plato</a><br><br>

    <% if (lista != null && !lista.isEmpty()) { %>
        <table border="1">
            <tr><th>ID</th><th>Nombre</th><th>Precio</th><th>Acciones</th></tr>
            <% for (Plato p : lista) { %>
                <tr>
                    <td><%= p.getId() %></td>
                    <td><%= p.getNombre() %></td>
                    <td><%= p.getPrecio() %></td>
                    <td>
                        <a href="PlatoServlet?accion=editar&id=<%= p.getId() %>">Editar</a> |
                        <a href="PlatoServlet?accion=eliminar&id=<%= p.getId() %>">Eliminar</a>
                    </td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <p>No hay platos registrados u ocurrió un error al cargarlos.</p>
    <% } %>
</body>
</html>
