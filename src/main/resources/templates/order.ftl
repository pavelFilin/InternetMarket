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
                    <td>Итого</td>
                    <td>${order.getProductsPrise()} Р</td>
                </tr>
                  <#list order.getOrderedProducts() as orderedProduct>
                  <tr>
                      <td>${orderedProduct.getProduct().getId()}</td>
                      <td><a href="/product/${orderedProduct.getProduct().getId()}"
                             class="">${orderedProduct.getProduct().getName()}</a></td>
                      <td>
                          <div class="input-group">${orderedProduct.getAmount()}
                          </div>
                      </td>
                      <td>${orderedProduct.getProduct().getPrice() * orderedProduct.getAmount()}</td>
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
                <div class="row">
                    <div class="col-2 offset-2">
                        <p><strong>Номер: </strong>${order.getPhone()}</p>
                    </div>
                    <div class="col-4">
                        <p><strong>Адрес: </strong>${order.getAddress()}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <@c.footer/>
</@c.page>