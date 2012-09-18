<table>
    <thead>
        <tr>
            <g:sortableColumn property="nome" title="${message(code: 'contato.nome.label', default: 'Nome')}" />
            <g:sortableColumn property="apelido" title="${message(code: 'contato.apelido.label', default: 'Apelido')}" />
            <g:sortableColumn property="cpf" title="${message(code: 'contato.cpf.label', default: 'Cpf')}" />
            <g:sortableColumn property="rg" title="${message(code: 'contato.rg.label', default: 'Rg')}" />
            <g:sortableColumn property="email" title="${message(code: 'contato.email.label', default: 'Email')}" />
            <th><g:message code="contato.cliente.label" default="Cliente" /></th>
            <th width=10%></th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${contatoInstanceList}" status="i" var="contatoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${contatoInstance.id}">
                        ${fieldValue(bean: contatoInstance, field: "nome")}
                    </g:link></td>
                <td>
                    ${fieldValue(bean: contatoInstance, field: "apelido")}
                </td>
                <td>
                    ${fieldValue(bean: contatoInstance, field: "cpf")}
                </td>
                <td>
                    ${fieldValue(bean: contatoInstance, field: "rg")}
                </td>
                <td>
                    ${fieldValue(bean: contatoInstance, field: "email")}
                </td>
                <td>
                    ${fieldValue(bean: contatoInstance, field: "cliente")}
                </td>
                <td><
                  g:link action="show" id="${contatoInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-document"
                        style="float:left;" title="Detalhar" /> <g:link action="edit" id="${contatoInstance.id}"
                        class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar" /> <g:link
                        action="delete" id="${contatoInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-trash"
                        title="Remover" />
                </td>

            </tr>
        </g:each>
    </tbody>
</table>
