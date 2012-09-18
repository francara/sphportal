<table>
    <thead>
        <tr>
            <th>Descrição Dia</th>
            <th>Inicio</th>
            <th>Fim</th>
            <th>Util</th>
            <th>Percentual</th>
            <th width=10%></th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${gradeHorasItemList}" status="i" var="item">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td> 
                  <g:link action="show" id="${item.id}">
                      ${fieldValue(bean: item, field: "descricao")}
                  </g:link>
                </td>
                <td>
                    ${fieldValue(bean: item, field: "horaInicio")}
                </td>
                <td>
                    ${fieldValue(bean: item, field: "horaFim")}
                </td>
                <td>
                    ${fieldValue(bean: item, field: "diaUtil")}
                </td>
                <td>
                    ${fieldValue(bean: item, field: "percentualExtra")}
                </td>                                
                <td>
                    <g:link controller="gradeDia" action="show" id="${item.id}"
                        params="[conversation: 1, backcontroller: 'gradeHoras', backaction: 'edit', backid: "${gradeHorasInstance.id}"]" 
                        class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar" /> 
                    <g:link controller="gradeDia" action="edit" id="${item.id}"
                        params="[conversation: 1, backcontroller: 'gradeHoras', backaction: 'edit', backid: "${gradeHorasInstance.id}"]" 
                        class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar" /> 
                    <g:link controller="gradeDia" action="delete" id="${item.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover" onclick="return confirm('Tem certeza?');" />
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
