package com.Model;

abstract class User {
    private int id;
    private String nom;
    private String eamil;
    private String telephone;
    private String password;

    public User(int id, String nom, String eamil, String telephone, String password) {
        this.id = id;
        this.nom = nom;
        this.eamil = eamil;
        this.telephone = telephone;
        this.password = password;
    }

    public User(int id, String nom, String eamil, String telephone) {
        this.id = id;
        this.nom = nom;
        this.eamil = eamil;
        this.telephone = telephone;
    }

    public User(String telephone, String eamil, String nom, int id) {
        this.telephone = telephone;
        this.eamil = eamil;
        this.nom = nom;
        this.id = id;
    }

    public User(String nom, String eamil, String telephone) {
        this.nom = nom;
        this.eamil = eamil;
        this.telephone = telephone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getEamil() {
        return eamil;
    }

    public void setEamil(String eamil) {
        this.eamil = eamil;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", eamil='" + eamil + '\'' +
                ", telephone='" + telephone + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
