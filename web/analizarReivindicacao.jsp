<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt" >
    <head>
        <meta charset="UTF-8">
        <title>Reuniao</title>
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>

        <style>

            .grid{
                width: 80%;
                height: 350px;
                text-align: center;
                margin-top: 20px;
                margin-bottom: 10px;
                margin-left: auto;
                margin-right: auto;
                background-color:#fff;


            }
            .gridAprovadas{
                display: none;
                width:333%;
            }
            .apresentarReivindicacoesAprovadas{

            }






            .selecionado{
                background-color: yellow;
            }
            .negrito{
                font-weight: bold;
            }

        </style>  
        <script>

            function AdicionarReivindicacao(id)
            {
                if (document.getElementById(id).style.display == 'block') {
                    document.getElementById(id).style.display = 'none';
                } else {
                    document.getElementById(id).style.display = 'block';
                }

            }
        </script>

    </head>

    <body>


        <%@include  file="menuRepresentante.jsp" %>

        <c:if test="${msgSucesso != null}">
            <div class="container"  style="margin-top: 2%;" >
                <div class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong> ${msgSucesso}</strong> 
                </div>
            </div>
        </c:if>

        <div class="container" style="margin-top: 2%;">

            <div class="panel panel-primary" >
                <div class="panel-heading ">
                    Reivindicações Abertas</div>
                <div class="panel-body">
                    <table  class="table table-bordered" >
                        <tr><td>N°</td><td>Assunto</td><td>Usuario</td><td>Data</td><td>Hora</td><td>Ações</td></tr>
                        <c:forEach var="reivindicacoesAbertas" items="${reivindicacoesAbertas}">
                            <tr>
                                <td>${reivindicacoesAbertas.getIdReivindicacao()}</td>
                                <td>${reivindicacoesAbertas.getAssunto()}</td>
                                <td>${reivindicacoesAbertas.getUsuario()}</td>
                                <td>${reivindicacoesAbertas.getData()}</td>
                                <td>${reivindicacoesAbertas.getHora()}</td>
                                <td>
                                    <button type="button" onclick="location.href = 'VisualizarReivindicacaoRepresentante?idReivindicacao=${reivindicacoesAbertas.getIdReivindicacao()}'" class="btn-success">
                                        Visualizar</button> 
                                </td>
                            </tr> 
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <c:if test="${msgAlerta != null}">
            <div class="container"  style="margin-top: 2%;" >
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong> ${msgAlerta}</strong> 
                </div>
            </div>
        </c:if>
        <form action="SalvarReuniao" >

            <div class="container">

                <div class="panel panel-primary ">

                    <div class="panel-heading">
                        Cadastrar Reunião</div>
                    <div class="panel-body">                

                        <div class="tituloDoInput"> 
                            <label for="nome">Assunto</label>
                        </div>
                        <div class="divInput" >
                            <input name="assunto" type="text" id="assunto" maxlength="50"  class="form-control" ng-required="true" style="width:100%;" />
                        </div>

                        <div class="form-group">

                            <div class="tituloDoInput">
                                <label>
                                    Descrição</label></div>
                            <div class="divInput" >
                                <textarea  name="descricao"  id="descricao"  maxlength="255" rows="4" cols="50" class="form-control" style="width:100%;"></textarea>
                            </div> 
                            <div class="tituloDoInput"> 
                                <label for="nome">Data</label>
                            </div>
                            <div class="divInput" >
                                <input name="data" type="date" id="assunto" maxlength="20"  class="form-control" ng-required="true" style="width:15%;" />
                            </div>

                            <div class="tituloDoInput"> 
                                <label for="nome">Hora</label>
                            </div>
                            <div class="divInput" >
                                <input name="hora" type="time" id="assunto" maxlength="20"  class="form-control" ng-required="true" style="width:15%;" />
                            </div>

                            <input type="checkbox" onclick="AdicionarReivindicacao('ReivindicacoesAprovadas')" > Associar Reivindicações


                            <div class="">

                                <div class="panel panel-primary " id="ReivindicacoesAprovadas" style="display: none;">
                                    <div class="panel-heading">
                                        Reivindicações Confirmadas Pelo Coordenador
                                    </div>
                                    <div class="panel-body">

                                        <table  class="table table-bordered" >

                                            <tr><td>Sel</td><td>N°</td><td>Assunto</td><td>Ações</td></tr>

                                            <c:forEach var="reivindicacoesConfirmada" items="${reivindicacoesConfirmada}">

                                                <tr>

                                                    <td><input type="checkbox" name="selectRivindicacao" value=${reivindicacoesConfirmada.getIdReivindicacao()}></td>
                                                    <td>${reivindicacoesConfirmada.getIdReivindicacao()}</td>
                                                    <td>${reivindicacoesConfirmada.getAssunto()}</td>

                                                    <td>

                                                        <button type="button" onclick="location.href = 'VisualizarReivindicacao?idReivindicacao=${reivindicacoesConfirmada.getIdReivindicacao()}'" class="btn-success">
                                                            Visualizar</button> 
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="botão">
                            <button class="btn btn-primary"  type="submit">Submeter Para Coordenador</button>
                        </div>
                    </div>

                </div>


            </div>
        </form>

    </body>
</html>
