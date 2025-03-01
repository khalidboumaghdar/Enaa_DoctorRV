package com.Model;

public class Patients extends User {
    public Patients(int id, String nom, String eamil, String telephone, String password) {
        super(id, nom, eamil, telephone, password);
    }

    public Patients(int id, String nom, String eamil, String telephone) {
        super(id, nom, eamil, telephone);
    }

    public Patients(String telephone, String eamil, String nom, int id) {
        super(telephone, eamil, nom, id);
    }

    public Patients(String nom, String eamil, String telephone) {
        super(nom, eamil, telephone);
    }

    public String toString() {
        return "Patients{" +
                super.toString() +
                "}";
    }
}
