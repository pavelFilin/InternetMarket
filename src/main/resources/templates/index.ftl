<#import "parts/common.ftl" as c>
<#import "parts/categories.ftl" as ct>

<@c.page>
<@c.nav/>
<div class="container-fluid" id="content">
    <div class="row">
        <@ct.categories/>
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
                    <input type="text" class="form-control" placeholder="Поиск" aria-label="Search term" aria-describedby="basic-addon">
                    <div class="input-group-append">
                        <button class="btn btn-outline-primary" type="button">Найти!</button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4  product-container">
                    <div class="product-image">
                        <img src="/img/img.jpg" alt="" class=" mx-auto rounded  d-block">
                    </div>
                    <div class="product-name text-center">
                        <span>Телескопическая карбоновая удочка 1.5м Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus aperiam autem eligendi fuga laboriosam maxime nihil provident sed sunt ut. Cumque deleniti dolorem eligendi eos facilis inventore magnam voluptate voluptatum?20</span>
                    </div>
                    <div class="product-price text-center">
                        <h3>7000 Р</h3>
                    </div>
                    <div class="product-buttons text-center ">
                        <button class="btn bg-light align-self-center">Купить</button>
                    </div>
                </div>
                <div class="col-md-4  product-container">
                    <div class="product-image">
                        <img src="/img/img.jpg" alt="" class="rounded mx-auto d-block">
                    </div>
                    <div class="product-name text-center">
                        <span>Название продукта</span>
                    </div>
                    <div class="product-price text-center">
                        <h3>7000 Р</h3>
                    </div>
                    <div class="product-buttons text-center ">
                        <button class="btn bg-light align-self-center">Купить</button>
                    </div>
                </div>
                <div class="col-md-4  product-container">
                    <div class="product-image">
                        <img src="../img/img.jpg" alt="" class="rounded mx-auto d-block">
                    </div>
                    <div class="product-name text-center">
                        <span>Название продукта</span>
                    </div>
                    <div class="product-price text-center">
                        <h3>7000 Р</h3>
                    </div>
                    <div class="product-buttons text-center ">
                        <button class="btn bg-light align-self-center">Купить</button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4  product-container">
                    <div class="product-image">
                        <img src="../img/img.jpg" alt="" class="rounded mx-auto d-block">
                    </div>
                    <div class="product-name text-center">
                        <span>Название продукта</span>
                    </div>
                    <div class="product-price text-center">
                        <h3>7000 Р</h3>
                    </div>
                    <div class="product-buttons text-center ">
                        <button class="btn bg-light align-self-center">Купить</button>
                    </div>
                </div>
                <div class="col-md-4 product-container">
                    <div class="product-image">
                        <img src="../img/img.jpg" alt="" class="rounded mx-auto d-block">
                    </div>
                    <div class="product-name text-center">
                        <span>Название продукта</span>
                    </div>
                    <div class="product-price text-center">
                        <h3>7000 Р</h3>
                    </div>
                    <div class="product-buttons text-center ">
                        <button class="btn bg-light align-self-center">Купить</button>
                    </div>
                </div>
                <div class="col-md-4  product-container">
                    <div class="product-image">
                        <img src="../img/img.jpg" alt="" class="rounded mx-auto d-block ">
                    </div>
                    <div class="product-name text-center">
                        <span>Название продукта</span>
                    </div>
                    <div class="product-price text-center">
                        <h3>7000 Р</h3>
                    </div>
                    <div class="product-buttons text-center ">
                        <button class="btn bg-light align-self-center">Купить</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<@c.footer/>
</@c.page>




