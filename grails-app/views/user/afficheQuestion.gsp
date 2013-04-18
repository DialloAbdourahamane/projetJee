<%@ page import="projetjee.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		
                <title>Question</title>
	</head>
	<body>
          	<div class="body">
                  <h1>Question </h1>
                  <g:if test="${flash.message}">
                    <div class="message">${flash.message}</div>
                  </g:if>
                  <g:form action="reponseEtudiant" method="post" >
                    <div class="dialog">
                     
                      
                      
                      
                      <h3>${instanceQestion?.enonce}</h3>
                      </br>
                      <!--
                      <p><input type="radio" name="myGroup" value="1" />6</p>
                      <p><input type="radio" name="myGroup" value="2" />12</p>
                      <p><input type="radio" name="myGroup" value="3" />0</p>
                      <p><input type="radio" name="myGroup" value="1" />1</p>
                      <p><input type="radio" name="myGroup" value="2" />3</p>
                      <p><input type="radio" name="myGroup" value="3" />4</p>
                  -->
                      
                      <g:if test="${instanceQestion?.propositions}">
				<div style="margin-bottom: 20px" class="fieldcontain">
					
					
						<g:each in="${instanceQestion.propositions}" var="p">
                                                  <!--
					 	<span >  </br> <div style="margin-left:232px">  </div></span>
                                               -->
                                                  <p><input type="radio" name="repEtudiant" value="${p.nom}"/>${p.nom}</p>
						</g:each>
					
				</div>
                                
                                 <div  class="butto">

                                                    <span class="button">
                                                      <input type="submit" value="Valider" />
                                                    </span>


                                      </div>
			</g:if>
                      <!--
                      <table>
                        <tbody>
                          <tr class="prop">
                            <td valign="top" class="name">
                              <label for="login">Login:</label>
                              </td>
                              <td valign="top">
                              <input type="text" id="login" name="login"/>

                            </td>
                          </tr>
                          <tr class="prop">
                            <td valign="top" class="name">
                              <label for="motDePasse">Mot de passe:</label>
                            </td>
                            
                          </tr>
                        </tbody>
                      </table>
                      <g:hiddenField name="id" value="{userInstance?.id}" />
                      -->
                      
                      
                      </div>
                 
                                     
                      
                  </g:form>
          </div>

        </body>
</html>
