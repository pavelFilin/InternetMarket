<#import "parts/common.ftl" as c>

<@c.page>
    <div class="col-12 mb-3">

    <#--<#if ((n?counter-1)%4)==0>-->
        <div class="card-columns">
             <#list news as n>
                 <div class="card mb-4">
                     <img class="card-img-top" src="/img/${n.imageUrl?if_exists}" alt="${n.title}">
                     <div class="card-body">
                         <a href="/news/${n.id}"><h5 class="card-title">${n.title}</h5></a>
                         <p class="card-text">${n.text}</p>
                     </div>
                     <div class="card-footer">
                         <h4 class="text-info">${n.dateCreated}</h4>
                     </div>
                 </div>
             </#list>
        </div>
    </div>
</@c.page>
