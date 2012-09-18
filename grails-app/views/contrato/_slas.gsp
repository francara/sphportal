
<table>
    <thead>
        <tr>
            <th><g:message code="contratoServico.catalogo.label" default="Catalogo" /></th>
            <g:sortableColumn property="descricao" title="${message(code: 'contratoServico.descricao.label', default: 'Descricao')}" />
            <th><g:message code="contratoServico.prazo.label" default="Prazo" /></th>
            <th><g:message code="contratoServico.prioridade.label" default="Prioridade" /></th>
            <g:sortableColumn property="qtMinimaLactoMinutos"
                title="${message(code: 'contratoServico.qtMinimaLactoMinutos.label', default: 'Minutos')}" />
        </tr>
    </thead>
    <tbody>
        <g:each in="${contratoServicoInstanceList}" status="i" var="contratoServicoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show" id="${contratoServicoInstance.id}">
                        ${contratoServicoInstance.catalogo.descricao}
                    </g:link></td>
                <td>${fieldValue(bean: contratoServicoInstance, field: "descricao")}</td>
                <td>${fieldValue(bean: contratoServicoInstance, field: "prazo")}</td>
                <td>${fieldValue(bean: contratoServicoInstance, field: "prioridade")}</td>
                <td>${fieldValue(bean: contratoServicoInstance, field: "qtMinimaLactoMinutos")}</td>
            </tr>
        </g:each>
    </tbody>
</table>
