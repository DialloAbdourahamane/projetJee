
<%@ page import="projetjee.Question" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-question" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list question">
			
				
				<g:if test="${questionInstance?.enonce}">
				<li class="fieldcontain">
					<span id="enonce-label" class="property-label"><g:message code="question.enonce.label" default="Enonce" /></span>
					
						<span class="property-value" aria-labelledby="enonce-label"><g:fieldValue bean="${questionInstance}" field="enonce"/></span>
					
				</li>
				</g:if>
				<g:if test="${questionInstance?.etat}">
				<li class="fieldcontain">
					<span id="etat-label" class="property-label"><g:message code="question.etat.label" default="Etat" /></span>
					
						<span class="property-value" aria-labelledby="etat-label"><g:fieldValue bean="${questionInstance}" field="etat"/></span>
					
				</li>
				</g:if>
			
			
				<g:if test="${questionInstance?.propositions}">
				<li class="fieldcontain">
					<span id="proposition-label" class="property-label"><g:message code="question.proposition.label" default="Proposition" /></span>
					
						<g:each in="${questionInstance.propositions}" var="p">
					 	<span >  </br> <div style="margin-left:232px"> ${p.nom}  </div></span>
						</g:each>
					
				</li>
				</g:if>
				
					<div><!-- bouton d'ouverture -->
						<g:form  action="ouvrir_fermer" id="${questionInstance?.id}">
							 <input type = "submit" value="${state}" >
						</g:form>
				</div>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${questionInstance?.id}" />
					<g:link class="edit" action="edit" id="${questionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		
	</body>
</html>
