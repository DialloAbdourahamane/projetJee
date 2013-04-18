<%@ page import="projetjee.Question" %>


<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'enonce', 'error')} ">
	
	<p> Enonce </p>
	<g:textField name="enonce" value="${questionInstance?.enonce}"/> 
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'propositions', 'error')} ">
	<p>Proposition </p>
	<p>1 <input type="text" name="proposition1"> </p>
	<p>2 <input type="text" name="proposition2"> </p>
	<p>3 <input type="text" name="proposition3"></p>
	<p>4 <input type="text" name="proposition4"></p>
</div>

