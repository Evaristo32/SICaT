
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reuniao</title>
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
    </head>
    <body>
        <%@include  file="menuRepresentante.jsp" %>
        <div class="container" style="margin-top: 2%;">

            <div class="panel panel-primary ">
                <div class="panel-heading">
                    Visualiza��o Da Reuni�o</div>
                <div class="panel-body">

                    <div class="tituloDoInput"> 
                        <label for="nome">N� Reuni�o</label>
                    </div>
                    <div class="divInput" >
                        <input name="assunto" type="text" name="idReivindicacao"  class="form-control" value="${reuniaoRecusada.idReuniao}" readonly="" style="width:25%;" />
                    </div>

                    <div class="tituloDoInput"> 
                        <label for="nome">Assunto</label>
                    </div>
                    <div class="divInput" >
                        <input name="assunto" type="text" id="assunto"  class="form-control" value="    ${reuniaoRecusada.assunto}" disabled="disabled" style="width:100%;" />
                    </div>
                    <div class="form-group">


                        <div class="tituloDoInput"> 
                            <label for="nome">Data</label>
                        </div>
                        <div class="divInput" >
                            <input name="data" type="text" id="data"  class="form-control" value="${reuniaoRecusada.data}" disabled="disabled" style="width:25%; " />
                        </div>

                        <div class="tituloDoInput"> 
                            <label for="nome">Hora</label>
                        </div>
                        <div class="divInput" >
                            <input name="hora" type="text" id="hora"  class="form-control" value="${reuniaoRecusada.hora}" disabled="disabled" style="width:25%;" />
                        </div>



                        <div class="tituloDoInput">
                            <label>
                                Descri��o</label></div>
                        <div class="divInput" >
                            <textarea  name="descricao"  id="descricao"   rows="4" cols="50" class="form-control" disabled="disabled" style="width:100%;">
                                ${reuniaoRecusada.descricao}
                            </textarea>
                        </div>



                        <div class="tituloDoInput"> 
                            <label for="nome">Status</label>
                        </div>
                        <div class="divInput" >
                            <input name="status" type="text" id="status"  class="form-control" value="${reuniaoRecusada.status}" disabled="disabled" style="width:100%;" />
                        </div>

                        <div class="tituloDoInput"> 
                            <label for="nome">Criada por</label>
                        </div>
                        <div class="divInput" >
                            <input name="usuario" type="text" id="usuario"  class="form-control"  value="${reuniaoRecusada.usuario}" disabled="disabled" style="width:100%;" />
                        </div>

                    </div>

                    <div class="bot�o">
                        <!--<input type="checkbox" onclick="AdicionarReivindicacao('DescricaoDaReprovacao')" value="Reprovar" >-->
                        <button class="btn btn-default" onclick="location.href = 'ListarReunioes'">Voltar</button>
                    </div>

                </div>
            </div> 
        </div>
    </body>
</html>
