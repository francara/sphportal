<!doctype html>
<html>
<head>
<meta name="layout" content="sph" />
<title>SphereSystems - HelpDesk</title>
</head>
<body>

    <g:if test="${session.usuario == null}">                
    <div class="grid_6 prefix_5 suffix_5" style="margin-top: 40px">
    <div class="box">
        <h2>
            <a href="#" id="toggle-login-forms">Login</a>
        </h2>
        <div class="block" id="login-forms">
            <g:if test="${session?.login?.message}">
                <div class="message" role="status">${session.login.message}</div>
            </g:if> 
          <g:render template="/login/login" />
        </div>
    </div>
    </div>
    </g:if>
</body>
</html>
