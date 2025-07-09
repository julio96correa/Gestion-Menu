package com.mycompany.restaurante.controller;

import com.mycompany.restaurante.dao.PlatoDAO;
import com.mycompany.restaurante.model.Plato;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class PlatoServlet extends HttpServlet {
    private PlatoDAO dao = new PlatoDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");
        if (accion == null) accion = "listar";

        switch (accion) {
            case "nuevo":
                req.setAttribute("plato", new Plato()); 
                req.getRequestDispatcher("form.jsp").forward(req, resp);
                break;
            case "editar":
                int idEditar = Integer.parseInt(req.getParameter("id"));
                Plato pEditar = dao.obtener(idEditar);
                req.setAttribute("plato", pEditar);
                req.getRequestDispatcher("editar.jsp").forward(req, resp);
                break;
            case "eliminar":
                int idEliminar = Integer.parseInt(req.getParameter("id"));
                dao.eliminar(idEliminar);
                resp.sendRedirect("PlatoServlet");
                break;
            default:
                List<Plato> lista = dao.listar();
                req.setAttribute("lista", lista);
                req.getRequestDispatcher("listar.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
 
        String idParam = req.getParameter("id");
        int id = (idParam == null || idParam.isEmpty()) ? 0 : Integer.parseInt(idParam);

        String nombre = req.getParameter("nombre");
        double precio = Double.parseDouble(req.getParameter("precio"));

        Plato p = new Plato(id, nombre, precio);

        if (id == 0) {
            dao.guardar(p);
        } else {
            dao.actualizar(p);
        }

        resp.sendRedirect("PlatoServlet");
    }
}
