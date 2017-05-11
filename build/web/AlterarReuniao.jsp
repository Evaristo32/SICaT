<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="pt-br">
    <head>
        <title>SICaT</title>
    
         <meta contentType="text/html; charset=UTF-8">
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
          

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
                    Alterar Reunião</div>
                <div class="panel-body">
                    <form action="ConcluirAlteracaoRepresentante">
                        <div class="tituloDoInput"> 
                            <label for="nome">N° Reunião</label>
                        </div>
                        <div class="divInput" >
                            <input name="idReuniao" type="text"  class="form-control" value="${reuniaoRecusada.idReuniao}" readonly="" style="width:10%;" />
                        </div>

                        <div class="tituloDoInput"> 
                            <label for="nome">Assunto</label>
                        </div>
                        <div class="divInput" >
                            <input name="assunto" type="text" id="assunto"  class="form-control" value="    ${reuniaoRecusada.assunto}" disabled="disabled" style="width:50%;" />
                        </div>
                        <div class="form-group">


                            <div class="tituloDoInput"> 
                                <label for="nome">Data</label>
                            </div>
                            <div class="divInput" >
                                <input name="data" type="date" id="data"  class="form-control" value="${reuniaoRecusada.data}"  style="width:15%; " />
                            </div>

                            <div class="tituloDoInput"> 
                                <label for="nome">Hora</label>
                            </div>
                            <div class="divInput" >
                                <input name="hora" type="time" id="hora"  class="form-control" value="${reuniaoRecusada.hora}" style="width:15%;" />
                            </div>



                            <div class="tituloDoInput">
                                <label>
                                    Descriçã</label></div>
                            <div class="divInput" >
                                <textarea  name="descricao"  id="descricao"   rows="4" cols="50" class="form-control" disabled="disabled" style="width:50%;">${reuniaoRecusada.descricao}</textarea>
                            </div>



                            <div class="tituloDoInput"> 
                                <label for="nome">Status</label>
                            </div>
                            <div class="divInput" >
                                <input name="status" type="text" id="status"  class="form-control" value="${reuniaoRecusada.status}" disabled="disabled" style="width:20%;" />
                            </div>

                            <div class="tituloDoInput"> 
                                <label for="nome">Criada por</label>
                            </div>
                            <div class="divInput" >
                                <input name="usuario" type="text" id="usuario"  class="form-control"  value="${reuniaoRecusada.criadaPeloRepresentante}" disabled="disabled" style="width:20%;" />
                            </div>

                        </div>



                        <div class="tituloDoInput">
                            <label>
                                Recusada pelo motivo</label></div>
                        <div class="divInput" >
                            <textarea  name="descricao"  id="descricao"   rows="4" cols="50" class="form-control" disabled="disabled" style="width:50%;">${reuniaoRecusada.getDescricaoDaRejeicao()}</textarea>
                        </div>
                        <br>
                        <div class="botão">
                            <input class="btn btn-warning" type="submit" value="Gravar">

                        </div>
                    </form>
                    <br>
                    <div class="botão">
                        <!--<input type="checkbox" onclick="AdicionarReivindicacao('DescricaoDaReprovacao')" value="Reprovar" >-->
                        <button class="btn btn-default" onclick="location.href = 'ListarReunioes'">Voltar</button>
                    </div>

                </div>
            </div> 
        </div>
    </body>
</html>
