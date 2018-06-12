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
                    <#include "parts/search.ftl">

                    <#if isAdmin>
                        <#include "parts/productedit.ftl">
                    </#if>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="">
                                <img src="/img/${product.imageUrl?if_exists}" class="img-fluid">
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
                                <a href="javascript:void(0);" onclick="ajaxAddToCart(${product.getId()});"
                                   class="btn btn-primary">Купить</a>
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
