<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input class="btn badge-primary btn-sm ml-1" type="submit" value="Sign Out"/>
    </form>
</#macro>