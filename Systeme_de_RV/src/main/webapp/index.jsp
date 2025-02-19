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
    <link rel="stylesheet" href="./css/style.css" />
</head>

<body>
<header>
    <nv>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-3 col-10">
                    <img class="w-3" src="./assets/imges/logo.png" alt="" />
                </div>
                <div class="col-lg-2 col-md-3 p-3 md">
                    <a href="" class="text-decoration ">Medicine</a>
                </div>
                <div class="col-lg-2 col-md-3 p-3 md">
                    <a href="" class="text-decoration">Rendezvous</a>
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
                <div class="col-lg-6 col-md-12 col-12 p-t-5">
                    <h3 class="pt-5 sm">Bienvenue sur DoctorRV</h3>
                    <button class="btn color  mt-4 mr">Prendre rendez-vous</button>
                </div>
                <div class="col-lg-6 col-md-12 col-12">
                    <img class="img" src="./assets/imges/pages2.svg" alt="">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 p-4">
                    <h5>Doctors : </h5>
                </div>
                <div class="col-lg-4 col-md-6 mdt">
                    <div class="card shadow" >
                        <img src="assets/imges/pages1.svg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">Doctor1</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mdt">
                    <div class="card shadow" >
                        <img src="assets/imges/pages1.svg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">Doctor2</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mdt">
                    <div class="card shadow" >
                        <img src="assets/imges/pages1.svg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">Doctor3</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <form action="insert" method="post">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 p-4">
                    <h3>Rendez-vous</h3>
                </div>

                <div class="col-lg-6 col-md-6">  <input type="text" name="nom" class="form-control" placeholder="Nom">
                </div>
                <div class="col-lg-6 col-md-6 smm">  <input type="email" name="email" class="form-control"  placeholder="Email">
                </div>
                <div class="col-lg-6 col-md-6 pt-4">  <input type="text" name="telephone" class="form-control"  placeholder="Telephone">
                </div>
                <div class="col-lg-6 col-md-6 pt-4">  <input type="date" name="date" class="form-control" >
                </div>
                <div class="col-lg-6 col-md-6 pt-4">  <input type="text" name="status" class="form-control" placeholder="Status" >
                </div>
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
                <p> © 2025 DoctorRV,Développeur par BOUMAGHDAR KHALID  </p>
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
