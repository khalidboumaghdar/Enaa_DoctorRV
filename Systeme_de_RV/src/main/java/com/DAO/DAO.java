package com.DAO;

import com.Model.Patients;

import java.sql.*;
import java.util.ArrayList;

public class DAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/db_DoctorRV?allowPublicKeyRetrieval=true&useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_Patients_SQL = "INSERT INTO Patients (nom, email, telephone) VALUES (?, ?, ?)";

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
    public void insertPateints(Patients patients) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_Patients_SQL)) {
            preparedStatement.setString(1, patients.getNom());
            preparedStatement.setString(2, patients.getEmail());
            preparedStatement.setString(3, patients.getTelephone());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
