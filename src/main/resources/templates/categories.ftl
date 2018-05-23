<#import "parts/common.ftl" as c>
<@c.page>
    <#include "parts/adminnav.ftl">
    <div class="container">
        <div class="row">
            <h3><a class="page-link" href="/categories/addcategory">добавить категорию</a></h3>
        </div>
        <div class="row">
            <div class="col-md-10">
                <table class="table table-light">
                    <thead class="table-dark">
                    <tr>
                        <th>id</th>
                        <th>title</th>
                        <th>parent</th>
                    </tr>
                    </thead>
                    <tbody class="table-bordered">
                <#list categories as category>
                <tr>
                    <td>${category.id}</td>
                    <td>${category.title}</td>
                        <#if category.parent??>
                            <td>${category.parent.title?if_exists}</td>
                        <#else >
                        <td>-</td>
                        </#if>
                        <td>
                            <a href="/categories/${category.id}"><input type="submit" value="delete" class="btn btn-outline-primary"></a>
                        </td>
                </tr>
                </#list>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 justify-content-center">
                <form method="post" action="/categories/addcategory">
                    <div class="form-group">
                        <label for="categoryName">Название</label>
                        <input name="title" type="text" class="form-control" id="categoryName" placeholder="Название категории">
                    </div>
                    <div class="form-group">
                        <label for="parent">Select parent category</label>
                        <select name="parent" class="form-control">
                            <option>NONE</option>
                             <#list categories as category>
                                 <option>${category.title}</option>
                             </#list>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-outline-primary">
                    </div>
                </form>
            </div>
        </div>
    </div>
</@c.page>