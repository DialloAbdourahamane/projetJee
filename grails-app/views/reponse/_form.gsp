<%@ page import="projetjee.Reponse" %>



<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="reponse.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${projetjee.User.list()}" optionKey="id" required="" value="${reponseInstance?.user?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'note', 'error')} required">
	<label for="note">
		<g:message code="reponse.note.label" default="Note" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="note" type="number" value="${reponseInstance.note}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'commentaire', 'error')} ">
	<label for="commentaire">
		<g:message code="reponse.commentaire.label" default="Commentaire" />
		
	</label>
	<g:select id="commentaire" name="commentaire.id" from="${projetjee.Commentaire.list()}" optionKey="id" value="${reponseInstance?.commentaire?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'propostion', 'error')} required">
	<label for="propostion">
		<g:message code="reponse.propostion.label" default="Propostion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="propostion" name="propostion.id" from="${projetjee.Proposition.list()}" optionKey="id" required="" value="${reponseInstance?.propostion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="reponse.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${projetjee.Question.list()}" optionKey="id" required="" value="${reponseInstance?.question?.id}" class="many-to-one"/>
</div>

