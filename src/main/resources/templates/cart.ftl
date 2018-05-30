<#import "parts/common.ftl" as c>
<@c.page>
<!--Сontent-->
<div class="container-fluid mb-3" id="content">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <table class="table table-light table-striped  table-hover mx-auto cart " style="max-width: 1000px">
                <tbody class="">
                <tr>
                    <td><img src="../img/image.jpg" alt="..." class="img-thumbnail" style="width: 200px"></td>
                    <td><a href="#" class="">название 1</a></td>
                    <td>1</td>
                    <td>12345</td>
                    <td><button class="btn btn-danger">delete</button></td>
                </tr>
                <tr>
                    <td><img src="../img/image.jpg" alt="..." class="img-thumbnail" style="width: 200px"></td>
                    <td><a href="#" class="">название 1</a></td>
                    <td>1</td>
                    <td>3123 </td>
                    <td><button class="btn btn-danger">delete</button></td>
                </tr>
                <tr>
                    <td><img src="../img/image.jpg" alt="..." class="img-thumbnail" style="width: 200px"></td>
                    <td><a href="#" class="">название 1</a></td>
                    <td>4</td>
                    <td>52345</td>
                    <td><button class="btn btn-danger">delete</button></td>
                </tr>
                <tr>
                    <td><img src="../img/image.jpg" alt="..." class="img-thumbnail" style="width: 200px"></td>
                    <td><a href="#" class="">название 1</a></td>
                    <td>2</td>
                    <td>24700</td>
                    <td><button class="btn btn-danger">delete</button></td>
                </tr>
                </tbody>
            </table>
            <button class="btn btn-primary mx-auto d-block " style="width: 200px">Купить</button>
        </div>
    </div>
</div>

<@c.footer/>
</@c.page>