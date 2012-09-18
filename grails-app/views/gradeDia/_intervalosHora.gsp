
<table>
    <thead>
        <tr>
            <g:sortableColumn property="horaInicio" title="${message(code: 'intervaloHora.horaInicio.label', default: 'Hora Inicio')}" />
            <g:sortableColumn property="horaFim" title="${message(code: 'intervaloHora.horaFim.label', default: 'Hora Fim')}" />
            <g:sortableColumn property="percentualExtra"
                title="${message(code: 'intervaloHora.percentualExtra.label', default: 'Percentual Extra')}" />
            <th width=10%></th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${intervaloHoraInstanceList}" status="i" var="intervaloHoraInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>
                    ${fieldValue(bean: intervaloHoraInstance, field: "horaInicio")}
                </td>
                <td>
                    ${fieldValue(bean: intervaloHoraInstance, field: "horaFim")}
                </td>
                <td>
                    ${fieldValue(bean: intervaloHoraInstance, field: "percentualExtra")}
                </td>
                <td>
                    <g:if test="${conversation}">
                        <g:link action="show" controller="intervaloHora" id="${intervaloHoraInstance.id}"
                            params="[conversation: 1, backcontroller: "${backcontroller}", backaction: "${backaction}", backid: "${backid}"]" 
                            class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar" /> 
                        <g:link action="edit" controller="intervaloHora" id="${intervaloHoraInstance.id}" 
                            params="[conversation: 1, backcontroller: "${backcontroller}", backaction: "${backaction}", backid: "${backid}"]" 
                            class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar" />
                    </g:if>
                    <g:else>
                        <g:link action="show" controller="intervaloHora" id="${intervaloHoraInstance.id}"
                            class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar" /> 
                        <g:link action="edit" controller="intervaloHora" id="${intervaloHoraInstance.id}" 
                            class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar" />
                    </g:else> 
                    <g:link action="delete" controller="diaSemanaIntervalo" id="${intervaloHoraInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover" onclick="return confirm('Tem certeza?');" /></td>
            </tr>
        </g:each>
    </tbody>
</table>
