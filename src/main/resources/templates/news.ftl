<#import "parts/common.ftl" as c>

<@c.page>
    <div class="col-12 mb-3">
    <#list news as n>
        <#--<#if ((n?counter-1)%4)==0>-->
        <div class="card-columns">
        <#--</#if>-->
        <div class="card mb-4">
            <img class="card-img-top" src="/img/${n.imageUrl}" alt="${n.title}">
            <div class="card-body">
                <a href="/news/${n.id}"><h5 class="card-title">${n.title}</h5></a>
                <p class="card-text">${n.text}</p>
            </div>
            <div class="card-footer">
                <h4 class="text-info">${n.dateCreated} Р</h4>
            </div>
        </div>
        <#--<#if ((n?counter-1)%4)==3||n?is_last>-->
        </div>
        <#--</#if>-->
    </#list>
    </div>
</@c.page>
