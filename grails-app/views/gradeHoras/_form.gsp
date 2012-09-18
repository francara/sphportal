<%@ page import="sph.domain.cliente.grade.GradeHoras"%>

<div class="fieldcontain ${hasErrors(bean: gradeHorasInstance, field: 'descricao', 'error')} ">
    <label for="descricao"> <g:message code="gradeHoras.descricao.label" default="Descricao" />

    </label>
    <g:textField name="descricao" value="${gradeHorasInstance?.descricao}" />
</div>


