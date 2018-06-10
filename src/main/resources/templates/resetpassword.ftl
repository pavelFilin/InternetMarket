<#import "parts/common.ftl" as c>

<@c.page>
<div class="container-fluid" id="content">
    <div class="card bg-light">
        <article class="card-body mx-auto" style="max-width: 600px;">
            <h4 class="card-title mt-3 text-center">Регистрация</h4>
            <form method="post" action="/resetpassword/">
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-password"></i> </span>
                    </div>
                    <input name="password" class="form-control" placeholder="Новый пароль" type="password">
                </div>
                <div class="form-group">
                    <input type="hidden" name="token" value="${token}">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-primary btn-block">Сохранить пароль</button>
                </div>
            </form>
        </article>
    </div>
</div>

<!--FOOTER-->
    <@c.footer/>
</@c.page>