<#import "parts/common.ftl" as c>
<#import "parts/categories.ftl" as categoriesSpace>
<#include "parts/security.ftl">
<@c.page>
 <!--Сontent-->
    <#if isAdmin>
        <#include "parts/adminnav.ftl">
    </#if>
        <div class="container-fluid my-2" id="content">
            <div class="row">
                <div class="col-md-6 bg-light text-dark offset-3">
                    <div class="row">
                        <div class="col-12 mb-4">
                            <form method="post" action="/product/addproduct" enctype="multipart/form-data">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Фото</span>
                                    </div>
                                    <div class="custom-file ">
                                        <input name="file" type="file" class="" id="inputGroupFile01">
                                        <label class="custom-file-label" for="inputGroupFile01">Выберите файл</label>
                                    </div>
                                </div>
                                <div class="form-group mb-3 form-inline">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="input-group mr-2">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Назвавние</span>
                                                </div>
                                                <input name="name" type="text"
                                                       value="<#if product??>${product.name}</#if>"
                                                       class="form-control ${(nameError??)?string('is-invalid', '')}"
                                                       name="productName"
                                                       placeholder="Название товара">
                                                <#if nameError??>
                                                    <div class="invalid-feedback">
                                                        ${nameError}
                                                    </div>
                                                </#if>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="parent">Категория</label>
                                                <select name="categoryTemp" class="form-control">
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
                                            <input name="price" type="number"
                                                   value="<#if product??>${(product.price?if_exists)}</#if>"
                                                   class="${(priceError??)?string('is-invalid', '')} form-control form-control-lg"
                                                   id="productPrice"
                                                   placeholder="">
                                            <#if priceError??>
                                            <div class="invalid-feedback">
                                                ${priceError}
                                            </div>
                                            </#if>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="productPrise">Гарантия</label>
                                            <input name="warrantyMonths" type="number"
                                                   class="form-control form-control-lg"
                                                   placeholder="">
                                            <small class="form-text text-muted">Если есть!</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Описание</span>
                                    </div>
                                    <textarea name="description"
                                              class="form-control ${(descriptionError??)?string('is-invalid', '')}"><#if product??>${(product.description?if_exists)}</#if></textarea>
                                     <#if descriptionError??>
                                            <div class="invalid-feedback">
                                                ${descriptionError}
                                            </div>
                                     </#if>
                                </div>


                                <div class="row">
                                    <div class="offset-5 col-md-4">
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
