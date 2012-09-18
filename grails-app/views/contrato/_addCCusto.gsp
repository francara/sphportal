
<div class="grid_8 alpha">
    <tmpl:ccusto contratoCCustoInstanceList="${contratoInstance.contratoCCustos}" />
</div>
<div class="grid_4 omega">
    <label for="ccusto"> <g:message code="contrato.ccusto.label" default="Centro de Custo" />
    </label>
    <g:select name="ccusto" from="${centroDeCustoList}" optionKey="id" optionValue="codigo" style="width:150px" />
</div>
