<div id="tittulo-logged">
<g:form controller="Login">
    <span id="usuario-valor" aria-labelledby="usuario-label" style="margin-right:2em;float: right">${session.usuario.nome}</span>
    <span id="usuario-label" style="font-weight:bold;float: right">Usuário: &nbsp;</span> 
    <span style="float:right; margin-right: 2em">
        <g:actionSubmit class="logout button" action="logout" value="Logout"/>
    </span>                
</g:form>    
</div>