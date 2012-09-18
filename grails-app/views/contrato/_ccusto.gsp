<table>
    <thead>
        <tr><g:sortableColumn property="codigo" title="${message(code: 'centroDeCusto.codigo.label', default: 'Codigo')}" /></tr>
    </thead>
    <tbody>
        <g:each in="${contratoCCustoInstanceList}" status="i" var="contratoCCustoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show" id="${contratoCCustoInstance.ccusto.id}">
                        ${contratoCCustoInstance?.ccusto.codigo}
                    </g:link></td>
            </tr>
        </g:each>
    </tbody>
</table>
