<#assign
    known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        email = user.getUsername()
        isAdmin = user.isAdmin()
    />
<#else>
    <#assign
        email = "unknown"
        isAdmin = false
    >
</#if>