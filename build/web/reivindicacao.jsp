<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="pt-br">
    <head>
        <meta contentType="text/html; charset=UTF-8">
        <title>Reuniao</title>
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
            


        <script>

            function validacao(reuniaoForm) {

                if (document.reuniaoForm.assunto.value == "" || document.reuniaoForm.assunto.value == " ") {
                    alert("O campo <Assunto> é de obrigatorio.");
                    document.reuniaoForm.assunto.focus();
                    return false;
                }

                if (document.reuniaoForm.descricao.value == "" || document.reuniaoForm.descricao.value == " ") {
                    alert("O campo <Descrição> é obrigatorio.");
                    document.reuniaoForm.descricao.focus();
                    return false;
                }
            }

            function submitFunction(i) {

//        Action de SALVA REIVINDICACAO
                if (i == 1) {
                    document.reuniaoForm.action = "http://localhost:8080/LayoutSicat/SalvarReivindicacao";
                    document.reuniaoForm.descricao.focus();
                    document.forms["reuniaoForm"].submit();
                }
            }





            function mostrarGridComRegistro(id)
            {
                if (document.getElementById(id).style.display == 'none') {
                    document.getElementById(id).style.display = 'block';
                } else {
                    document.getElementById(id).style.display = 'none';
                }

            }

        </script>

        <style>

            * {
                box-sizing: border-box;
            }
            .OcutarPesquisa{
                width: 900px;
                height: 20px;

                text-align: center;
                margin-left: auto;
                margin-right: auto;
            }

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
                width: 75%;
                height: 350px;

                margin-top: 20px;

                margin-bottom: 10px;
                margin-left: auto;
                margin-right: auto;

            }


            .gridAlteracao{ 
                width: 80%;
                height: 375px;
                display: none;
                margin-left: auto;
                margin-right: auto;
                margin-top: 20px;
                background-color:#fff;
            }
            .grid{
                width: 80%;
                height: 350px;
                text-align: center;
                margin-top: 20px;
                margin-bottom: 10px;
                margin-left: auto;
                margin-right: auto;
                background-color:#fff;


            }


            .selecionado{
                background-color: yellow;
            }
            .negrito{
                font-weight: bold;
            }

        </style>  


        <title></title>
    </head>
    <body>

        <script charset="UTF-8" src="demo_script_charset.js">
        </script>
        <%@include  file="menu.jsp" %>

        <!--Mensagem de alerta-->

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

        <c:if test="${msgExclusao != null}">
            <div class="container"  style="margin-top: 2%;" >
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong> ${msgExclusao}</strong> 
                </div>
            </div>
        </c:if>





        <div class="container" style="margin-top: 2%;"  >

            <div class="panel panel-primary">
                <div class="panel-heading ">
                    <label> Cadastro da Reinvidicação</label>
                </div>
                <div class="panel-body">
                    <form  action="SalvarReivindicacao" name="reuniaoForm">

                        <div class="tituloDoInput"> 
                            <label for="nome">N° Reivindicação</label>
                        </div>
                        <div class="divInput" >
                            <input  readonly="" type="number" name="idReivindicacao" value="${reivindicacaoParaAlterar.getIdReivindicacao()}"  class="form-control"  ng-required="true"  style="width:20%;" />
                        </div>

                        <div class="tituloDoInput"> 
                            <label for="nome">Assunto</label>
                        </div>
                        <div class="divInput" >
                            <input name="assunto" type="text" id="assunto" maxlength="50" value="${reivindicacaoParaAlterar.assunto}" class="form-control"style="width:100%;" />
                        </div>
                        <div class="form-group">
                            <div class="tituloDoInput">
                                <label>
                                    Descrição</label></div>
                            <div class="divInput" >
                                <textarea  name="descricao" maxlength="255" rows="4"  cols="50" class="form-control"  style="width:100%;" >${reivindicacaoParaAlterar.descricao}</textarea>

                            </div>                          
                        </div>
                        <div class="botão">
                            <input type="button" class="btn btn-default"  value ="Limpar" onclick="location.href = 'ListarReivindicacao'" >
                            <input class="btn btn-success"  type="submit" value="Gravar">

                        </div>
                    </form>
                </div>

            </div>


        </div>

        <div class="OcutarPesquisa" >
            <button class="btn btn-success" onClick="mostrarGridComRegistro('reivindicacoesCadatradas')"  >
                <span>Exibir Reivindicações</span></button>
        </div>
        <br>


        <!--Grid Das Reivindicações listadas para o usuario-->

        <div class="container" id="reivindicacoesCadatradas">

            <div class="panel panel-primary" >
                <div class="panel-heading ">
                    <label>  Reivindicações Cadastradas</label>
                </div>
                <div class="panel-body">
                    <table  class="table table-bordered"  >
                        <tr><td><label>N°</label></td><td><label>Assunto</label></td><td><label>Status</label></td><td><label>Data</label></td><td><label>Hora</label></td><td><label>Ações</label></td></tr>

                        <c:forEach var="reivindicacoes" items="${reivindicacoes}">
                            <tr>
                                <td>${reivindicacoes.getIdReivindicacao()}</td>
                                <td>${reivindicacoes.getAssunto()}</td>
                                <td>${reivindicacoes.getStatus()}</td>   
                                <td>${reivindicacoes.getData()}</td>
                                <td>${reivindicacoes.getHora()}</td>

                                <td>
                                    <button  onClick="location.href = 'AlterarReivindicacao?idReivindicacao=${reivindicacoes.getIdReivindicacao()}'" class="btn-warning">
                                        Editar</button>
                                    <button  onclick="location.href = 'VisualizarReivindicacao?idReivindicacao=${reivindicacoes.getIdReivindicacao()}'" class="btn-success">
                                        Visualizar</button> 
                                    <button  onclick="location.href = 'ExcluirReivindicacao?idReivindicacao=${reivindicacoes.getIdReivindicacao()}'"  class="btn-danger" aria-hidden="true">Excluir</button>
                                </td>
                            </tr> 
                        </c:forEach>
                    </table>

                </div>
            </div>
        </div>


    </body>
</html>
