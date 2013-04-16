<%@ page import="questionnaire1.Reponse" %>



<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'commentaire', 'error')} required">
	<label for="commentaire">
		<g:message code="reponse.commentaire.label" default="Commentaire" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="commentaire" name="commentaire.id" from="${questionnaire1.Commentaire.list()}" optionKey="id" required="" value="${reponseInstance?.commentaire?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'note', 'error')} required">
	<label for="note">
		<g:message code="reponse.note.label" default="Note" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="note" type="number" value="${reponseInstance.note}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'reponse', 'error')} required">
	<label for="reponse">
		<g:message code="reponse.reponse.label" default="Reponse" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="reponse" name="reponse.id" from="${questionnaire1.Proposition.list()}" optionKey="id" required="" value="${reponseInstance?.reponse?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="reponse.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${questionnaire1.User.list()}" optionKey="id" required="" value="${reponseInstance?.user?.id}" class="many-to-one"/>
</div>

