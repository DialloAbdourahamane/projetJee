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
          <div style="margin-left: 220px">
            <%
              def myDailyActivitiesColumns = [['string', 'Propositions'], ['number', 'Nb Etudiants ayant repondu']]
              def myDailyActivitiesData = [['Work', 11], ['Eat', 2], ['Commute', 2], ['Watch TV', 2], ['Sleep', 7]]
            %>
          
   
       
       
       <h2>Les resultats des reponses des etudiants </h2>
       <gvisualization:pieCoreChart elementId="piechart" title="My Daily Activities" width="${450}" height="${300}" columns="${myDailyActivitiesColumns}" data="${myDailyActivitiesData}" />
            
        <div id="piechart"></div>
        </div>
	</body>
</html>
