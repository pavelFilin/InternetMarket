<#include "security.ftl">
<#import "login.ftl" as login>
    <div class="container-fluid sticky-top navbar-dark bg-dark" id="navigator">
        <nav class="navbar navbar-expand-md navbar ">
            <a href="/" class="navbar-brand">Fish market</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Магазины</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/news">Новости</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Контакты</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#"></a>
                    </li>
                </ul>
            </div>
            <#if !known>
                <span class="nav-text text-light">Hi, guest</span>
                <div class="ml-1"><span><a class="" href="/user/profile">Войти</a> <a class="" href="/registration">Регистация</a></span>
                </div>
            <#else>
                <div><a class="nav-link text-light" href="/user/profile">${email}</a></div>
                <a class="btn btn-danger" href="/cart" id = "cart-button">Корзина</a>
                <@login.logout/>
            </#if>
        </nav>
    </div>
