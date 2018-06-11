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
                    <input name="firstName" class="form-control ${(secondNameError??)?string('is-invalid', '')}"
                           value="<#if user??>${user.firstName}</#if>" placeholder="Имя" type="text">
                    <#if firstNameError??>
                        <div class="invalid-feedback">
                            ${firstNameError}
                        </div>
                    </#if>
                </div>
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="secondName" value="<#if user??>${user.secondName}</#if>" class="form-control ${(secondNameError??)?string('is-invalid', '')}" placeholder="Фамилия" type="text">
                     <#if secondNameError??>
                        <div class="invalid-feedback">
                            ${secondNameError}
                        </div>
                     </#if>
                </div>
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                    </div>
                    <input name="email" value="<#if user??>${user.email}</#if>" class="form-control ${(emailError??)?string('is-invalid', '')}" placeholder="Email" type="email">
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                    </div>
                    <input class="form-control  ${(passwordError??)?string('is-invalid', '')}" placeholder="Пароль" type="password" name="password">
                    <#if passwordError??>
                        <div class="invalid-feedback">
                            ${passwordError}
                        </div>
                    </#if>
                    </div>
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