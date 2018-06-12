<#import "parts/common.ftl" as c>
<@c.page>
<!--Сontent-->
<div class="container-fluid mb-3" id="content">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <table class="table table-light table-striped  table-hover mx-auto cart " style="max-width: 1000px">
                <tbody class="">
                    <#if !(cart.getTotalItems()<1)>
                <tr>
                    <td></td>
                        <td></td>
                        <td>Итого</td>
                        <td>${cart.getTotalPrise()}</td>
                        <td>
                            <a href="/order/makeorder" class="btn btn-primary mx-auto d-block">Оформить заказ</a>
                        </td>
                    </#if>
                </tr>
                  <#list cart.getCartItems() as cartItem>
                  <tr>
                      <td><img src="/img/${cartItem.getProduct().getImageUrl()?if_exists}" alt="" class="img-thumbnail"
                               style="width: 200px"></td>
                      <td><a href="/product/${cartItem.getProduct().getId()}"
                             class="">${cartItem.getProduct().getName()}</a></td>
                      <td>
                          <div class="input-group">
                              <input class="form-control-sm" value="${cartItem.getAmount()}" type="number"
                                     onchange="changeProductAmount(this, ${cartItem.getProduct().getId()})">
                          </div>
                      </td>
                      <td>${cartItem.getProduct().getPrice() * cartItem.getAmount()}</td>
                      <td>
                          <a class="btn btn-danger" href="javascript:void(0);"
                             onclick="ajaxDeleteCartItem(${cartItem.getProduct().getId()})">удалить</a>
                      </td>
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
        </div>
    </div>
</div>

    <@c.footer/>
</@c.page>