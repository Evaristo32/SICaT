

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>

        <script>


            function ConfirmaReprovamento(id)
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
        <%@include  file="menuCoordenacao.jsp" %>

        <div class="container" style="margin-top: 2%;">
            <div class="panel panel-primary " >
                <div class="panel-heading">
                    Visualizar Reuni�o</div>
                <div class="panel-body">

                    <form action="IncluirStatusReprovadaCoordenador">

                        <div class="tituloDoInput"> 
                            <label for="nome">N� Reuni�o</label>
                        </div>
                        <div class="divInput" >
                            <input name="assunto" type="text" name="idReivindicacao"  class="form-control" value="${reuniao.idReuniao}"  readonly="" style="width:25%;" />
                        </div>

                        <div class="tituloDoInput"> 
                            <label for="nome">Assunto</label>
                        </div>
                        <div class="divInput" >
                            <input name="assunto" type="text" id="assunto"  class="form-control" value="    ${reuniao.assunto}" disabled="disabled" style="width:100%;" />
                        </div>
                        <div class="form-group">


                            <div class="tituloDoInput"> 
                                <label for="nome">Data</label>
                            </div>
                            <div class="divInput" >
                                <input name="data" type="text" id="data"  class="form-control" value="${reuniao.data}" disabled="disabled" style="width:25%; " />
                            </div>

                            <div class="tituloDoInput"> 
                                <label for="nome">Hora</label>
                            </div>
                            <div class="divInput" >
                                <input name="hora" type="text" id="hora"  class="form-control" value="${reuniao.hora}" disabled="disabled" style="width:25%;" />
                            </div>



                            <div class="tituloDoInput">
                                <label>
                                    Descri��o</label></div>
                            <div class="divInput" >
                                <textarea  name="descricao"  id="descricao"   rows="4" cols="50" class="form-control" disabled="disabled" style="width:100%;">
                                    ${reuniao.descricao}
                                </textarea>
                            </div>



                            <div class="tituloDoInput"> 
                                <label for="nome">Status</label>
                            </div>
                            <div class="divInput" >
                                <input name="status" type="text" id="status"  class="form-control" value="${reuniao.status}" disabled="disabled" style="width:100%;" />
                            </div>

                            <div class="tituloDoInput"> 
                                <label for="nome">Criada por</label>
                            </div>
                            <div class="divInput" >
                                <input name="usuario" type="text" id="usuario"  class="form-control"  value="${reuniao.usuario}" disabled="disabled" style="width:100%;" />
                            </div>

                        </div>


                        <div class="bot�o">
                            <button class="btn btn-default" onclick="location.href = 'ListarReivindicacaoRepresentante'">Voltar</button>
                            
                            <button onClick="ConfirmaReprovamento('DescricaoDaReprovacao')" class="btn btn-danger" >tttt</button>  
                            
                            
                        </div>

                        
                        
                        
                        <div  id="DescricaoDaReprovacao" style="display: none;">

                            <div class="panel-body">

                                <div class="tituloDoInput">
                                    <label>
                                        Descri��o</label></div>
                                <div class="divInput" >
                                    <textarea  name="descricaoDaRejeicao"  id="descricao"   rows="4" cols="50" class="form-control">
                                 
                                    </textarea>
                                </div>


                                <div class="bot�o">
                                    <button type="submit" class="btn btn-danger">Confirma Reprova��o</button>
                                </div> 


<!--<button onclick="location.href = 'RecursaReuniaoCoordenadaor?idReuniao=${reuniao.idReuniao}'" class="btn btn-success">Reprovar</button>-->
                            <!--<button onclick="location.href = 'ConfirmarReuniaoCoordenador?idReuniao=${reuniao.idReuniao}'" class="btn btn-success">Confirmar</button>-->
                            </div>
                        </div>
                    </form>
                            
                </div>
            </div> 
        </div>
    </body>
</html>
