package com.Controller;

import com.DAO.DAO;
import com.Model.Patients;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/")
public class Controller extends HttpServlet {
    public DAO dao;
    public void init() {
        dao = new DAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {

                case "/insert":
                    insertPatients(request, response);
                    break;
                case "/delete":

                    break;
                case "/update":

                    break;
                default :


                    break;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());

        }

    }
    private void insertPatients(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");

        Patients patients = new Patients(nom, email, telephone);
        DAO dao = new DAO();
        dao.insertPateints(patients);
        response.sendRedirect("index.jsp");
        System.out.println(patients);
    }
}
