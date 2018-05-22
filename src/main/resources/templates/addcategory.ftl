<#import "parts/common.ftl" as c>
<@c.page>
    <#include "parts/adminnav.ftl">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <form method="post" action="/categories/addcategory">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input name="title" type="text" class="form-control" placeholder="Название категории">
                    </div>
                    <div class="form-group">
                        <label for="parent">Select parent category</label>
                        <select name="parent" class="form-control" id="parent">
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