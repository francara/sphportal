
<%@ page import="sph.domain.acesso.Usuario"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <%--
    =============================
    ===  Barra de Navegacao   ===
    =============================
    --%>
    <sphlay:nav action="list" />
    
    <!--
    ================================
    =========   Usuarios   ========= 
    ================================
     -->
    <div class="grid_14 prefix_1 suffix_1">
    <div id="list-usuario" class="content scaffold-list" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>
        
        <table class="domain-list">
            <thead>
                <tr>
                    <g:sortableColumn property="nome" title="${message(code: 'usuario.nome.label', default: 'Nome')}" />
                    <g:sortableColumn property="password" title="${message(code: 'usuario.password.label', default: 'Password')}" />
                    <g:sortableColumn property="admin" title="Admin" />
                </tr>
            </thead>
            <tbody>
                <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><g:link action="show" id="${usuarioInstance.id}">
                                ${fieldValue(bean: usuarioInstance, field: "nome")}
                            </g:link></td>
                        <td> ${fieldValue(bean: usuarioInstance, field: "password")}</td>
                        <td>${fieldValue(bean: usuarioInstance, field: "admin")}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        
        <div class="pagination">
            <g:paginate total="${usuarioInstanceTotal}" />
        </div>
    </div></div> <!-- grid_14 prefix_1 suffix_1 -->
</body>
</html>