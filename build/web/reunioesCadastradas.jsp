<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="pt-br">
    <head>
         <title>SICaT</title>
         <meta contentType="text/html; charset=UTF-8">
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
           
        


    </head>
    <style>
        .Ahrf{
            color: white;          
            text-decoration:none;
        }
    </style>
    <script>

        function ApresentarEcultar(id)
        {
            if (document.getElementById(id).style.display == 'block') {
                document.getElementById(id).style.display = 'none';
            } else {
                document.getElementById(id).style.display = 'block';
            }

        }

        function ApresentarEcultarConfirmadas(id)
        {
            if (document.getElementById(id).style.display == 'none') {
                document.getElementById(id).style.display = 'block';
            } else {
                document.getElementById(id).style.display = 'none';
            }

        }

    </script>


    <body>
        <%@include  file="menuRepresentante.jsp" %>
        <div class="container" style="margin-top: 2%;">

            <div class="panel panel-primary ">
                <div class="panel-heading">
                    <a class="Ahrf" onclick="ApresentarEcultarConfirmadas('ReuniãConfirmadas')"><span class="glyphicon glyphicon-plus"> Reuniões Confirmadas</span></a>  
                </div>
                <div class="panel-body" id="ReuniãConfirmadas" >

                    <table  class="table table-bordered" >

                        <tr><td>N°</td><td>Assunto</td><td>Status</td><td>Ações</td></tr>

                        <c:forEach var="reunioesConfirmadas" items="${reunioesConfirmadas}">

                            <tr>
                                <td>${reunioesConfirmadas.idReuniao}</td>
                                <td>${reunioesConfirmadas.assunto()}</td>
                                <td>${reunioesConfirmadas.status()}</td>

                                <td>
                                    <button  onclick="location.href = 'VisualizarReuniaoRepresentante?idReuniao=${reunioesConfirmadas.getIdReuniao()}'" class="btn-success">Visualizar </button> 
                                </td>
                            </tr> 
                        </c:forEach>
                    </table>
                </div>
            </div>

            <div class="panel panel-primary ">
                <div class="panel-heading">
                    <a class="Ahrf" onclick="ApresentarEcultar('ReunioesCadastradas')"><span class="glyphicon glyphicon-plus"> Reuniões Cadastradas</span></a>   
                </div>
                <div class="panel-body " id="ReunioesCadastradas" style="display: none;">

                    <table  class="table table-bordered " >
                        <tr><td>N°</td><td>Assunto</td><td>Status</td><td>Ações</td></tr>
                        <c:forEach var="reunioesAguardandoConfirmacao" items="${reunioesAguardandoConfirmacao}">
                            <tr>
                                <td>${reunioesAguardandoConfirmacao.idReuniao}</td>
                                <td>${reunioesAguardandoConfirmacao.assunto}</td>
                                <td>${reunioesAguardandoConfirmacao.status}</td>
                                <td>
                                    <button  onclick="location.href = 'VisualizarReuniaoRepresentante?idReuniao=${reunioesAguardandoConfirmacao.getIdReuniao()}'" class="btn-success">Visualizar</button> 
                                </td>
                            </tr> 
                        </c:forEach>
                    </table>
                </div>
            </div>

            <div class="panel panel-primary ">
                <div class="panel-heading">
                    <a class="Ahrf" onclick="ApresentarEcultar('ReuniõesRecusadas')"><span class="glyphicon glyphicon-plus"> Reuniões Recusadas</span></a>  
                </div>
                <div class="panel-body" id="ReuniõesRecusadas" style="display: none;">

                    <table  class="table table-bordered" >

                        <tr><td>N°</td><td>Assunto</td><td>Status</td><td>Ações</td></tr>

                        <c:forEach var="reunioesRecusadas" items="${reunioesRecusadas}">

                            <tr>
                                <td>${reunioesRecusadas.idReuniao}</td>
                                <td>${reunioesRecusadas.assunto}</td>
                                <td>${reunioesRecusadas.status}</td>

                                <td>
                                    <button  onclick="location.href = 'AlterarReuniao?idReuniao=${reunioesRecusadas.getIdReuniao()}'" class="btn-warning">
                                        Alterar</button>
                                    <button  onclick="location.href = 'visualizarReuniaoRecusadas?idReuniao=${reunioesRecusadas.getIdReuniao()}'" class="btn-success">
                                        Visualizar</button> 

                                </td>
                            </tr> 
                        </c:forEach>
                    </table>
                </div>
            </div>



            <div class="panel panel-primary ">
                <div class="panel-heading">
                    <a class="Ahrf" onclick="ApresentarEcultar('reunioesConcluidas')"><span class="glyphicon glyphicon-plus"> Reuniões Concluidas</span></a>
                </div>
                <div class="panel-body" id="reunioesConcluidas" style="display: none;">

                    <table  class="table table-bordered" >

                        <tr><td>N°</td><td>Assunto</td><td>Status</td><td>Ações</td></tr>

                        <c:forEach var="reunioesConcluidas" items="${reunioesConcluidas}">

                            <tr>
                                <td>${reunioesConcluidas.idReuniao()}</td>
                                <td>${reunioesConcluidas.assunto}</td>
                                <td>${reunioesConcluidas.status()}</td>

                                <td>

                                    <button  onclick="location.href = 'VisualizarReuniaoRepresentante?idReuniao=${reunioesConcluidas.getIdReuniao()}'" class="btn-success">
                                        Visualizar</button> 

                                </td>
                            </tr> 
                        </c:forEach>
                    </table>
                </div>
            </div>


            <div class="panel panel-primary ">
                <div class="panel-heading">
                    <a class="Ahrf" onclick="ApresentarEcultar('reunioesEncerradas')"><span class="glyphicon glyphicon-plus"> Reuniões Encerrado</span></a>
                </div>
                <div class="panel-body" id="reunioesEncerradas" style="display: none;">

                    <table  class="table table-bordered" >

                        <tr><td>N°</td><td>Assunto</td><td>Status</td><td>Ações</td></tr>

                        <c:forEach var="reunioesEncerradas" items="${reunioesEncerradas}">

                            <tr>
                                <td>${reunioesEncerradas.idReuniao}</td>
                                <td>${reunioesEncerradas.assunto}</td>
                                <td>${reunioesEncerradas.status}</td>

                                <td>

                                    <button  onclick="location.href = 'VisualizarReuniaoRepresentante?idReuniao=${reunioesEncerradas.getIdReuniao()}'" class="btn-success">
                                        Visualizar</button> 
                                        
                                </td>
                            </tr> 
                        </c:forEach>
                    </table>
                </div>
            </div>

        </div>
    </body>
</html>
