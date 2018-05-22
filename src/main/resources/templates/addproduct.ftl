<#import "parts/common.ftl" as c>
<#import "parts/categories.ftl" as categories>

<@c.page>
 <!--Сontent-->
        <div class="container-fluid" id="content">
            <div class="row">
                    <@categories.categories/>
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
                        <form method="post" action="/product/addproduct">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Upload</span>
                                </div>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="inputGroupFile01">
                                    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    <@c.footer/>
</@c.page>
