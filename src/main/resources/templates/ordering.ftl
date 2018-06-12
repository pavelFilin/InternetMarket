<#import "parts/common.ftl" as c>
<@c.page>
<!--Сontent-->
<div class="container-fluid mb-3" id="content">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <table class="table table-light table-striped  table-hover mx-auto cart " style="max-width: 1000px">
                <tbody class="">
                <tr>
                    <td></td>
                    <td></td>
                    <td>Итого:</td>
                    <td>${cart.getTotalPrise()} Р</td>
                </tr>
                  <#list cart.getCartItems() as cartItem>
                  <tr>
                      <td>${cartItem.getProduct().getId()}</td>
                      <td><a href="/product/${cartItem.getProduct().getId()}"
                             class="">${cartItem.getProduct().getName()}</a></td>
                      <td>
                          <div class="input-group">${cartItem.getAmount()}
                          </div>
                      </td>
                      <td>${cartItem.getProduct().getPrice() * cartItem.getAmount()}</td>
                  </tr>
                  <#else>
                  <div class="container my-4">
                      <div class="alert alert-info" role="alert">
                          В вашей корзине пока <strong>нет товаров</strong>!
                      </div>
                  </div>
                  </#list>
                </tbody>

            </table>
            <div class="mt-3">
                <form method="post" action="/order/makeorder">
                    <div class="input-group">
                        <input type="hidden" name = "cart" value="${cart.id}">
                        <input maxlength="50" name="phone" value="${userContacts.getPhone()?if_exists}" type="tel" class="form-control" placeholder="Телефон">
                        <input maxlength="50" name="address" value="${userContacts.getAddress()?if_exists}" type="text" class="form-control" placeholder="Адрес">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type= "submit" class="btn btn-outline-primary" value="Купить">
                    </div>
                </form>
                <#if error??><h1 class="alert-danger">${error}</h1></#if>
            </div>
        </div>
    </div>
</div>

    <@c.footer/>
</@c.page>