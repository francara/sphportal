<%--
------------------------------------------
---------   Barra de navegação   ---------
------------------------------------------
-- Parametros: model: [action]
-- Renderizada a partir de tag lib.
--
--%>
<div class="clear"></div>
<div class="grid_16">
    <h2 id="page-heading">
        <g:message code="default.${action}.label" args="[entityName]" />
    </h2>
</div>

<div class="clear"></div>
<div class="grid_16">
  <div class="nav-buttongroup">
      <a class="nav-button" href="${createLink(uri: '/')}"> <g:message code="default.home.label" /></a>
      <g:if test="${action != 'list'}" >
          <g:link class="nav-button" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
      </g:if>
      <g:if test="${action != 'create'}" >
          <g:link class="nav-button" action="create"> <g:message code="default.new.label" args="[entityName]" />
          </g:link>
      </g:if>
  </div>
</div>
