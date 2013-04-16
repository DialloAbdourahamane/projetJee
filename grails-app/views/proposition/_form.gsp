<%@ page import="questionnaire1.Proposition" %>



<div class="fieldcontain ${hasErrors(bean: propositionInstance, field: 'nom', 'error')} ">
	<label for="nom">
		<g:message code="proposition.nom.label" default="Nom" />
		
	</label>
	<g:textField name="nom" value="${propositionInstance?.nom}"/>
</div>

