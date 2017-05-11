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

            .tituloDoInput{
                float: left; width: 50%; margin-left: 4px;
            }
            .divInput{
                float: left; width: 50%; margin-left: 4px;
            }

            .bot�o{
                float: left;
                width: 50%;
                margin-left: 4px;
                margin-top:  20px;

            }
        </style>
        <script>


            function ConfirmaReprovamento(id,idConfirmar)
            {
                
                 if (document.getElementById(idConfirmar).disabled == false) {
                    document.getElementById(idConfirmar).disabled = true;
                } else {
                    document.getElementById(idConfirmar).disabled = false;
                }
                
                if (document.getElementById(id).style.display == 'block') {
                    document.getElementById(id).style.display = 'none';
                } else {
                    document.getElementById(id).style.display = 'block';
                }

            }

        </script>
    </head>
    <body>
        <%@include  file="menuCoordenacao.jsp" %>
       
          <c:if test="${msgAlerta != null}">
            <div class="container"  style="margin-top: 2%;" >
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong> ${msgAlerta}</strong> 
                </div>
            </div>
        </c:if>
        
        
        <div class="container" style="margin-top: 2%;">
            <div class="panel panel-primary ocutarVisualizacao " id="visualizaReivindicacao">
                <div class="panel-heading">
                    Visualiza��o Da Reivindica��o</div>
                <div class="panel-body">
                    <form action="IncluirStatusReprovadaCoordenador" name="reuniaoForm">
                        <div class="tituloDoInput"> 
                            <label for="nome">N� Reivindica��o</label>
                        </div>
                        <div class="divInput" >
                            <input name="idReivindicacao" type="text" name="idReivindicacao"  class="form-control" value="${reivindicacao.idReivindicacao}" readonly="" style="width:25%;" />
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
                                    Descri��o</label></div>
                            <div class="divInput" >
                                <textarea  name="descricao"  id="descricao"   rows="4" cols="50" class="form-control" disabled="disabled" style="width:100%;">${reivindicacao.descricao}</textarea>
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

                        <div class="bot�o">
                            <input type="checkbox" onClick="ConfirmaReprovamento('DescricaoDaReprovacao','Confirmar')" value="Reprovar" > Rejeitar Reivindica��o

                        </div>


                        <div  id="DescricaoDaReprovacao" style="display: none;">

                            <div class="panel-body">

                                <div class="tituloDoInput">
                                    <label>
                                        Descri��o da rejei��o</label></div>
                                <div class="divInput" >
                                    <textarea  name="descricaoDaRejeicao"  id="descricao"   rows="4" cols="50" class="form-control"></textarea>
                                </div>


                                <div class="bot�o">
                                    <input type="submit" class="btn btn-danger" value="Confirma Reprova��o">
                                </div> 
                            </div>
                        </div>
                    </form>

                    <div class="bot�o">
                        <button class="btn btn-default" onclick="location.href = 'ListarReivindicacaoCoordenador'">Voltar</button>
                        <!--<button onClick="ConfirmaReprovamento('DescricaoDaReprovacao')" class="btn btn-danger" >Reprovar</button>-->           
                        <button id="Confirmar" onclick="location.href = 'IncluirStatusConfirmada?idReivindicacao=${reivindicacao.idReivindicacao}'" class="btn btn-success">Confirmar Reivindica��o</button>
                    </div>





                </div>         
            </div>
        </div>

    </body>
</html>
