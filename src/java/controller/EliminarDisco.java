/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Disco;

/**
 *
 * @author Saul
 */
public class EliminarDisco extends HttpServlet {

    EntityManagerFactory emf;
    EntityManager em;
    Disco disco;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        emf = Persistence.createEntityManagerFactory("DiscograficaPU");
        em = emf.createEntityManager();
        disco = new Disco();

        try {
            int idDisco = Integer.parseInt(request.getParameter("id"));
            System.out.println("Ide asdasd"+ idDisco);
            disco = em.find(Disco.class, idDisco);
        } catch (Exception e) {
            e.printStackTrace();
        }
        em.getTransaction().begin();
        try {
            em.remove(disco);
            em.getTransaction().commit();
            response.sendRedirect("view/Producto.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
