<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>

        <script>
            function mostrarGridComRegistro(id,idReivindicacao) {

                if (document.getElementById(id).style.display == 'block') {
                    document.getElementById(id).style.display = 'none';
                } else {
                    document.getElementById(id).style.display = 'block';
                }
                document.idReivindicacao.action = "http://localhost:8080/LayoutSicat/IncluirStatusReprovadaCoordenador";
                document.forms["reuniaoForm"].submit();

            }



        </script>


        <style>
            .ocutarVisualizacao{
                display: none;
            }
        </style>

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

            <div class="panel panel-primary" >
                <div class="panel-heading ">
                    Reivindicações Aprovadas Pelo Representante</div>
                <div class="panel-body">
                    <table  class="table table-bordered" >
                        <tr><td>N°</td><td>Assunto</td><td>Usuario</td><td>Data</td><td>Hora</td><td>Ações</td></tr>
                        <c:forEach var="reivindicacoesAprovadas" items="${reivindicacoesAprovadas}">
                            <tr>
                                <td>${reivindicacoesAprovadas.getIdReivindicacao()}</td>
                                <td>${reivindicacoesAprovadas.getAssunto()}</td>
                                <td>${reivindicacoesAprovadas.getUsuario()}</td>
                                <td>${reivindicacoesAprovadas.getData()}</td>
                                <td>${reivindicacoesAprovadas.getHora()}</td>
                                <td>
                                    <button type="button" onclick="location.href = 'VisualizarReivindicacaoCoordenador?idReivindicacao=${reivindicacoesAprovadas.getIdReivindicacao()}'" class="btn-success">
                                        Visualizar</button> 
<!--
                                    <button class="btn btn-success" onClick="mostrarGridComRegistro('visualizaReivindicacao', '${reivindicacoesAprovadas.getIdReivindicacao()}')"  >
                                        <span>Visualizar</span></button>-->

                                </td>
                            </tr> 
                        </c:forEach>
                    </table>
                </div>
            </div>

            <div class="panel panel-primary ocutarVisualizacao " id="visualizaReivindicacao">
                <div class="panel-heading">
                    Visualização Da Reivindicação</div>
                <div class="panel-body">

                    <div class="tituloDoInput"> 
                        <label for="nome">N° Reivindicação</label>
                    </div>
                    <div class="divInput" >
                        <input name="assunto" type="text" name="idReivindicacao"  class="form-control" value="${reivindicacao.idReivindicacao}" disabled="disabled" style="width:25%;" />
                    </div>

                    <div class="tituloDoInput"> 
                        <label for="nome">Assunto</label>
                    </div>
                    <div class="divInput" >
                        <input name="assunto" type="text" id="assunto"  class="form-control" value="    ${reivindicacao.assunto}" disabled="disabled" style="width:100%;" />
                    </div>
                    <div class="form-group">


                        <div class="tituloDoInput"> 
                            <label for="nome">Data</label>
                        </div>
                        <div class="divInput" >
                            <input name="data" type="text" id="data"  class="form-control" value="${reivindicacao.data}" disabled="disabled" style="width:25%; " />
                        </div>

                        <div class="tituloDoInput"> 
                            <label for="nome">Hora</label>
                        </div>
                        <div class="divInput" >
                            <input name="hora" type="text" id="hora"  class="form-control" value="${reivindicacao.hora}" disabled="disabled" style="width:25%;" />
                        </div>



                        <div class="tituloDoInput">
                            <label>
                                Descrição</label></div>
                        <div class="divInput" >
                            <textarea  name="descricao"  id="descricao"   rows="4" cols="50" class="form-control" disabled="disabled" style="width:100%;">
                                ${reivindicacao.descricao}
                            </textarea>
                        </div>



                        <div class="tituloDoInput"> 
                            <label for="nome">Status</label>
                        </div>
                        <div class="divInput" >
                            <input name="status" type="text" id="status"  class="form-control" value="${reivindicacao.status}" disabled="disabled" style="width:100%;" />
                        </div>

                        <div class="tituloDoInput"> 
                            <label for="nome">Criada por</label>
                        </div>
                        <div class="divInput" >
                            <input name="usuario" type="text" id="usuario"  class="form-control"  value="${reivindicacao.usuario}" disabled="disabled" style="width:100%;" />
                        </div>

                    </div>

                    <div class="botão">
                        <button class="btn btn-default" onclick="location.href = 'ListarReivindicacaoRepresentante'">Voltar</button>
                        <button onClick="ConfirmaReprovamento('DescricaoDaReprovacao')" class="btn btn-danger" >Reprovar</button>           
                        <button onclick="location.href = 'IncluirStatusConfirmada?idReivindicacao=${reivindicacao.idReivindicacao}'" class="btn btn-success">Confirmar Reivindicação</button>
                    </div>


                    <div  id="DescricaoDaReprovacao" style="display: none;">

                        <div class="panel-body">

                            <div class="tituloDoInput">
                                <label>
                                    Descrição</label></div>
                            <div class="divInput" >
                                <textarea  name="descricaoDaRejeicao"  id="descricao"   rows="4" cols="50" class="form-control">
                                 
                                </textarea>
                            </div>


                            <div class="botão">
                                <button onclick="location.href = 'IncluirStatusReprovadaCoordenador?idReivindicacao=${reivindicacao.idReivindicacao}'" class="btn btn-danger">Confirma Reprovação</button>
                            </div> 
                        </div>
                    </div>



                </div>
            </div> 













        </div>






    </body>
</html>
