<#import "parts/common.ftl" as c>
<@c.page>
    <#include "parts/security.ftl">
    <#include "parts/adminnav.ftl">
    <div class="container">
        <div class="row">
            <div class="col-md-8 justify-content-center">
                <table class="table table-light text-dark ">
                    <thead>
                    <tr>
                        <th>Email</th>
                        <th>First Name</th>
                        <th>Second Name</th>
                        <th>Role</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list users as user>
                        <tr>
                            <td><a href="/user/${user.id}">${user.email}</a></td>
                            <td>${user.firstName?html}</td>
                            <td>${user.secondName?html}</td>
                            <td><#list user.roles as role>${role}<#sep>, </#list></td>
                        </tr>
                    </#list>
                    </tbody>

                </table>

            </div>
        </div>
    </div>
</@c.page>