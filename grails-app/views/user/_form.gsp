<%@ page import="questionnaire1.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'nom', 'error')} ">
	<label for="nom">
		<g:message code="user.nom.label" default="Nom" />
		
	</label>
	<g:textField name="nom" value="${userInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'prenom', 'error')} ">
	<label for="prenom">
		<g:message code="user.prenom.label" default="Prenom" />
		
	</label>
	<g:textField name="prenom" value="${userInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="user.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="role" from="${userInstance.constraints.role.inList}" required="" value="${userInstance?.role}" valueMessagePrefix="user.role"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="user.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="mail" required="" value="${userInstance?.mail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="user.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" required="" value="${userInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'motDePasse', 'error')} required">
	<label for="motDePasse">
		<g:message code="user.motDePasse.label" default="Mot De Passe" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="motDePasse" required="" value="${userInstance?.motDePasse}"/>
</div>

