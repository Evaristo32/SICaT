<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
         <title>SICaT</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
            
    </head>
    <body>
        <%@include  file="menuRepresentante.jsp" %>

        <div class="container" style="margin-top: 2%;">

            <div class="panel panel-primary ">
                <div class="panel-heading">
                    Visualização Da Reunião</div>
                <div class="panel-body">

                    <div class="tituloDoInput"> 
                        <label for="nome">N° Reunião</label>
                    </div>
                    <div class="divInput" >
                        <input type="text" name="idReivindicacao"  class="form-control" value="${reuniaoParavisualizar.idReuniao}" readonly="" style="width:10%;" />
                    </div>

                    <div class="tituloDoInput"> 
                        <label for="nome">Assunto</label>
                    </div>
                    <div class="divInput" >
                        <input name="assunto" type="text" id="assunto"  class="form-control" value="    ${reuniaoParavisualizar.assunto}" disabled="disabled" style="width:50%;" />
                    </div>
                    <div class="form-group">


                        <div class="tituloDoInput"> 
                            <label for="nome">Data</label>
                        </div>
                        <div class="divInput" >
                            <input name="data" type="text" id="data"  class="form-control" value="${reuniaoParavisualizar.data}" disabled="disabled" style="width:25%; " />
                        </div>

                        <div class="tituloDoInput"> 
                            <label for="nome">Hora</label>
                        </div>
                        <div class="divInput" >
                            <input name="hora" type="text" id="hora"  class="form-control" value="${reuniaoParavisualizar.hora}" disabled="disabled" style="width:25%;" />
                        </div>



                        <div class="tituloDoInput">
                            <label>
                                Descrição</label></div>
                        <div class="divInput" >
                            <textarea  name="descricao"  id="descricao"   rows="4" cols="50" class="form-control" disabled="disabled" style="width:50%;">${reuniaoParavisualizar.descricao}</textarea>
                        </div>

                        <div class="tituloDoInput"> 
                            <label for="nome">Status</label>
                        </div>
                        <div class="divInput" >
                            <input name="status" type="text" id="status"  class="form-control" value="${reuniaoParavisualizar.status}" disabled="disabled" style="width:25%;" />
                        </div>

                        <div style="float:left">
                            <div class="tituloDoInput"> 
                                <label for="nome">Confirmada ou Recusada</label>
                            </div>
                            <div class="divInput" >
                                <input  type="text" id="usuario"  class="form-control"  value="${reuniaoParavisualizar.confirmadaPeloCoordenador}${reuniaoParavisualizar.getRejeitadaPeloUsuario()}" disabled="disabled" style="width:90%;" />
                            </div>
                        </div> 

                        <div class="tituloDoInput"> 
                            <label for="nome">Criada por</label>
                        </div>
                        <div class="divInput" >
                            <input  type="text" id="usuario"  class="form-control"  value="${reuniaoParavisualizar.criadaPeloRepresentante}" disabled="disabled" style="width:25%;" />
                        </div>

                    </div>

                    <div class="tituloDoInput">
                        <label>
                            Recusada pelo motivo</label></div>
                    <div class="divInput" >
                        <textarea  name="descricao"  id="descricao"   rows="4" cols="50" class="form-control" disabled="disabled" style="width:50%;">${reuniaoParavisualizar.getDescricaoDaRejeicao()}</textarea>
                    </div>
                    <br>
                    <div class="botão">
                        <!--<input type="checkbox" onclick="AdicionarReivindicacao('DescricaoDaReprovacao')" value="Reprovar" >-->
                        <button class="btn btn-default" onclick="location.href = 'ListarReuniaoCordenador'">Voltar</button>
                    </div>

                </div>
            </div> 
        </div>


    </body>
</html>
