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
    <section class="h-100 bg-dark">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col">
                    <div class="card card-registration my-4">
                        <div class="row g-0">
                            <div class="col-xl-6 d-none d-xl-block">
                                <img src="https://images2.imgbox.com/40/d4/fq7iE2lw_o.png"
                                     alt="Sample photo" class="img-fluid"
                                     style="border-top-left-radius: .25rem;height:30rem; border-bottom-left-radius: .25rem;" />
                            </div>
                            <div class="col-xl-6">
                                <div class="card-body p-md-5 text-black">
                                    <h3 class="mb-5 text-uppercase"> registration </h3>
                                    <form action="Rgisteruser" method="post">
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div data-mdb-input-init class="form-outline">
                                                <input type="text" name="nom" id="nom" class="form-control form-control-lg" />
                                                <label class="form-label" for="nom">Name</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div data-mdb-input-init class="form-outline">
                                                <input type="email" id="email" name="email" class="form-control form-control-lg" />
                                                <label class="form-label" for="email">Email</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div data-mdb-input-init class="form-outline">
                                                <input type="password" name="motpass" id="password" class="form-control form-control-lg" />
                                                <label class="form-label" for="password">Password</label>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="d-flex justify-content-end pt-3">
                                        <button  type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-warning btn-lg ms-2">Register</button>
                                    </div>
                                    </form>
                                </div>

                            </div>
                        </div>
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
