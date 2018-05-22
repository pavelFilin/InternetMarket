<#import "parts/common.ftl" as c>
<@c.page>
    <#include "parts/adminnav.ftl">
    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <div class="form-group">
                    <form method="post" action="/user">
                        <#--<input type="email" name="Email" value="${user.email}">-->
                        <span class="">${user.email}</span>
                        <#list roles as role>
                            <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
                        </#list>
                        <input type="hidden" value="${user.id}" name="userID">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input class="btn badge-primary" type="submit" value="save">
                    </form>
                </div>
            </div>
        </div>
    </div>
</@c.page>