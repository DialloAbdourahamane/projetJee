<%@ page import="projetjee.Question" %>
<!DOCTYPE html>
<html>
	<head>
          
                <meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		
		<gvisualization:apiImport/>
                <!--
                <script type="text/javascript" src="http://www.google.com/jsapi"></script>
                -->
                </head>
	<body>
          ${m}
          <div style="margin-left: 220px">
            <%
              def myDailyActivitiesColumns = [['string', 'Propositions'], ['number', 'Nb Etudiants ayant repondu']]
              def myDailyActivitiesData = myTab
            %>
          
   
       
       
       <h2>Les resultats des reponses des etudiants </h2>
       <gvisualization:pieCoreChart elementId="piechart" title="Diagrammes des resultats des etudiants" width="${450}" height="${300}" columns="${myDailyActivitiesColumns}" data="${myDailyActivitiesData}" />
            
        <div id="piechart"></div>
        </div>
	</body>
</html>
