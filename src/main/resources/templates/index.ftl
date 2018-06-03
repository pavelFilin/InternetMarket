<#import "parts/common.ftl" as c>

<@c.page>
<div class="container-fluid" id="content">
    <div class="row">
        <div class="col-md-3 bg-dark text-light">
            <div class="container-fluid" id="catalog" style="padding: 0">
                <div><h3 style="text-align: center">Категории товаров</h3></div>
                <#list categor as categoryNode>
                    <div>
                        <nav>
                            <button class="list-group-item" style="padding: 0px; width: 100%" type="button"
                                    data-toggle="collapse"
                                    data-target="#targetCategory${categoryNode?counter}"
                                    aria-controls="navbarToggleExternalContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="list-group-item list-group-item-dark"><a
                                        href="#">${categoryNode.node.title}</a></span>
                            </button>
                        </nav>
                        <div class="collapse" id="targetCategory${categoryNode?counter}">
                            <ul class="list-group">
                               <#list categoryNode.categories as subcate>
                                   <li class="list-group-item"><a href="#"> ${subcate.node.getTitle()}</a></li>
                               </#list>
                            </ul>
                        </div>
                    </div>
                </#list>
            </div>
        </div>

        <div class="col-md-9">
            <div class="row justify-content-center bg-light" style="margin-bottom: 10px">
                <div id="newsCarouse" class="carousel slide col-12" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#newsCarouse" data-slide-to="0" class="active"></li>
                        <li data-target="#newsCarouse" data-slide-to="1"></li>
                        <li data-target="#newsCarouse" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="/img/claider1.jpg" alt="Первый слайд">

                            <div class="carousel-caption  mycarousel">
                                <h5>Новость 1</h5>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet architecto aut est
                                    eveniet quasi totam.</p>
                            </div>

                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="img/claider2.jpg" alt="Второй слайд">
                            <div class="carousel-caption  mycarousel">
                                <h5>Новость 2</h5>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet architecto aut est
                                    eveniet quasi totam.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="../img/claider3.jpg" alt="Третий слайд">
                            <div class="carousel-caption   mycarousel">
                                <h5>Новость 3</h5>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet architecto aut est
                                    eveniet quasi totam.</p>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#newsCarouse" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#newsCarouse" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
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
                <div class="col-12 mb-3">
                        <#list products as product>
                            <#if ((product?counter-1)%4)==0>
                                <div class="card-deck">
                            </#if>
                                <div class="card mb-4">
                                    <img class="card-img-top" src="/img/${product.imageUrl}" alt="${product.name}">
                                    <div class="card-body">
                                        <a href="/product/${product.id}"><h5 class="card-title">${product.name}</h5></a>
                                        <p class="card-text">${product.description}</p>
                                        <a href="javascript:void(0);" onclick="ajaxAddToCart(${product.getId()});"
                                           class="btn btn-primary">Купить</a>
                                    </div>
                                    <div class="card-footer">
                                        <h4 class="text-info">${product.price} Р</h4>
                                    </div>
                                </div>
                            <#if ((product?counter-1)%4)==3||product?is_last&&product>
                                </div>
                            </#if>
                        </#list>
                </div>
            </div>
        </div>
    </div>
</div>
    <@c.footer/>
</@c.page>




