<%@ page import="sph.domain.cliente.ContratoServico" %>



<div class="fieldcontain ${hasErrors(bean: contratoServicoInstance, field: 'catalogo', 'error')} required">
	<label for="catalogo">
		<g:message code="contratoServico.catalogo.label" default="Catalogo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="catalogo" name="catalogo.id" from="${sph.domain.cliente.Catalogo.list()}" optionKey="id" optionValue="descricao" required="" value="${contratoServicoInstance?.catalogo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratoServicoInstance, field: 'contrato', 'error')} required">
	<label for="contrato">
		<g:message code="contratoServico.contrato.label" default="Contrato" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="contrato" name="contrato.id" from="${sph.domain.cliente.Contrato.list()}" optionKey="id" optionValue="descricao" required="" value="${contratoServicoInstance?.contrato?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratoServicoInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="contratoServico.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${contratoServicoInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratoServicoInstance, field: 'prazo', 'error')} required">
	<label for="prazo">
    Prazo (min)
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prazo" name="prazo.id" from="${sph.domain.cliente.PrazoAtendimento.list()}" optionKey="id" optionValue="qtMinutosAtendimento" required="" value="${contratoServicoInstance?.prazo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratoServicoInstance, field: 'prioridade', 'error')} required">
	<label for="prioridade">
		<g:message code="contratoServico.prioridade.label" default="Prioridade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prioridade" name="prioridade.id" from="${sph.domain.cliente.Prioridade.list()}" optionKey="id" optionValue="descricao" required="" value="${contratoServicoInstance?.prioridade?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratoServicoInstance, field: 'qtMinimaLactoMinutos', 'error')} required">
	<label for="qtMinimaLactoMinutos">
		<g:message code="contratoServico.qtMinimaLactoMinutos.label" default="Qt Minima Lacto Minutos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="qtMinimaLactoMinutos" required="" value="${fieldValue(bean: contratoServicoInstance, field: 'qtMinimaLactoMinutos')}"/>
</div>

