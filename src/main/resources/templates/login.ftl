<#import "parts/common.ftl" as c>
<@c.page>
        <div class="container-fluid" id="content">
            <div class="card bg-light mx-auto" style="max-width: 400px; min-height: 400px">
                <article class="card-body mx-auto">
                    <h5>${message?if_exists}</h5>
                    <h4 class="card-title mt-3 text-center">Войти</h4>
                    <form method="post" action="/login">
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                            </div>
                            <input maxlength="50" name="username" class="form-control" placeholder="Email" type="text">
                        </div>
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                            </div>
                            <input maxlength="50" class="form-control" placeholder="Пароль" type="password" name="password">
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-primary btn-block">Войти</button>
                        </div>
                        <p class="text-center">Нет аккаунта? <a href="/registration">Регистрация</a></p>
                        <p class="text-center">Забыли пароль? <a href="/requestresetpassword">Востановить</a></p>
                    </form>
                </article>
            </div>
        </div>
    <@c.footer/>
</@c.page>



