<%@ page import="sph.domain.acesso.PermissaoEnum"%>

<ul class="nav main">
    <li><a>Administrativo</a>
        <g:if test="${session.usuario}">
        <ul>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.ADMINISTRATIVO_GRUPO)}">
                <li><g:link controller="grupoAcesso" action="list">Grupos e Acesso</g:link></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.ADMINISTRATIVO_USUARIO)}">            
                <li><g:link controller="usuario" action="list">Usuários</g:link></li>
            </g:if>
        </ul>
        </g:if>
    </li>
    <li><a>Cadastros Básicos</a>
        <g:if test="${session.usuario}">    
        <ul>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CAD_BASICO_FERIADO)}">        
                <li><g:link controller="feriado" action="list">Feriado</g:link></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CAD_BASICO_CEP)}">            
                <li><g:link controller="cep" action="list">CEP</g:link></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CAD_BASICO_UF)}">        
                <li><g:link controller="uf" action="list">UF</g:link></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CAD_BASICO_CIDADE)}">        
                <li><g:link controller="cidade" action="list">Cidade</g:link></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CAD_BASICO_SERVICOS)}">        
                <li><g:link controller="catalogo" action="list">Serviços</g:link></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CAD_BASICO_PRIORIDADE)}">        
                <li><g:link controller="prioridade" action="list">Prioridade</g:link></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CAD_BASICO_PRAZO_AT)}">        
                <li><g:link controller="prazoAtendimento" action="list">Prazo de Atendimento</g:link></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CAD_BASICO_GRADE)}">        
                <li><g:link controller="gradeHoras" action="list">Grade de Horas</g:link></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CAD_BASICO_GRADE)}">        
                <li><g:link controller="gradeDia" action="list">Grade Dia</g:link></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CAD_BASICO_GRADE)}">        
                <li><g:link controller="intervaloHora" action="list">Intervalo de Horas</g:link></li>
            </g:if>

        </ul>
        </g:if>        
    </li>
    <li><a>Cliente</a>
        <g:if test="${session.usuario}">    
        <ul>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CLIENTE_CADASTRO_CLIENTE)}">        
            <li><g:link controller="cliente" action="list">Cadastro de Clientes</g:link></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CLIENTE_CADASTRO_CONTATO)}">        
            <li><g:link controller="contato" action="list">Contatos de Clientes</g:link></li>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CLIENTE_CONTRATOS)}">        
            <li><g:link controller="contrato" action="list">Contratos</g:link></li>
            <li><g:link controller="contratoVigencia" action="list">Vigências de Contratos</g:link></li>
            </g:if>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CLIENTE_SLA)}">        
            <li><g:link controller="contratoServico">SLAs de Contratos</g:link></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CLIENTE_CCUSTO)}">        
            <li><g:link controller="centroDeCusto" action="list">Centro de Custo</g:link></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CLIENTE_CHAMADO)}">        
            <li><g:link controller="chamado" action="list">Chamados</g:link></li>
            </g:if>
        </ul>
        </g:if>        
    </li>
    <li><a>Consultor</a>
        <g:if test="${session.usuario}">    
        <ul>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CONSULTOR_CAD_CONSULTOR)}">        
            <li><a href="../../../12/fixed/mootools/">Cadastro</a></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CONSULTOR_TAREFAS)}">        
            <li><a href="../../../12/fixed/jquery/">Tarefas</a></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.CONSULTOR_ATENDIMENTO)}">        
            <li><a href="../../../12/fixed/none/">Atendimento</a></li>
            </g:if>
        </ul>
        </g:if>        
    </li>
    <li><a>Risco</a>
        <g:if test="${session.usuario}">    
        <ul>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.RISCO_SERVIDORES)}">        
            <li><a href="../../../12/fixed/mootools/">Servidores</a></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.RISCO_CHECKLIST)}">        
            <li><a href="../../../12/fixed/mootools/">Cadastro de Checklist</a></li>
            </g:if>
        </ul>
        </g:if>        
    </li>        
    <li><a>Relatórios</a>
        <g:if test="${session.usuario}">    
        <ul>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.RELATORIO_CLIENTES)}">        
            <li><a href="../../../12/fixed/mootools/">Clientes</a></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.RELATORIO_CONSULTORES)}">        
            <li><a href="../../../12/fixed/jquery/">Consultores</a></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.RELATORIO_CONTRATOS)}">        
            <li><a href="../../../12/fixed/jquery/">Contratos</a></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.RELATORIO_MON_CHAMADAS)}">        
            <li><a href="../../../12/fixed/none/">Mon. de Chamadas</a></li>
            </g:if>
            <g:if test="${session?.usuario?.admin() || session?.usuario?.grupo.contem(PermissaoEnum.RELATORIO_MON_ATENDIMENTOS)}">        
            <li><a href="../../../12/fixed/none/">Mon. de Atendimentos</a></li>
            </g:if>
        </ul>
        </g:if>        
    </li>        
    <li class="secondary"><a href="http://960.gs/" title="960.gs | A CSS grid system developed by Nathan Smith">Dashboard</a>
    <li class="secondary"><a href="http://960.gs/" title="960.gs | A CSS grid system developed by Nathan Smith">Chamados</a>
    <li class="secondary"><a href="http://960.gs/" title="960.gs | A CSS grid system developed by Nathan Smith">Atendimentos</a>
    </li>
</ul>