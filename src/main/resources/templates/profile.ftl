<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>

<@c.page>

<#if isAdmin>
    <#include "parts/adminnav.ftl">
</#if>
<!--Сontent-->
<div class="container-fluid" id="content">
    <div class="row justify-content-center">
        <div class="col-3">
            <div class="mt-3">
                <form method="post" action="/user/profile/changefirstname">
                    <div class="input-group">
                        <input name="firstName" value="${firstName}" type="text" class="form-control" placeholder="Имя" aria-describedby="basic-addon">
                        <div class="input-group-append">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type= "submit" class="btn btn-outline-primary" value="save">
                        </div>
                    </div>
                </form>
            </div>
            <div class="mt-3">
                <form method="post" action="/user/profile/changesecondname">
                    <div class="input-group">
                        <input name="secondName" value="${secondName}" type="text" class="form-control" placeholder="Имя" aria-describedby="basic-addon">
                        <div class="input-group-append">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type= "submit" class="btn btn-outline-primary" value="save">
                        </div>
                    </div>
                </form>
            </div>
            <div class="mt-3">
                <form method="post" action="/user/profile/setAddress">
                    <div class="input-group">
                        <input name="address" value="${userContacts.getAddress()?if_exists}" type="text" class="form-control" placeholder="Адрес" aria-describedby="b asic-addon">
                        <div class="input-group-append">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type= "submit" class="btn btn-outline-primary" value="save">
                        </div>
                    </div>
                </form>
            </div>
            <div class="mt-3">
                <form method="post" action="/user/profile/setcity">
                    <div class="input-group">
                        <input name="city" value="${userContacts.getCity()?if_exists}" type="text" class="form-control" placeholder="Город" aria-describedby="basic-addon">
                        <div class="input-group-append">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type= "submit" class="btn btn-outline-primary" value="save">
                        </div>
                    </div>
                </form>
            </div>
            <div class="mt-3">
                <form method="post" action="/user/profile/setcountry">
                    <div class="input-group">
                        <input name="country" value="${userContacts.getCountry()?if_exists}" type="text" class="form-control" placeholder="Страна" aria-describedby="basic-addon">
                        <div class="input-group-append">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type= "submit" class="btn btn-outline-primary" value="save">
                        </div>
                    </div>
                </form>
            </div>
            <div class="mt-3">
                <form method="post" action="/user/profile/setphone">
                    <div class="input-group">
                        <input name="phone" value="${userContacts.getPhone()?if_exists}" type="tel" class="form-control" placeholder="Телефон" aria-describedby="basic-addon">
                        <div class="input-group-append">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type= "submit" class="btn btn-outline-primary" value="save">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <#--<div class="col-md-2">-->
            <#--<h2>Пароль</h2>-->
            <#--<form>-->
                <#--<div class="form-group input-group">-->
                    <#--<input name="oldPassword" class="form-control" placeholder="старый пароль" type="password">-->
                <#--</div>-->
                <#--<div class="form-group input-group">-->
                    <#--<input name="new" class="form-control" placeholder="новый пароль" type="password">-->
                <#--</div>-->
                <#--<div class="form-group input-group">-->
                    <#--<input name="" class="form-control" placeholder="повторить пароль" type="password">-->
                <#--</div>-->
                <#--<div class="form-group">-->
                    <#--<button type="submit" class="btn btn-primary btn-block">Сменить пароль</button>-->
                <#--</div>-->
            <#--</form>-->
        <#--</div>-->
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