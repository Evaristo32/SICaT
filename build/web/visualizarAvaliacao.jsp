<%-- 
    Document   : visualizarAvaliacao
    Created on : 11/10/2016, 11:14:40
    Author     : Evaristo
--%>

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
        <%@include  file="menuCoordenacao.jsp" %>

        <div class="container" style="margin-top: 2%;">

            <div class="panel panel-primary ">
                <div class="panel-heading">
                    Visualização Da Avaliação</div>
                <div class="panel-body">

                    <div style="float:left">
                        <div class="tituloDoInput"> 
                            <label for="nome">N° Avaliação</label>
                        </div>
                        <div class="divInput" >
                            <input name="assunto" type="text" name="idReivindicacao"  class="form-control" value="${avaliacaoDoProcesso.idAvaliacaoDoProcesso}" readonly="" style="width:50%;" />
                        </div>
                    </div>

                    <div style=" ">
                        <div class="tituloDoInput"> 
                            <label for="nome">Assunto</label>
                        </div>
                        <div class="divInput" >
                            <input name="assunto" type="text" id="assunto"  class="form-control" value="    ${avaliacaoDoProcesso.getReivindicacao().getAssunto()}" disabled="disabled" style="width:33%;" />
                        </div>

                    </div>

                    <!--<div class="form-group">-->
                    <div style="float:left">
                        <div class="tituloDoInput"> 
                            <label for="nome">Data Da Avaliação</label>
                        </div>
                        <div class="divInput" >
                            <input name="data" type="text" id="data"  class="form-control" value="${avaliacaoDoProcesso.data}" disabled="disabled" style="width:60%; " />
                        </div>
                    </div>
                    <div class="tituloDoInput"> 
                        <label for="nome">Hora Da Avaliação</label>
                    </div>
                    <div class="divInput" >
                        <input name="hora" type="text" id="hora"  class="form-control" value="${avaliacaoDoProcesso.hora}" disabled="disabled" style="width:10%;" />
                    </div>



                    <div class="tituloDoInput">
                        <label>
                            Sujestão Oferecida</label></div>
                    <div class="divInput" >
                        <textarea  name="descricao"  id="descricao"   rows="4" cols="50" class="form-control" disabled="disabled" style="width:50%;">${avaliacaoDoProcesso.getDescricaoSugestãoOferecida()}</textarea>
                    </div>


                    <div style="float:left">
                        <div class="tituloDoInput"> 
                            <label for="nome">Status Da Avaliação</label>
                        </div>
                        <div class="divInput" >
                            <input name="status" type="text" id="status"  class="form-control" value="${avaliacaoDoProcesso.status}" disabled="disabled" style="width:70%;" />
                        </div>
                    </div>
                    <div class="tituloDoInput"> 
                        <label for="nome">Avaliada por</label>
                    </div>
                    <div class="divInput" >
                        <input name="usuario" type="text" id="usuario"  class="form-control"  value="${avaliacaoDoProcesso.usuario}" disabled="disabled" style="width:20%;" />
                    </div>

                    <!--</div>-->
                    <br>
                    <div class="botão">
                        <!--<input type="checkbox" onclick="AdicionarReivindicacao('DescricaoDaReprovacao')" value="Reprovar" >-->
                        <button class="btn btn-default" onclick="location.href = 'ListarAvaliacoesRealizadas'">Voltar</button>
                        <!--<button class="btn btn-primary" onclick="location.href = 'ListarAvaliacoesRealizadas'">Gerar Relatorio</button>-->
                    </div>

                </div>
            </div> 
        </div>

    </body>
</html>
