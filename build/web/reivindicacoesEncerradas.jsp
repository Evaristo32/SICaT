<%-- 
    Document   : reivindicacoesEncerradas
    Created on : 09/10/2016, 14:27:48
    Author     : Evaristo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
         <title>SICaT</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
           

    </head>
    <body>
        <%@include  file="menu.jsp" %>

        <c:if test="${msgSucesso != null}">
            <div class="container"  style="margin-top: 2%;" >
                <div class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong> ${msgSucesso}</strong> 
                </div>
            </div>
        </c:if>
        <c:if test="${msgAlerta != null}">
            <div class="container"  style="margin-top: 2%;" >
                <div class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong> ${msgAlerta}</strong> 
                </div>
            </div>
        </c:if>

 

        <div class="container" style="margin-top: 2%">
            <div class="panel panel-primary" style="margin-top: 2%">


                <div class="panel-heading">
                    <h3 class="panel-title">Reivindicações Encerradas</h3>
                </div>
                <div class="panel-body">

                    <table class="table table-responsive">

                        <tr>
                            <td>N°</td><td>Assunto</td><td>Ações</td>
                        </tr>
                        <c:if test="${msgNenhumRegistro == null}">
                            <c:forEach var="reivindicacoesParaAvaliar" items="${reivindicacoesParaAvaliar}">
                                <tr>
                                    <td>${reivindicacoesParaAvaliar.idReivindicacao}</td>
                                    <td>${reivindicacoesParaAvaliar.assunto}</td>
                                    <td><button class="btn btn-success"  onClick="location.href = 'ComecarAvaliacao?idReivindicacao=${reivindicacoesParaAvaliar.getIdReivindicacao()}'" >Avaliar Reivindicação</button></td>
                                </tr>
                            </c:forEach>
                        </c:if>

                        <c:if test="${msgNenhumRegistro != null}">
                            <tr>
                                <td> ${msgNenhumRegistro}</td>
                            </tr>
                                  
                        </c:if>



                    </table>

                </div>
            </div>
        </div>





    </body>
</html>
