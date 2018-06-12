<#import "parts/common.ftl" as c>
<#import "parts/categories.ftl" as categoriesSpace>
<#include "parts/security.ftl">
<@c.page>
 <!--Сontent-->
    <#include "parts/adminnav.ftl">
        <div class="container-fluid" id="content">
            <div class="row">
                <div class="col-md-6 bg-light text-dark offset-3">
                    <div class="row">
                        <div class="col-12 mb-4">
                            <form method="post" action="/news/addnews" enctype="multipart/form-data">
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
                                                    <span class="input-group-text">Заголовок</span>
                                                </div>
                                                <input maxlength="50" name="title" type="text"

                                                       class="form-control ${(titleError??)?string('is-invalid', '')}"
                                                       name="productName"
                                                       placeholder="Заголовок">
                                                 <#if titleError??>
                                                    <div class="invalid-feedback">
                                                        ${titleError}
                                                    </div>
                                                 </#if>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Описание</span>
                                    </div>
                                    <textarea maxlength="8000" name="text" class="form-control ${(textError??)?string('is-invalid', '')}"></textarea>
                                    <#if textError??>
                                      <div class="invalid-feedback">
                                          ${textError}
                                      </div>
                                    </#if>
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
