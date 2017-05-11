<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt-br">
    <head>
         <title>SICaT</title>

        <meta contentType="text/html; charset=UTF-8">
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
          
        

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

    </head>
    <body>

        <%@include file="menuCoordenacao.jsp"%>
        
          <c:if test="${msgSucesso != null}">
            <div class="container"  style="margin-top: 2%;" >
                <div class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong> ${msgSucesso}</strong> 
                </div>
            </div>
        </c:if>

        <div class="container" style="margin-top: 2%;">

            <div class="panel panel-primary ">
                <div class="panel-heading">
                    Reuniões Aguardando Confirmação
                </div>
                <div class="panel-body">

                    <table  class="table table-bordered" >

                        <tr><td>N°</td><td>Assunto</td><td>Cadastrada Por</td><td>Ações</td></tr>

                        <c:forEach var="reunioesAguardandoConfirmacao" items="${reunioesAguardandoConfirmacao}">

                            <tr>

<!--                                    <td><input type="checkbox" name="selectRivindicacao" value=${reivindicacoes.getIdReuniao()}></td>-->
                                <td>${reunioesAguardandoConfirmacao.getIdReuniao()}</td>
                                <td>${reunioesAguardandoConfirmacao.getAssunto()}</td>
                                <td>${reunioesAguardandoConfirmacao.getCriadaPeloRepresentante()}</td>

                                <td>
                                 
                                    <button type="button" onclick="location.href = 'visualizarReuniaoAguardandoConfirmacaoCoordenador?idReuniao=${reunioesAguardandoConfirmacao.getIdReuniao()}'" class="btn-success">
                                        Visualizar</button> 
                                    
                                </td>
                            </tr> 
                        </c:forEach>
                    </table>
                </div>
            </div>
            
                <div class="panel panel-primary ">
                <div class="panel-heading">
                    <a class="Ahrf" onclick="ApresentarEcultarConfirmadas('ReuniãConfirmadas')"><span class="glyphicon glyphicon-plus"> Reuniões Confirmadas</span></a>  
                </div>
                <div class="panel-body" id="ReuniãConfirmadas" >

                    <table  class="table table-bordered" >

                        <tr><td>N°</td><td>Assunto</td><td>Status</td><td>Ações</td></tr>

                        <c:forEach var="reunioesConfirmadas" items="${reunioesConfirmadas}">

                            <tr>
                                <td>${reunioesConfirmadas.getIdReuniao()}</td>
                                <td>${reunioesConfirmadas.getAssunto()}</td>
                                <td>${reunioesConfirmadas.getStatus()}</td>

                                <td>
<!--                                    <button  onClick="funcaoDoisEmUma('${reunioesConfirmadas.getIdReuniao()}')" class="btn-warning">
                                        Alterar</button>-->
                                    <button  onclick="location.href = 'VisualizarReuniaoCoordenador?idReuniao=${reunioesConfirmadas.getIdReuniao()}'" class="btn-success">
                                       Visualizar </button> 
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
                                <td>${reunioesRecusadas.getIdReuniao()}</td>
                                <td>${reunioesRecusadas.getAssunto()}</td>
                                <td>${reunioesRecusadas.getStatus()}</td>

                                <td>
<!--                                    <button  onClick="funcaoDoisEmUma('${reunioesRecusadas.getIdReuniao()}')" class="btn-warning">
                                        Alterar</button>-->
                                    <button  onclick="location.href = 'VisualizarReuniaoCoordenador?idReuniao=${reunioesRecusadas.getIdReuniao()}'" class="btn-success">
                                        Visualizar</button> 
                                    <!--<button  onclick="location.href = 'ExcluirReivindicacao?getIdReuniao=${reunioesRecusadas.getIdReuniao()}'"  class="btn-danger" aria-hidden="true">Excluir</button>-->
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
                                <td>${reunioesConcluidas.getIdReuniao()}</td>
                                <td>${reunioesConcluidas.getAssunto()}</td>
                                <td>${reunioesConcluidas.getStatus()}</td>

                                <td>
<!--                                    <button  onClick="funcaoDoisEmUma('${reunioesConcluidas.getIdReuniao()}')" class="btn-warning">
                                        Alterar</button>-->
                                    <button  onclick="location.href = 'VisualizarReuniaoConcluida?idReuniao=${reunioesConcluidas.getIdReuniao()}'" class="btn-success">
                                        Visualizar</button> 
                                    
                                </td>
                            </tr> 
                        </c:forEach>
                    </table>
                </div>
            </div>
            
            
            
                 <div class="panel panel-primary ">
                <div class="panel-heading">
                    <a class="Ahrf" onclick="ApresentarEcultar('reunioesEncerradas')"><span class="glyphicon glyphicon-plus"> Reuniões Encerradas</span></a>
                </div>
                <div class="panel-body" id="reunioesEncerradas" style="display: none;">

                    <table  class="table table-bordered" >

                        <tr><td>N°</td><td>Assunto</td><td>Status</td><td>Ações</td></tr>

                        <c:forEach var="reunioesEncerradas" items="${reunioesEncerradas}">

                            <tr>
                                <td>${reunioesEncerradas.getIdReuniao()}</td>
                                <td>${reunioesEncerradas.getAssunto()}</td>
                                <td>${reunioesEncerradas.getStatus()}</td>

                                <td>

                                    <button  onclick="location.href = 'VisualizarReuniaoCoordenador?idReuniao=${reunioesEncerradas.getIdReuniao()}'" class="btn-success">
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
