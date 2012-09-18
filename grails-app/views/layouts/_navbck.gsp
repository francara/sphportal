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
      <g:link class="nav-button" controller="${backcontroller}" action="${backaction}" id="${backid}">
          Voltar
      </g:link>
      <g:if test="${action != 'create'}" >
          <g:link class="nav-button" action="create" params="[conversation: 1, backcontroller: "${backcontroller}", backaction: "${backaction}", backid: "${backid}"]" > 
              <g:message code="default.new.label" args="[entityName]" />
          </g:link>
      </g:if>
  </div>
</div>
