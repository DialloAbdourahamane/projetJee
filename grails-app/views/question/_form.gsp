<%@ page import="questionnaire1.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'enonce', 'error')} required">
	<label for="enonce">
		<g:message code="question.enonce.label" default="Enonce" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="enonce" required="" value="${questionInstance?.enonce}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'etat', 'error')} ">
	<label for="etat">
		<g:message code="question.etat.label" default="Etat" />
		
	</label>
	<g:checkBox name="etat" value="${questionInstance?.etat}" />
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'proprietaire', 'error')} ">
	<label for="proprietaire">
		<g:message code="question.proprietaire.label" default="Proprietaire" />
		
	</label>
	<g:select id="proprietaire" name="proprietaire.id" from="${questionnaire1.User.list()}" optionKey="id" value="${questionInstance?.proprietaire?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'propositions', 'error')} ">
	<label for="propositions">
		<g:message code="question.propositions.label" default="Propositions" />
		
	</label>
	<g:select name="propositions" from="${questionnaire1.Proposition.list()}" multiple="multiple" optionKey="id" size="5" value="${questionInstance?.propositions*.id}" class="many-to-many"/>
</div>

