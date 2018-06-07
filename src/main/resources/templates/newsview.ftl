<#import "parts/common.ftl" as c>

<@c.page>
 <!--Сontent-->
        <div class="container-fluid" id="content">

            <div class="row">
                <div class="col-md-6">
                    <div class="">
                        <img src="/img/${news.imageUrl}" class="img-fluid">
                    </div>
                </div>
                <div class="col-md-6 ">
                    <div class="row">
                        <div class="col"><h3>${news.title}</h3></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col"><h5>Описание товара</h5>
                        <p>${news.text}</p></div>
                </div>
            </div>
        </div>

    <@c.footer/>
</@c.page>
