<#import "parts/common.ftl" as c>

<@c.page>
<@c.nav/>
<!--Сontent-->
<div class="container-fluid" id="content">
    <div class="row justify-content-center">
        <div class="col-md-2">
            <h2>Имя</h2>
            <form>
                <div class="form-group input-group">
                    <input name="" class="form-control" placeholder="Имя" type="text">
                </div>
                <div class="form-group input-group">
                    <input class="form-control" placeholder="Фамилия" type="text">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Изменить</button>
                </div>
            </form>
        </div>
        <div class="col-md-2">
            <h2>Пароль</h2>
            <form>
                <div class="form-group input-group">
                    <input name="" class="form-control" placeholder="старый пароль" type="password">
                </div>
                <div class="form-group input-group">
                    <input name="" class="form-control" placeholder="новый пароль" type="password">
                </div>
                <div class="form-group input-group">
                    <input name="" class="form-control" placeholder="повторить пароль" type="password">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Сменить пароль</button>
                </div>
            </form>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-12">
            <table class="table table-info table-striped  table-hover mx-auto" style="max-width: 800px">
                <thead class="table-dark">
                <tr>
                    <th>№</th>
                    <th>Статус</th>
                    <th>Адрес доставки</th>
                    <th>Название товара</th>
                    <th>Количество</th>
                    <th>Цена</th>
                </tr>
                </thead>
                <tbody class="">
                <tr>
                    <td>1</td>
                    <td>Испонено</td>
                    <td>г. Саратов</td>
                    <td><a href="#" class="">название 1</a></td>
                    <td>1</td>
                    <td>12345</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Испонено</td>
                    <td>г. Саратов</td>
                    <td><a href="#" class="">название 1</a></td>
                    <td>1</td>
                    <td>12345</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Испонено</td>
                    <td>г. Саратов</td>
                    <td><a href="#" class="">название 1</a></td>
                    <td>1</td>
                    <td>12345</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>Испонено</td>
                    <td>г. Саратов</td>
                    <td><a href="#" class="">название 1</a></td>
                    <td>1</td>
                    <td>12345</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<@c.footer/>
</@c.page>