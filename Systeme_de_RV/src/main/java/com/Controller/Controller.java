package com.Controller;

import com.DAO.DAO;
import com.Model.Doctor;
import com.Model.Login;
import com.Model.Patients;
import com.Model.Rendezvous;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

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
                case "/Rendezvous":
                    listRoundivous(request, response);
                    break;
                case "/Medcine":
                    listDoctor2(request, response);
                    break;
                case "/deletedoctor":
                    deleteMedcin(request, response);
                    break;
                case "/delete":
                    deleteRendivous(request, response);
                    break;
                case "/update":
                    updateRendivous(request, response);
                    break;
                case "/Register":
                    Register(request, response);
                    break;
                case "/updateMedcine":
                    updateMedecin(request, response);
                    break;
                case "/login":
                    login(request, response);
                    break;
                case "/CheckLogin":
                    CheckLogin(request, response);
                    break;
                case "/Rgisteruser":
                    addRegister(request,response);
                    break;
                default :
                    listDoctors(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());

        }

    }
    private void updateRendivous(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String telephone = request.getParameter("telephone");
        String date = request.getParameter("date");
        Date dt = Date.valueOf(date);
        String status = request.getParameter("status");
        int doctorID = Integer.parseInt(request.getParameter("doctorID"));

        Patients patients = dao.getPatientByEmail(request.getParameter("email"));
        if (patients == null) {
            System.out.println("Erreur: Patient non trouvé avec cet email.");
            return;
        }
        patients.setNom(nom);
        patients.setTelephone(telephone);
        Rendezvous rendezvous = new Rendezvous(id, dt, status, doctorID, patients);
        boolean isUpdated = dao.update(rendezvous);
        if (isUpdated) {
            response.sendRedirect("./");
        } else {
            System.out.println("erorr d'ajout");
        }
    }

    private void updateMedecin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        Doctor doctor = new Doctor(id, nom, email, telephone);
        dao.updateMedecin(doctor);
        System.out.println(doctor);
        response.sendRedirect("./Medcine");
    }
    private void deleteRendivous(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteRendivous(id);
        response.sendRedirect("./Rendezvous");

    }
    private void deleteMedcin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteMedcine(id);
        response.sendRedirect("./Medcine");

    }

    private void insertPatients(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String date = request.getParameter("date");
        Date dt = Date.valueOf(date);
        int doctorID = Integer.parseInt(request.getParameter("doctorID"));
        String status = request.getParameter("status");

        DAO dao = new DAO();
        Patients patients = dao.getPatientByEmail(email);

        if (patients == null) {
            patients = new Patients(nom, email, telephone);
            dao.insertPatients(patients);
        }

        Rendezvous rendezvous = new Rendezvous(dt, status, doctorID, patients);
        dao.insertRendezvous(rendezvous);

        response.sendRedirect("./");
    }
    private void addRegister(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String telephone = request.getParameter("motpass");
        Login login = new Login(nom, email, telephone);
       dao.insertLogin(login);

        response.sendRedirect("./login");
    }
    private void CheckLogin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String email = request.getParameter("email");
        String motpass = request.getParameter("motpass");

        Login login = new Login(email, motpass);
        String nom = dao.checkLogin(login);

        if (nom != null) {
            // Store user session
            HttpSession session = request.getSession();
            session.setAttribute("user", nom);

            response.sendRedirect("./");
        } else {
            response.sendRedirect("./Register");
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");

        dispatcher.forward(request, response);

    }
    private void listDoctors(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Doctor> listDoctors=dao.selectAllDoctors();
        request.setAttribute("listDoctors", listDoctors);
        RequestDispatcher dispatcher = request.getRequestDispatcher("gestion.jsp");

        dispatcher.forward(request, response);

    }

    private void listDoctor2(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Doctor> listDoctors=dao.selectAllDoctors();
        request.setAttribute("listDoctors", listDoctors);
        RequestDispatcher dispatcher = request.getRequestDispatcher("medcine.jsp");

        dispatcher.forward(request, response);

    }
    private void Register(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("Register.jsp");

        dispatcher.forward(request, response);

    }
    private void listRoundivous(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
       List<Rendezvous> listerendivous=dao.selectAllRendezvous();
        List<Doctor> listDoctors=dao.selectAllDoctors();
        request.setAttribute("listDoctors", listDoctors);
       request.setAttribute("listerendivous", listerendivous);
        RequestDispatcher dispatcher = request.getRequestDispatcher("rendivous.jsp");

        dispatcher.forward(request, response);


    }


}
