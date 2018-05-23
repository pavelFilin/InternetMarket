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
                            <div class="">
                                <img src="/img/${product.imageUrl}" class="img-fluid">
                            </div>
                        </div>
                        <div class="col-md-6 ">
                            <div class="row">
                                <div class="col"><h3>${product.name}</h3></div>
                            </div>
                            <div class="row">
                                <div class="col"><h5 class="text-primary">${product.price} Р</h5></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col"><h5>Описание товара</h5>
                                <p>${product.description}</p></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <@c.footer/>
</@c.page>
