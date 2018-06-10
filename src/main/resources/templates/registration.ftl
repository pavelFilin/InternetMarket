<#import "parts/common.ftl" as c>

<@c.page>
<div class="container-fluid" id="content">
    <div class="card bg-light">
        <article class="card-body mx-auto" style="max-width: 600px;">
            <h4 class="card-title mt-3 text-center">Регистрация</h4>
            <form method="post" action="/registration">
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="firstName" class="form-control" placeholder="Имя" type="text">
                </div>
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="secondName" class="form-control" placeholder="Фамилия" type="text">
                </div>
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                    </div>
                    <input name="email" class="form-control" placeholder="Email" type="email">
                </div>
                <#--<div class="form-group input-group">-->
                    <#--<div class="input-group-prepend">-->
                        <#--<span class="input-group-text"> <i class="fa fa-phone"></i> </span>-->
                    <#--</div>-->
                    <#--<input name="" class="form-control" placeholder="Номер телефона" type="text">-->
                <#--</div>-->
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                    </div>
                    <input class="form-control" placeholder="Пароль" type="password" name="password">
                </div>
                <#--<div class="form-group input-group">-->
                    <#--<div class="input-group-prepend">-->
                        <#--<span class="input-group-text"> <i class="fa fa-lock"></i> </span>-->
                    <#--</div>-->
                    <#--<input class="form-control" placeholder="Повторите пароль" type="password">-->
                <#--</div>-->
                <div class="form-group">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-primary btn-block">Зарегистрироваться</button>
                </div>
                <p class="text-center">Уже есть аккаунт? <a href="/user/profile">Войти</a></p>
            </form>
        </article>
    </div>
</div>

<!--FOOTER-->
<@c.footer/>
</@c.page>