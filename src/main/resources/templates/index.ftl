<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
<div class="container-fluid">
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
                                        href="/categories/${categoryNode.node.getId()}">${categoryNode.node.title}</a></span>
                            </button>
                        </nav>
                        <div class="collapse" id="targetCategory${categoryNode?counter}">
                            <ul class="list-group">
                               <#list categoryNode.categories as subcate>
                                   <li class="list-group-item"><a
                                           href="/categories/${subcate.node.getId()}"> ${subcate.node.getTitle()}</a>
                                   </li>
                               </#list>
                            </ul>
                        </div>
                    </div>
                </#list>
            </div>
        </div>

        <div class="col-md-9">
           <#include "parts/search.ftl">
            <div class="row">
                <div class="col-12 mb-3">
                        <#list products as product>
                            <#if ((product?counter-1)%4)==0>
                                <div class="card-deck">
                            </#if>
                            <div class="card product-cart mb-4">
                                <img class="card-img-top" src="/img/${product.imageUrl?if_exists}"
                                     alt="${product.name}">
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
                            <#if ((product?counter-1)%4)==3||product?is_last>
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




