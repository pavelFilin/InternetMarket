<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">


<@c.page>
 <!--Сontent-->
        <div class="container-fluid" id="content">
            <div class="my-2">
                <#if isAdmin>
                    <#include "parts/newsedit.ftl">
                </#if>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="">
                        <img src="/img/${news.imageUrl?if_exists}" class="img-fluid">
                    </div>
                </div>
                <div class="col-md-6 ">
                    <div class="row">
                        <div class="col"><h3>${news.title}</h3></div>
                    </div>
                </div>
                <div class="row m-2">
                    <div class="col">
                        <p>${news.text}</p></div>
                </div>
            </div>
        </div>

    <@c.footer/>
</@c.page>
