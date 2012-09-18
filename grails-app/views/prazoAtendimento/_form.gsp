<%@ page import="sph.domain.cliente.PrazoAtendimento" %>



<div class="fieldcontain ${hasErrors(bean: prazoAtendimentoInstance, field: 'prazoIndeterminado', 'error')} ">
	<label for="prazoIndeterminado">
		<g:message code="prazoAtendimento.prazoIndeterminado.label" default="Prazo Indeterminado" />
		
	</label>
	<g:checkBox name="prazoIndeterminado" value="${prazoAtendimentoInstance?.prazoIndeterminado}" />
</div>

<div class="fieldcontain ${hasErrors(bean: prazoAtendimentoInstance, field: 'qtMinutosAtendimento', 'error')} required">
	<label for="qtMinutosAtendimento">
		<g:message code="prazoAtendimento.qtMinutosAtendimento.label" default="Qt Minutos Atendimento" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="qtMinutosAtendimento" required="" value="${fieldValue(bean: prazoAtendimentoInstance, field: 'qtMinutosAtendimento')}"/>
</div>

