<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>

<@c.page>

    <#if isAdmin>
        <#include "parts/adminnav.ftl">
    </#if>
<!--Сontent-->
<div class="container-fluid" id="content">
    <div class="row justify-content-center">
        <div class="col-12 col-md-6 col-xl-3">
            <div class="mt-3">
                <form method="post" action="/user/profile/changefirstname">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-firstName">Имя</span>
                        </div>
                        <input maxlength="50" minlength="1" name="firstName" value="${firstName}" type="text"
                               class="form-control" placeholder="Имя"
                               aria-describedby="basic-addon-firstName">
                        <div class="input-group-append">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type="submit" class="btn btn-outline-primary" value="save">
                        </div>
                    </div>
                </form>
            </div>
            <div class="mt-3">
                <form method="post" action="/user/profile/changesecondname">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-secondName">Фамилия</span>
                        </div>
                        <input maxlength="50" name="secondName" value="${secondName}" type="text" class="form-control"
                               placeholder="Имя" aria-describedby="basic-addon-secondName">
                        <div class="input-group-append">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type="submit" class="btn btn-outline-primary" value="save">
                        </div>
                    </div>
                </form>
            </div>
            <div class="mt-3">
                <form method="post" action="/user/profile/setAddress">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-address">Адрес</span>
                        </div>
                        <input maxlength="50" name="address" value="${userContacts.getAddress()?if_exists}" type="text"
                               class="form-control" placeholder="Адрес" aria-describedby="b asic-addon-address">
                        <div class="input-group-append">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type="submit" class="btn btn-outline-primary" value="save">
                        </div>
                    </div>
                </form>
            </div>
            <div class="mt-3">
                <form method="post" action="/user/profile/setcity">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-city">Город</span>
                        </div>
                        <input maxlength="50" name="city" value="${userContacts.getCity()?if_exists}" type="text"
                               class="form-control"
                               placeholder="Город" aria-describedby="basic-addon-city">
                        <div class="input-group-append">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type="submit" class="btn btn-outline-primary" value="save">
                        </div>
                    </div>
                </form>
            </div>
            <div class="mt-3">
                <form method="post" action="/user/profile/setcountry-country">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-country">Страна</span>
                        </div>
                        <input maxlength="50" name="country" value="${userContacts.getCountry()?if_exists}" type="text"
                               class="form-control" placeholder="Страна" aria-describedby="basic-addon-country">
                        <div class="input-group-append">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type="submit" class="btn btn-outline-primary" value="save">
                        </div>
                    </div>
                </form>
            </div>
            <div class="mt-3">
                <form method="post" action="/user/profile/setphone">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-phone">Телефон</span>
                        </div>
                        <input maxlength="11" name="phone" value="${userContacts.getPhone()?if_exists}" type="tel"
                               class="form-control"
                               placeholder="Телефон" aria-describedby="basic-addon-phone">
                        <div class="input-group-append">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type="submit" class="btn btn-outline-primary" value="save">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-12">
            <table class="table table-info table-striped  table-hover mx-auto" style="max-width: 800px">
                <thead class="table-dark">
                <tr>
                    <th>№</th>
                    <th>id</th>
                    <th>email</th>
                    <th>Адрес доставки</th>
                    <th>Цена</th>
                    <th>Статус</th>
                    <th>Продукты</th>
                </tr>
                </thead>
                <tbody class="">
                    <#list orders as order>
                    <tr>
                        <td>${order?counter}</td>
                    <td>
                            <#if isAdmin>
                                <a href="/order/${order.getId()}">${order.getId()}</a>
                            <#else >
                                ${order.getId()}</td>
                            </#if>
                        </td>
                        <td>${order.getUser().getEmail()}</td>
                        <td>${order.getAddress()}</td>
                        <td>${order.getProductsPrise()}</td>
                        <td>
                             <#if isAdmin>
                                 <select name="executionStage" class="form-control"
                                         onchange="changeExecutionStage(this, ${order.getId()})">
                                      <#list executionStages as executionStage>
                                          <option

                                          <#if executionStage==order.getExecutionStage()>
                                             selected="selected"
                                          </#if>
                                          >
                                              ${executionStage}
                                          </option>
                                      </#list>
                                 </select>
                             <#else>
                                 <a href="/order/${order.getId()}">${order.getExecutionStage()}</a>
                             </#if>
                        </td>
                        <td>
                            <#list order.getOrderedProducts() as orderedProduct>
                                <a class="alert-danger"
                                   href="/product/${orderedProduct.getProduct().getId()}">${orderedProduct.getProduct().getName()}</a> ${orderedProduct.getAmount()} <#sep>
                                ,
                            </#list>
                        </td>
                    </tr>
                    </#list>
                </tbody>
            </table>
        </div>
    </div>
</div>
    <@c.footer/>
</@c.page>