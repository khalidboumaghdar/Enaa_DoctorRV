package com.DAO;

import com.Model.Doctor;
import com.Model.Login;
import com.Model.Patients;
import com.Model.Rendezvous;

import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/db_DoctorRV?allowPublicKeyRetrieval=true&useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";


    private static final String SELECT_ALL = "Select * from Medecin";
    private static final String SELECT_ALL_RendezVous = "SELECT r.id, r.datet, r.status, r.id_medecin, p.email FROM RendezVous r JOIN Patients p ON r.id_patient = p.id";
    private static final String DELETE_SQL ="DELETE FROM RendezVous WHERE id = ?";
    private static final String DELETE_SQL_Medcine ="DELETE FROM Medecin WHERE id = ?";
    private static final String UPDATE_SQL = "UPDATE medecin SET nom = ?, email = ?, telephone = ? WHERE id = ?";
    private static final String UPDATE_SQL_RENDEVOUS =
            "UPDATE RendezVous r " +
                    "JOIN Patients p ON r.id_patient = p.id " +
                    "SET r.datet = ?, r.status = ?, p.nom = ?, p.telephone = ? " +
                    "WHERE r.id = ?";
    private static final String SELECT_LOGIN = "SELECT nom,email,password,role FROM login WHERE email = ? AND password = ?";






    public DAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    public boolean updateMedecin(Doctor dr) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SQL)) {
            preparedStatement.setString(1, dr.getNom());
            preparedStatement.setString(2, dr.getEmail());
            preparedStatement.setString(3, dr.getTelephone());
            preparedStatement.setInt(4, dr.getId());
            //rowUpdated = preparedStatement.executeUpdate() > 0;
            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println("Nombre de lignes mises à jour : " + rowsAffected);
            rowUpdated = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Update successful: " + rowUpdated);
        return rowUpdated;
    }
    public boolean update(Rendezvous rendezvous) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SQL_RENDEVOUS)) {

            preparedStatement.setDate(1, rendezvous.getDate());
            preparedStatement.setString(2, rendezvous.getStatus());
            preparedStatement.setString(3, rendezvous.getPatient().getNom());
            preparedStatement.setString(4, rendezvous.getPatient().getTelephone());
            preparedStatement.setInt(5, rendezvous.getId());

            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println("Nombre de lignes mises à jour : " + rowsAffected);
            rowUpdated = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Update successful: " + rowUpdated);
        return rowUpdated;
    }

    public boolean deleteRendivous(int id) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SQL)) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }
    public boolean deleteMedcine(int id) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SQL_Medcine)) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }
    public void insertPatients(Patients patients) {
        String sql = "INSERT INTO Patients (nom, email, telephone) VALUES (?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            preparedStatement.setString(1, patients.getNom());
            preparedStatement.setString(2, patients.getEamil());
            preparedStatement.setString(3, patients.getTelephone());
            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    patients.setId(generatedKeys.getInt(1));  // Set the generated ID
                }
            }
        } catch (SQLException e) {
            System.err.println("Error inserting patient: " + e.getMessage());
        }
    }
    public void insertLogin(Login login) {
        String sql = "INSERT INTO login (nom, email, password) VALUES (?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            preparedStatement.setString(1, login.getNom());
            preparedStatement.setString(2, login.getEmail());
            preparedStatement.setString(3, login.getPassword());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error inserting patient: " + e.getMessage());
        }
    }
    public Login checkLogin(Login login) {
        Login loggedInUser = null;

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LOGIN)) {

            preparedStatement.setString(1, login.getEmail());
            preparedStatement.setString(2, login.getPassword());

            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    loggedInUser = new Login();

                    loggedInUser.setNom(rs.getString("nom"));
                    loggedInUser.setEmail(rs.getString("email"));
                    loggedInUser.setPassword(rs.getString("password"));
                    loggedInUser.setRole(rs.getString("role"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return loggedInUser;
    }


    public Patients getPatientByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM Patients WHERE email = ?";
        Patients patient = null;

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                patient = new Patients(
                        resultSet.getInt("id"),
                        resultSet.getString("nom"),
                        resultSet.getString("email"),
                        resultSet.getString("telephone")

                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return patient;
    }


    public void insertRendezvous(Rendezvous rendezvous) {
        String sql = "INSERT INTO Rendezvous (datet, status, id_medecin, id_patient) VALUES (?, ?, ?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setDate(1, rendezvous.getDate());
            preparedStatement.setString(2, rendezvous.getStatus());
            preparedStatement.setInt(3, rendezvous.getDoctor());

            if (rendezvous.getPatient() != null && rendezvous.getPatient().getId() != 0) {
                preparedStatement.setInt(4, rendezvous.getPatient().getId());
            } else {
                throw new SQLException("Patient ID is missing. Cannot insert rendezvous.");
            }

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error inserting rendezvous: " + e.getMessage());
        }
    }


    public List<Doctor> selectAllDoctors() {
        List<Doctor> doctors = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
             ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {

                int id = rs.getInt("id");
                String nom =  rs.getString("nom");
                String email =  rs.getString("email");
                String telephone = rs.getString("telephone");
                doctors.add(new Doctor(id,nom, email, telephone));
                System.out.println("testmodel");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println( doctors);

        return doctors;
    }




    public List<Rendezvous> selectRendezvousByPatient(String email) {
        List<Rendezvous> rendezvousList = new ArrayList<>();
        String sql = "SELECT r.id, r.datet, r.status, r.id_medecin, p.email " +
                "FROM RendezVous r " +
                "JOIN Patients p ON r.id_patient = p.id " +
                "WHERE p.email = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                Date dt = rs.getDate("datet");
                String status = rs.getString("status");
                int id_medecin = rs.getInt("id_medecin");

                Patients patient = getPatientByEmail(email);
                rendezvousList.add(new Rendezvous(id, dt, status, id_medecin, patient));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rendezvousList;
    }





}
