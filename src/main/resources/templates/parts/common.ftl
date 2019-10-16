<#macro page>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta name="_csrf" content="${_csrf.token}"/>
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
        <meta charset="UTF-8">
        <title>Fish Shop</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="/static/css/bootstrap.css">
        <link rel="stylesheet" href="/static/css/main.css">
    </head>
    <body>
    <#include "navbar.ftl">
    <div class="all-content">
        <#nested >
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
            integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
            crossorigin="anonymous"></script>
    <script src="/static/js/jquery-3.3.1.js"></script>
    <#--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
    <script src="/static/js/bootstrap.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.10/js/all.js"
            integrity="sha384-slN8GvtUJGnv6ca26v8EzVaR9DC58QEwsIk9q1QXdCU8Yu8ck/tL/5szYlBbqmS+"
            crossorigin="anonymous"></script>
    <script src="/static/js/main.js"></script>
    </body>
    </html>
</#macro>


<#macro footer>
    <footer class="page-footer font-small bg-dark text-light footer2">
        <!--Footer Links-->
        <div class="container text-center text-md-left">
            <div class="row">

                <!--First column-->
                <div class="col-md-4">
                    <h5 class="text-uppercase mb-4 mt-3 font-weight-bold">Footer Content</h5>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. A culpa cum eius expedita fugiat illo
                        iure nemo, non, nulla officia perspiciatis qui quidem quis rem reprehenderit, sunt tempora
                        tenetur. Pariatur?</p>
                </div>
                <!--/.First column-->

                <hr class="clearfix w-100 d-md-none">

                <!--Second column-->
                <div class="col-md-2 mx-auto">
                    <h5 class="text-uppercase mb-4 mt-3 font-weight-bold">Links</h5>
                    <ul class="list-unstyled">
                        <li>
                            <a href="#!">Link 1</a>
                        </li>
                        <li>
                            <a href="#!">Link 2</a>
                        </li>
                        <li>
                            <a href="#!">Link 3</a>
                        </li>
                        <li>
                            <a href="#!">Link 4</a>
                        </li>
                    </ul>
                </div>
                <!--/.Second column-->

                <hr class="clearfix w-100 d-md-none">

                <!--Third column-->
                <div class="col-md-2 mx-auto">
                    <h5 class="text-uppercase mb-4 mt-3 font-weight-bold">Links</h5>
                    <ul class="list-unstyled">
                        <li>
                            <a href="#!">Link 1</a>
                        </li>
                        <li>
                            <a href="#!">Link 2</a>
                        </li>
                        <li>
                            <a href="#!">Link 3</a>
                        </li>
                        <li>
                            <a href="#!">Link 4</a>
                        </li>
                    </ul>
                </div>
                <!--/.Third column-->

                <hr class="clearfix w-100 d-md-none">

                <!--Fourth column-->
                <div class="col-md-2 mx-auto">
                    <h5 class="text-uppercase mb-4 mt-3 font-weight-bold">Links</h5>
                    <ul class="list-unstyled">
                        <li>
                            <a href="#!">Link 1</a>
                        </li>
                        <li>
                            <a href="#!">Link 2</a>
                        </li>
                        <li>
                            <a href="#!">Link 3</a>
                        </li>
                        <li>
                            <a href="#!">Link 4</a>
                        </li>
                    </ul>
                </div>
                <!--/.Fourth column-->
            </div>
        </div>
        <!--/.Footer Links-->

        <hr>

        <!--Call to action-->
        <div class="text-center py-3">
            <ul class="list-unstyled list-inline mb-0">
                <li class="list-inline-item">
                    <h5 class="mb-1">Звонок платный</h5>
                </li>
                <li class="list-inline-item">
                    <span>8-880-555-35-35</span>
                </li>
            </ul>
        </div>
        <!--/.Call to action-->

        <hr>

        <!--Social buttons-->
        <div class="text-center">
            <ul class="list-unstyled list-inline">
                <li class="list-inline-item">
                    <a class="btn-floating btn-sm btn-fb mx-1">
                        <i class="fab fa-facebook-square"></i>
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="btn-floating btn-sm btn-tw mx-1">
                        <i class="fab fa-twitter"></i>
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="btn-floating btn-sm btn-gplus mx-1">
                        <i class="fab fa-vk"></i>
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="btn-floating btn-sm btn-li mx-1">
                        <i class="fab fa-google-plus-g"> </i>
                    </a>
                </li>
            </ul>
        </div>
    </footer>
</#macro>