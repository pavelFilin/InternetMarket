<a class="btn btn-primary mb-2" data-toggle="collapse" href="#productform" role="button" aria-expanded="false"
   aria-controls="productform">
    Редактор товара
</a>
<div class="collapse my-2" id="productform">
    <form method="post" action="/product/editproduct/${product.id}" enctype="multipart/form-data">
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
                        <input name="name" type="text" class="form-control ${(nameError??)?string('is-invalid', '')}"
                               name="productName"
                               placeholder="Название товара" value="${product.name}">
                        <#if nameError??>
                            <div class="invalid-feedback">
                                ${nameError}
                            </div>
                        </#if>
                        <input name="available" <#if product.available>checked</#if> class="form-check-input ml-2"
                               type="checkbox" id="autoSizingCheck2">
                        <label class="form-check-label" for="autoSizingCheck2">
                            Доступно
                        </label>
                    </div>
                </div>

                <div class="col-md-5">
                    <div class="form-group">
                        <label for="parent">Категория</label>
                        <select name="categoryTemp" class="form-control">
                        <#list categories as category>
                            <option
                                <#if product.category.title==category.title>selected</#if>>${category.title}</option>
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
                    <input name="price" max="9999999" min="0" type="number" value="${product.price?string["0"]}"
                           class="${(priceError??)?string('is-invalid', '')} form-control form-control-lg"
                           id="productPrice">
                     <#if priceError??>
                         <div class="invalid-feedback">
                             ${priceError}
                         </div>
                     </#if>
                </div>
                <div class="col-md-6">
                    <label for="productPrise">Гарантия</label>
                    <input max="999" min="0" name="warrantyMonths" type="number" class="form-control form-control-lg"
                           value="${product.warrantyMonths?if_exists}">
                    <small class="form-text text-muted">Если есть!</small>
                </div>
            </div>
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">Описание</span>
            </div>
            <textarea maxlength="8000" name="description" class="form-control ${(Error??)?string('is-invalid', '')}">${product.description}</textarea>
            <#if descriptionError??>
             <div class="invalid-feedback">
                 ${descriptionError}
             </div>
            </#if>
        </div>

        <div class="row">
            <div class="offset-5 col-md-4">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" class="btn btn-primary" value="Сохранить">
            </div>
        </div>
    </form>
</div>