<%-- 
    Document   : reivindicacoesEncerradas
    Created on : 09/10/2016, 14:27:48
    Author     : Evaristo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
    </head>
    <body>
        <%@include  file="menu.jsp" %>
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
                        <c:forEach var="reivindicacoesEncerrado" items="${reivindicacoesEncerrado}">

                            <tr>
                                <td>${reivindicacoesEncerrado.idReivindicacao}</td>
                                <td>${reivindicacoesEncerrado.assunto}</td>
                                <td><button class="btn btn-success"  onClick="location.href = 'ComecarAvaliacao?idReivindicacao=${reivindicacoesEncerrado.getIdReivindicacao()}'" >Avaliar Reivindicação</button></td>
                            </tr>
                        </c:forEach>
                    </table>

                </div>
            </div>
        </div>





    </body>
</html>
