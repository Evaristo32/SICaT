<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reuniao</title>
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

            .botão{
                float: left;
                width: 50%;
                margin-left: 4px;
                margin-top:  20px;

            }
            .cadastroReividicacao{
                width: 80%;
                height: 350px;
                text-align: center;
                margin-top: 20px;

                margin-bottom: 10px;
                margin-left: auto;
                margin-right: auto;
                background-color:#dff0d8;
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
                    Visualização</div>
                <div class="panel-body">   

                    <form action="IncluirStatusReprovada" name="reuniaoForm">

                        <div class="tituloDoInput"> 
                            <label for="nome">N° Reivindicação</label>
                        </div>
                        <div class="divInput" >
                            <input readonly="" type="text" name="idReivindicacao"  class="form-control" value="${reivindicacao.idReivindicacao}"  style="width:25%;" />
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
                        <div class="botão">
                            <input type="checkbox" onclick="AdicionarReivindicacao('DescricaoDaReprovacao')" value="Reprovar" > Rejeitar Reivindicação

                        </div>
                        <div class="">

                            <div  id="DescricaoDaReprovacao" style="display: none;">

                                <div class="panel-body">

                                    <div class="tituloDoInput">
                                        <label>
                                            Descrição Da Rejeição</label></div>
                                    <div class="divInput" >
                                        <textarea  name="descricaoDaRejeicao"  rows="4" cols="50" class="form-control"></textarea>
                                    </div>
                                    <div class="botão">
                                        <button type="submit"  class="btn btn-danger">Reprovar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="botão">

                        <button class="btn btn-default" onclick="location.href = 'ListarReivindicacaoRepresentante'">Voltar</button>

                        <button onclick="location.href = 'IncluirStatusAprovado?idReivindicacao=${reivindicacao.idReivindicacao}'" class="btn btn-success">Aprovar</button>
                    </div>






                </div>

            </div>

        </div>


    </div>



    <!--        <div class="container" style="margin-top: 2%;">
    
                <div class="panel panel-primary ">
                    <div class="panel-heading">
                        Detalhamento</div>
                    <div class="panel-body">              
    
                        <div class="tituloDoInput"> 
                            <label for="nome">N° Reivindicação</label>
                        </div>
                        <div class="divInput" >
                            <input name="assunto" type="text" name="idReivindicacao"  class="form-control" value="${reivindicacao.idReivindicacao}" readonly="" style="width:25%;" />
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
    
                        <div class="botão">
                            <input type="checkbox" onclick="AdicionarReivindicacao('DescricaoDaReprovacao')" value="Reprovar" >
                            <button class="btn btn-default" onclick="location.href = 'ListarReivindicacaoRepresentante'">Voltar</button>
                            <button onClick="AdicionarReivindicacao('DescricaoDaReprovacao')" class="btn btn-danger" >Reprovar</button>
                            <button onclick="location.href = 'IncluirStatusAprovado?idReivindicacao=${reivindicacao.idReivindicacao}'" class="btn btn-success">Aprovar</button>
                        </div>
    
    
    
    
    
    
                        <div  id="DescricaoDaReprovacao" style="display: none;">
    
                            <div class="panel-body">
    
                                <div class="tituloDoInput">
                                    <label>
                                        Descrição Da Rejeição</label></div>
                                <div class="divInput" >
                                    <textarea  name="descricaoDaRejeicao"  id="descricao"   rows="4" cols="50" class="form-control"></textarea>
                                </div>
                                <div class="botão">
                                    <button type="submit"  class="btn btn-danger">Confirma Reprovação</button>
                                </div> 
                            </div>
                        </div>
    
                    </div>
                </div> 
            </div>-->

  <c:if test="${MSGAlert != null}">
                <div class="container"  style="margin-top: 2%;">
                    <div class="alert alert-warning alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong> ${MSGAlert}</strong> 
                    </div>
                </div>
            </c:if>
</body>
</html>
