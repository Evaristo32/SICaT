<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>SICaT</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
          


        <style>
            .confirmarFinalizacao{
                display: none;
            }
        </style>

        <script>
            function mostrarGridComRegistro(id)
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


        <c:if test="${msgSucesso != null}">
            <div class="container"  style="margin-top: 2%;" >
                <div class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong> ${msgSucesso}</strong> 
                </div>
            </div>
        </c:if>
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

                    <form action="FinalisarReivindicacao">
                        <div class="tituloDoInput"> 
                            <label for="nome">N° Reunião</label>
                        </div>
                        <div class="divInput" >
                            <input name="idReuniao"  type="text"  class="form-control" value="${reuniaoConcluida.idReuniao}" readonly="" style="width:25%;" />
                        </div>

                        <div class="tituloDoInput"> 
                            <label for="nome">Assunto</label>
                        </div>
                        <div class="divInput" >
                            <input name="assunto" type="text" id="assunto"  class="form-control" value="    ${reuniaoConcluida.assunto}" disabled="disabled" style="width:50%;" />
                        </div>
                        <div class="form-group">


                            <div class="tituloDoInput"> 
                                <label for="nome">Data</label>
                            </div>
                            <div class="divInput" >
                                <input name="data" type="text" id="data"  class="form-control" value="${reuniaoConcluida.data}" disabled="disabled" style="width:25%; " />
                            </div>

                            <div class="tituloDoInput"> 
                                <label for="nome">Hora</label>
                            </div>
                            <div class="divInput" >
                                <input name="hora" type="text" id="hora"  class="form-control" value="${reuniaoConcluida.hora}" disabled="disabled" style="width:25%;" />
                            </div>



                            <div class="tituloDoInput">
                                <label>
                                    Descrição</label></div>
                            <div class="divInput" >
                                <textarea  name="descricao"  id="descricao"   rows="4" cols="50" class="form-control" disabled="disabled" style="width:50%;">${reuniaoConcluida.descricao}</textarea>
                            </div>





                            <h4><label>Reivindicação Associadas</label></h4>
                            <div class="panel-body">

                                <table class="table table-responsive">  
                                    <tr><td><label>N°</label></td><td><label>Assunto</label></td><td><label>Status</label></td><td><label>Criada Por</label></td><td><label>Ações</label></td></tr>

                                    <c:forEach items="${reuniaoConcluida.reivindicacoes}" var="revivindicacao">
                                        <tr> 
                                            <td>${revivindicacao.idReivindicacao}</td>
                                            <td>${revivindicacao.assunto}</td>
                                            <td>${revivindicacao.status}</td>
                                            <td>${revivindicacao.usuario}</td>
                                            <td><input type="button"onClick="mostrarGridComRegistro('${revivindicacao.idReivindicacao}')" class="btn btn-success" value="Finalizar"></td>
                                        </tr>

                                        <tr class="confirmarFinalizacao" id="${revivindicacao.idReivindicacao}">


                                            <td>
                                            </td> <td><label>N° Reivindicação</label><br>
                                                <input name="idReivindicacao"  type="text"  class="form-control" value="${revivindicacao.idReivindicacao}" readonly="" style="width:25%;" /><br>

                                                <label>Resultado</label>
                                                <textarea  name="descricaoDaConfirmacao"  rows="4" cols="50" class="form-control" style="width:100%;"></textarea>
                                                <br><input type="submit" class="btn btn-warning" value="Confirma"></td><td></td><td></td><td></td>

                                        </tr>

                                    </c:forEach>

                                </table>

                            </div>





                            <div class="tituloDoInput"> 
                                <label for="nome">Status</label>
                            </div>
                            <div class="divInput" >
                                <input name="status" type="text" id="status"  class="form-control" value="${reuniaoConcluida.status}" disabled="disabled" style="width:25%;" />
                            </div>

                            <div class="tituloDoInput"> 
                                <label for="nome">Criada por</label>
                            </div>
                            <div class="divInput" >
                                <input name="usuario" type="text" id="usuario"  class="form-control"  value="${reuniaoConcluida.criadaPeloRepresentante}" disabled="disabled" style="width:25%;" />
                            </div>

                        </div>

                        <div class="botão">
                            <!--<input type="checkbox" onclick="AdicionarReivindicacao('DescricaoDaReprovacao')" value="Reprovar" >-->
                            <button class="btn btn-default" onclick="location.href = 'ListarReunioes'">Voltar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
