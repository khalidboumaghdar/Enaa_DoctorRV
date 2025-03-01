package com.Model;

import java.sql.Date;

public class Rendezvous {
    private int id;
    private Date date;
    private String status;
    int doctor;
    Patients patient;


    public Rendezvous(int id, Date date, String status, int doctor, Patients patient) {
        this.id = id;
        this.date = date;
        this.status = status;
        this.doctor = doctor;
        this.patient = patient;
    }

    public Rendezvous(Date date, String status, int doctor, Patients patient) {
        this.date = date;
        this.status = status;
        this.doctor = doctor;
        this.patient = patient;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getDoctor() {
        return doctor;
    }

    public void setDoctor(int doctor) {
        this.doctor = doctor;
    }

    public Patients getPatient() {
        return patient;
    }

    public void setPatient(Patients patient) {
        this.patient = patient;
    }

    @Override
    public String toString() {
        return "Rendezvous{" +
                "id=" + id +
                ", date=" + date +
                ", status='" + status + '\'' +
                ", doctor=" + doctor +
                ", patient=" + patient +
                '}';
    }
}
