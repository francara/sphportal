<table>
    <thead>
        <tr>
            <th><g:message code="contrato.cliente.label" default="Cliente" /></th>
            <g:sortableColumn property="descricao" title="${message(code: 'contrato.descricao.label', default: 'Descricao')}" />
            <g:sortableColumn property="qtHoras" title="${message(code: 'contratoVigencia.qtHoras.label', default:"Horas")}" />
            <g:sortableColumn property="dataInicio" title="${message(code: 'contratoVigencia.dataInicio.label', default: 'Inicio')}" />
            <g:sortableColumn property="dataInicio" title="${message(code: 'contratoVigencia.dataTermino.label', default: 'Termino')}" />
        </tr>
    </thead>
    <tbody>
        <g:each in="${contratoVigenciaInstanceList}" status="i" var="contratoVigenciaInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td width=30%><g:link action="show" id="${contratoInstance.id}">
                        ${contratoVigenciaInstance.contrato.cliente.nomeFantasia}
                    </g:link></td>
                <td width=25%>${contratoVigenciaInstance.contrato.descricao}</td>
                <td width=5%>
                    ${contratoVigenciaInstance.qtHoras}
                </td>
                <td width=20%>${contratoVigenciaInstance.dataInicio?.format('dd/MM/yyyy')}</td>
                <td width=20%>${contratoVigenciaInstance.dataTermino?.format('dd/MM/yyyy')}"</td>
            </tr>
        </g:each>
    </tbody>
  </table>