<%-- 
    Document   : avaliacoesRealizadas
    Created on : 11/10/2016, 10:34:02
    Author     : Evaristo
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt-br">
    <head>
       <title>SICaT</title>
       
         <meta contentType="text/html; charset=UTF-8">
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
          
    </head>
    <body>
        <%@include  file="menuCoordenacao.jsp" %>

        <div class="container" style="margin-top: 2%">
            <div class="panel panel-primary" style="margin-top: 2%">


                <div class="panel-heading">
                    <h3 class="panel-title">Avaliações Realizadas</h3>
                </div>
                <div class="panel-body">



                    <table class="table table-responsive">

                        <tr>
                            <td>N° Avaliação</td><td>Avaliada por</td><td>Reivindicação Avaliada</td><td>Assunto</td><td>Ações</td>
                        </tr>
                        <c:forEach var="AvaliacoesRealizadas" items="${AvaliacoesRealizadas}">

                            <tr>
                                <td>${AvaliacoesRealizadas.idAvaliacaoDoProcesso}</td>
                                <td>${AvaliacoesRealizadas.usuario}</td>
                                <td>${AvaliacoesRealizadas.getReivindicacao().getIdReivindicacao()}</td>
                                <td>${AvaliacoesRealizadas.getReivindicacao().getAssunto()}</td>
                                <td><button class="btn btn-success"  onClick="location.href = 'visualizarAvaliacao?idAvaliacaoDoProcesso=${AvaliacoesRealizadas.idAvaliacaoDoProcesso}'" >Visualizar</button></td>
                            </tr>
                        </c:forEach>
                    </table>

                </div>
            </div>
        </div>

    </body>
</html>
