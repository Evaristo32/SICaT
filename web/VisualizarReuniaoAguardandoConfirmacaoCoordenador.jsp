<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reuniao</title>
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>




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


        <%@include file="menuCoordenacao.jsp"%>


        <c:if test="${msgAlerta != null}">
            <div class="container"  style="margin-top: 2%;" >
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong> ${msgAlerta}</strong> 
                </div>
            </div>
        </c:if>


        <div class="container" style="margin-top: 2%;">

            <div class="panel panel-primary ">
                <div class="panel-heading">
                    Visualização Da Reunião</div>
                <div class="panel-body">

                    <form action="RecursaReuniaoCoordenadaor" name="reuniaoForm">

                        <div class="tituloDoInput"> 
                            <label for="nome">N° Reunião</label>
                        </div>
                        <div class="divInput" >
                            <input name="idReuniao" type="text" name="idReuniao"  class="form-control" value="${reuniaoAguardandoConfirmacao.idReuniao}" readonly="" style="width:25%;" />
                        </div>

                        <div class="tituloDoInput"> 
                            <label for="nome">Assunto</label>
                        </div>
                        <div class="divInput" >
                            <input name="assunto" type="text" id="assunto"  class="form-control" value="${reuniaoAguardandoConfirmacao.assunto}" disabled="disabled" style="width:100%;" />
                        </div>
                        <div class="form-group">


                            <div class="tituloDoInput"> 
                                <label for="nome">Data</label>
                            </div>
                            <div class="divInput" >
                                <input name="data" type="text" id="data"  class="form-control" value="${reuniaoAguardandoConfirmacao.data}" disabled="disabled" style="width:25%; " />
                            </div>

                            <div class="tituloDoInput"> 
                                <label for="nome">Hora</label>
                            </div>
                            <div class="divInput" >
                                <input name="hora" type="text" id="hora"  class="form-control" value="${reuniaoAguardandoConfirmacao.hora}" disabled="disabled" style="width:25%;" />
                            </div>



                            <div class="tituloDoInput">
                                <label>
                                    Descrição</label></div>
                            <div class="divInput" >
                                <textarea  name="descricao"  id="descricao"   rows="4" cols="50" class="form-control" disabled="disabled" style="width:100%;">${reuniaoAguardandoConfirmacao.descricao}</textarea>
                            </div>



                            <div class="tituloDoInput"> 
                                <label for="nome">Status</label>
                            </div>
                            <div class="divInput" >
                                <input name="status" type="text" id="status"  class="form-control" value="${reuniaoAguardandoConfirmacao.status}" disabled="disabled" style="width:100%;" />
                            </div>

                            <div class="tituloDoInput"> 
                                <label for="nome">Criada por</label>
                            </div>
                            <div class="divInput" >
                                <input name="usuario" type="text" id="usuario"  class="form-control"  value="${reuniaoAguardandoConfirmacao.criadaPeloRepresentante}" disabled="disabled" style="width:100%;" />
                            </div>

                        </div>



                        <div class="botão">
                            <input type="checkbox" onclick="AdicionarReivindicacao('DescricaoDaReprovacao')" value="Reprovar" > Rejeitar Reunião

                        </div>


                        <div class="">

                            <div  id="DescricaoDaReprovacao" style="display: none;">

                                <div class="panel-body">

                                    <div class="tituloDoInput">
                                        <label>
                                            Motivo Da Rejeição</label></div>
                                    <div class="divInput" >
                                        <textarea  name="descricaoDaRejeicao"  rows="4" cols="50" class="form-control"></textarea>
                                    </div>
                                    <div class="botão">
                                        <input class=" btn btn-danger" type="submit" value="Recusar">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>

                    <div class="botão">

                        <button class="btn btn-default" onclick="location.href = 'ListarReuniaoCordenador'">Voltar</button>
                        <button onclick="location.href = 'ConfirmarReuniaoCoordenador?idReuniao=${reuniaoAguardandoConfirmacao.idReuniao}'" class="btn btn-success">Confirmar Reunião</button>
                    </div>

                </div>
            </div> 
        </div> 
    </body>
</html>
