<%@ page import="questionnaire1.Commentaire" %>



<div class="fieldcontain ${hasErrors(bean: commentaireInstance, field: 'com', 'error')} ">
	<label for="com">
		<g:message code="commentaire.com.label" default="Com" />
		
	</label>
	<g:textField name="com" value="${commentaireInstance?.com}"/>
</div>

