<#import "parts/common.ftl" as c>
<#import "parts/categories.ftl" as categoriesSpace>

<@c.page>
 <!--Сontent-->
        <div class="container-fluid" id="content">
            <div class="row">
                <div class="col-md-6 bg-light text-dark offset-3">
                    <div class="row">
                        <div class="input-group search-place">
                            <input type="text" class="form-control" placeholder="Поиск" aria-label="Search term"
                                   aria-describedby="basic-addon">
                            <div class="input-group-append">
                                <button class="btn btn-outline-primary" type="button">Найти!</button>
                            </div>
                        </div>
                    </div>
                <#--<div class="row">-->
                <#--<nav aria-label="breadcrumb">-->
                <#--<ol class="breadcrumb small" style="margin-bottom: 0">-->
                <#--<li class="breadcrumb-item"><a href="#">Категория</a></li>-->
                <#--<li class="breadcrumb-item"><a href="#">Саб категория</a></li>-->
                <#--<li class="breadcrumb-item"><a href="#">Сабсаб категория</a></li>-->
                <#--<li class="breadcrumb-item active" aria-current="page">Сабсабсаб категория</li>-->
                <#--</ol>-->
                <#--</nav>-->
                <#--</div>-->
                    <div class="row">
                        <div class="col-12 mb-4">
                            <form method="post" action="/product/addproduct" enctype="multipart/form-data">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Фото</span>
                                    </div>
                                    <div class="custom-file ">
                                        <input name="file" type="file" class="custom-file-input" id="inputGroupFile01">
                                        <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                    </div>
                                </div>
                                <div class="form-group mb-3 form-inline">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="input-group mr-2">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Назвавние</span>
                                                </div>
                                                <input name="name" type="text" class="form-control" name="productName"
                                                       placeholder="Название товара">
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="parent">Категория</label>
                                                <select name="category" class="form-control">
                                                    <option>NONE</option>
                                         <#list categories as category>
                                             <option>${category.title}</option>
                                         </#list>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="productPrise">Цена</label>
                                            <input name="price" type="number" class="form-control form-control-lg" id="productPrice"
                                                   placeholder="">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="productPrise">Гарантия</label>
                                            <input name="warrantyMonths" type="number" class="form-control form-control-lg"
                                                   placeholder="">
                                            <small  class="form-text text-muted">Если есть!</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Описание</span>
                                    </div>
                                    <textarea name="description" class="form-control"></textarea>
                                </div>

                                <div class="row justify-content-center">
                                    <div class="col-md-4">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <input type="submit" class="btn btn-primary">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <@c.footer/>
</@c.page>
