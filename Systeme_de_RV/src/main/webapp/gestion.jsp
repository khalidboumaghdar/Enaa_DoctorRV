<%@ page import="java.util.List" %>
<%@ page import="com.Model.Doctor" %>
<%@ page import="com.Model.Login" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    HttpSession sessionObj = request.getSession(false);
    Login user = (sessionObj != null) ? (Login) sessionObj.getAttribute("user") : null;
%>
<!doctype html>
<html lang="en">
<head>
    <title>DoctorRV</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <style><%@include file="css/style.css"%></style>
</head>

<body>
<header>
    <nv>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-3 col-10">
                    <img class="w-3" src="https://images2.imgbox.com/fd/fc/Qt6XUmHG_o.png" alt="" />
                </div>
                <div class="col-lg-2 col-md-3 p-3 md">
                    <% if (user != null && "Patient".equals(user.getRole())) { %>                    <a href="#Medcine" class="text-decoration">Medicine</a>
                    <% } else { %>
                    <a href="Medcine" class="text-decoration">Medicine</a>
                    <% } %>
                </div>
                <div class="col-lg-2 col-md-3 p-3 md">
                    <a href="Rendezvous" class="text-decoration">Rendezvous</a>
                </div>
                <% if (user == null) { %>
                <div class="col-lg-2 col-md-3 p-3 md">
                    <a href="login" class="btn color">Login</a>
                </div>
                <% } else { %>
                <div class="col-lg-2 col-md-3 p-3 md">
                    <p>Bienvenue, <%= user.getNom() %></p>
                    <a href="logout.jsp" class="btn btn-danger">Logout</a>
                </div>
                <% } %>
                <div class="col-2">
                    <a href="javascript:void(0);" class="text-decoration display" onclick="myFunction()"><i class="bi bi-list"></i></a>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div id="myLinks" class="shadow p-4">
                    <a href="Medcine" class="pt-4">Medicine</a>
                    <a href="" class="pt-4">Rendezvous</a>
                    <a href="" class="btn color mt-4">Login</a>
                </div>
            </div>
        </div>
    </nv>
</header>
<main>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-12 p-t-5">
                    <h3 class="pt-5 sm">Bienvenue sur DoctorRV</h3>
                    <button class="btn color mt-4 mr">Prendre rendez-vous</button>
                </div>
                <div class="col-lg-6 col-md-12 col-12">
                    <img class="img" src="https://images2.imgbox.com/7d/bf/DxHcmjZG_o.png" alt="">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 p-4">
                    <h5>Doctors:</h5>
                </div>
                <%
                    List<Doctor> doctors1 = (List<Doctor>) request.getAttribute("listDoctors");
                    for(Doctor doctor : doctors1){
                %>
                <div class="col-lg-4 col-md-6 mdt">
                    <div class="card shadow">
                        <img src="https://images2.imgbox.com/48/24/9oWYa6tf_o.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text"><%= doctor.getNom() %></p>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
        <form action="insert" method="post">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 p-4">
                        <h3>Rendez-vous</h3>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <input type="text" name="nom" class="form-control" placeholder="Nom">
                    </div>
                    <div class="col-lg-6 col-md-6 smm">
                        <input type="email" name="email" class="form-control" placeholder="Email">
                    </div>
                    <div class="col-lg-6 col-md-6 pt-4">
                        <input type="text" name="telephone" class="form-control" placeholder="Telephone">
                    </div>
                    <div class="col-lg-6 col-md-6 pt-4">
                        <input type="date" name="date" class="form-control">
                    </div>
                    <div class="col-lg-6 col-md-6 pt-4">
                        <input type="text" name="status" class="form-control" placeholder="Status">
                    </div>
                    <div class="col-lg-6 col-md-6 pt-4">
                        <select class="form-select" name="doctorID" aria-label="Default select example">
                            <option selected>Selectionner doctor</option>
                            <%
                                List<Doctor> doctors = (List<Doctor>) request.getAttribute("listDoctors");
                                for(Doctor doctor : doctors){
                            %>
                            <option name="doctorID" value="<%= doctor.getId() %>"><%= doctor.getNom() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-lg-6 col-md-6"></div>
                    <div class="col-lg-6 col-md-6"></div>
                    <div class="col-lg-6 col-md-6 mt-4">
                        <button type="submit" class="btn color">Envoiyer</button>
                    </div>
                </div>
            </div>
        </form>
    </section>
</main>
<footer class="pt-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <hr>
            </div>
            <div class="col-lg-12 text-center">
                <p> © 2025 DoctorRV, Développeur par BOUMAGHDAR KHALID </p>
            </div>
        </div>
    </div>
</footer>
<script>
    function myFunction() {
        var x = document.getElementById("myLinks");
        if (x.style.display === "block") {
            x.style.display = "none";
        } else {
            x.style.display = "block";
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>
