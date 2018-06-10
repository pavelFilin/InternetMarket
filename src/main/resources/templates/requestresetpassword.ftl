<#import "parts/common.ftl" as c>

<@c.page>
<div class="container-fluid" id="content">
    <div class="card bg-light">
        <article class="card-body mx-auto" style="max-width: 600px;">
            <h4 class="card-title mt-3 text-center">Регистрация</h4>
            <form method="post" action="/requestresetpassword">
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                    </div>
                    <input name="email" class="form-control" placeholder="Email" type="email">
                </div>
                <div class="form-group">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-primary btn-block">Восстановить пароль</button>
                </div>
            </form>
        </article>
    </div>
</div>

<!--FOOTER-->
    <@c.footer/>
</@c.page>