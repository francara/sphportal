
<g:form controller="Login">
    <fieldset class="login">
        <legend>Login</legend>
        <p class="notice">Entre com seu usuário e senha.</p>
        <p>
            <label>Usuário: </label> <input type="text" name="username" />
        </p>
        <p>
            <label>Senha: </label> <input type="password" name="password" />
        </p>
        <g:actionSubmit class="login button" action="login" value="Login" />
    </fieldset>
</g:form>
<form action="">
    <fieldset>
        <legend>Registrar</legend>
        <p>Se você não tem uma conta ou esqueceu sua senha, por favor preencha o formulário de registro/reenvio de senha.</p>
        <input type="submit" value="Criar Conta" /> <input type="submit" value="Reenvio de usuário/senha" />
    </fieldset>
</form>