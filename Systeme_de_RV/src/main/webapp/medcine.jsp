<%@ page import="java.util.List" %>
<%@ page import="com.Model.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>DoctorRV</title>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
    />
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
                    <a href="" class="text-decoration ">Medicine</a>
                </div>
                <div class="col-lg-2 col-md-3 p-3 md">
                    <a href="Rendezvous" class="text-decoration">Rendezvous</a>
                </div>
                <div class="col-lg-2 col-md-3 p-3 md">
                    <a href="" class="btn color">Login</a>
                </div>
                <div class="col-2 ">
                    <a href="javascript:void(0);" class="text-decoration display"   onclick="myFunction()"><i class="bi bi-list"></i></a>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div id="myLinks" class="shadow p-4">
                    <a href="" class="pt-4">Medicine</a>
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
                <div class="col-lg-12 mt-5">
                    <table class="table table-dark">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nom</th>
                            <th scope="col">Telephone</th>
                            <th scope="col">Email</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<Doctor> rendezvous = (List<Doctor>) request.getAttribute("listDoctors");
                            for(Doctor red : rendezvous){


                        %>
                        <tr>
                            <td><%= red.getId()%></td>
                            <td><%= red.getNom()%></td>
                            <td><%= red.getTelephone()%></td>
                            <td><%= red.getEmail()%></td>
                            <td>
                                <button class="btn btn-primary btn-edit"
                                        data-bs-toggle="modal"
                                        data-bs-target="#editModal"
                                        data-id="<%= red.getId()%>"
                                        data-nom="<%= red.getNom()%>"
                                        data-email="<%= red.getEmail()%>"
                                        data-telephone="<%= red.getTelephone()%>"


                                >
                                    Modifier
                                </button>
                                &nbsp;&nbsp;&nbsp;
                                <a href="deletedoctor?id=<%= red.getId()%>"
                                   class="btn btn-danger"
                                   onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce Medcine ?');">
                                    supprimer
                                </a>
                            </td>
                            </td>

                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Modifier RendiVous</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="updateMedcine" method="POST">
                            <input type="hidden" id="edit-id" name="id">

                            <div class="mb-3">
                                <label for="edit-nom" class="form-label">Nom :</label>
                                <input type="text" class="form-control" id="edit-nom" name="nom">
                            </div>
                            <div class="mb-3">
                                <label for="edit-email" class="form-label">Email :</label>
                                <input type="email" class="form-control" id="edit-email" name="email">
                            </div>
                            <div class="mb-3">
                                <label for="edit-telephone" class="form-label">Telephone :</label>
                                <input type="text" class="form-control" id="edit-telephone" name="telephone">
                            </div>



                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                                <button type="submit" class="btn btn-primary">Enregistrer</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

</main>
<footer class="pt-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <hr>
            </div>
            <div class="col-lg-12 text-center">
                <p> © 2025 DoctorRV,Développeur par BOUMAGHDAR KHALID  </p>
            </div>
        </div>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        document.querySelectorAll('.btn-edit').forEach(button => {
            button.addEventListener('click', function() {
                document.getElementById('edit-id').value = this.getAttribute('data-id');
                document.getElementById('edit-nom').value = this.getAttribute('data-nom');
                document.getElementById('edit-telephone').value = this.getAttribute('data-telephone');
                document.getElementById('edit-email').value = this.getAttribute('data-email');
            });
        });
    });
</script>
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
<script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"
></script>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"
></script>
</body>
</html>
