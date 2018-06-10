<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">


<@c.page>
 <!--Сontent-->
        <div class="container-fluid" id="content">
            <div class="row">
                <div class="col-md-3 bg-dark text-light">
                    <div class="container-fluid" id="catalog" style="padding: 0">
                        <div><h3 style="text-align: center">Категории товаров</h3></div>
                        <#list categoryTree as categoryNode>
                            <div>
                                <nav>
                                    <button class="list-group-item" style="padding: 0px; width: 100%" type="button"
                                            data-toggle="collapse"
                                            data-target="#targetCategory${categoryNode?counter}"
                                            aria-controls="navbarToggleExternalContent"
                                            aria-expanded="false" aria-label="Toggle navigation">
                                        <span class="list-group-item list-group-item-dark"><a
                                                href="/categories/${categoryNode.node.getId()}">${categoryNode.node.title}</a></span>
                                    </button>
                                </nav>
                                <div class="collapse" id="targetCategory${categoryNode?counter}">
                                    <ul class="list-group">
                                       <#list categoryNode.categories as subcate>
                                           <li class="list-group-item"><a href="/categories/${subcate.node.getId()}"> ${subcate.node.getTitle()}</a></li>
                                       </#list>
                                    </ul>
                                </div>
                            </div>
                        </#list>
                    </div>
                </div>


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

                    <#if isAdmin>
                        <#include "parts/productedit.ftl">
                    </#if>

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
                            <div class="row">
                                <div class="btn-group">
                                    <button class="btn btn-outline-primary" >Купить</button>
                                </div>
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
