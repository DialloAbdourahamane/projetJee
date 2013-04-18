<%@ page import="projetjee.Commentaire" %>



<div class="fieldcontain ${hasErrors(bean: commentaireInstance, field: 'nom', 'error')} ">
	<label for="nom">
		<g:message code="commentaire.nom.label" default="Nom" />
		
	</label>
	<g:textField name="nom" value="${commentaireInstance?.nom}"/>
</div>

