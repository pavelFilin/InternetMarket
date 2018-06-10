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
                        <input name="name" type="text" class="form-control" name="productName"
                               placeholder="Название товара" value="${product.name}">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="parent">Категория</label>
                        <select name="category" class="form-control">
                        <#list categories as category>
                            <option <#if product.category.title==category.title>selected</#if>>${category.title}</option>
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
                    <input name="price" type="number" value="${product.price?string["0"]}" class="form-control form-control-lg"
                           id="productPrice">
                </div>
                <div class="col-md-6">
                    <label for="productPrise">Гарантия</label>
                    <input name="warrantyMonths" type="number" class="form-control form-control-lg"
                           value="${product.warrantyMonths}">
                    <small class="form-text text-muted">Если есть!</small>
                </div>
            </div>
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">Описание</span>
            </div>
            <textarea name="description" class="form-control">${product.description}</textarea>
        </div>

        <div class="row">
            <div class="offset-5 col-md-4">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" class="btn btn-primary" value="Сохранить">
            </div>
        </div>
    </form>
</div>