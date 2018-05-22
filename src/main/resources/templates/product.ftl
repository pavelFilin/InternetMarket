<#import "parts/common.ftl" as c>
<#import "parts/categories.ftl" as categories>

<@c.page>
 <!--Сontent-->
        <div class="container-fluid" id="content">
            <div class="row">
                    <@categories.categories/>
                <div class="col-md-9 bg-light text-dark">
                    <div class="row">
                        <div class="input-group search-place">
                            <input type="text" class="form-control" placeholder="Поиск" aria-label="Search term"
                                   aria-describedby="basic-addon">
                            <div class="input-group-append">
                                <button class="btn btn-outline-primary" type="button">Найти!</button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb small" style="margin-bottom: 0">
                                <li class="breadcrumb-item"><a href="#">Категория</a></li>
                                <li class="breadcrumb-item"><a href="#">Саб категория</a></li>
                                <li class="breadcrumb-item"><a href="#">Сабсаб категория</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Сабсабсаб категория</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="border">
                                <img src="../img/productTemp.png" class="img-thumbnail mx-auto d-block  ">
                            </div>
                        </div>
                        <div class="col-md-6 ">
                            <div class="row">
                                <div class="col"><h3>Название товара</h3></div>
                            </div>
                            <div class="row">
                                <div class="col"><h5 class="text-primary">######## Р</h5></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col"><h5>Описание товара</h5>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut commodi debitis
                                    dolor, error
                                    expedita labore maiores perspiciatis qui quo repellendus reprehenderit sequi
                                    tenetur
                                    voluptates. A asperiores, blanditiis consequatur cupiditate deleniti deserunt
                                    dignissimos
                                    dolore expedita facere ipsa iusto, laboriosam, maxime officiis omnis quia.
                                    Aliquam hic ipsa
                                    pariatur possimus reprehenderit sint temporibus.</p></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <@c.footer/>
</@c.page>
