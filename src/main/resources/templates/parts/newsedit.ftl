<a class="btn btn-primary mb-2" data-toggle="collapse" href="#newsform" role="button" aria-expanded="false"
   aria-controls="productform">
    Редактор новости
</a>
<div class="collapse my-2" id="newsform">
    <form method="post" action="/news/newsedit/${news.id}" enctype="multipart/form-data">
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">Фото</span>
            </div>
            <div class="custom-file">
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
                        <input name="title" maxlength="50" type="text" class="form-control" value="${news.title?if_exists}"
                               placeholder="Заголовок">
                    </div>
                </div>
            </div>
        </div>

        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">Описание</span>
            </div>
            <textarea name="text" maxlength="8000" class="form-control">${news.text?if_exists}</textarea>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-4">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" class="btn btn-primary" value="Сохранить">
            </div>
        </div>
    </form>
</div>