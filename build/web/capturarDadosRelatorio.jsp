<%-- 
    Document   : capturarDadosRelatorio.jsp
    Created on : 06/10/2016, 21:16:07
    Author     : Evaristo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt-br">
    <head>
         <title>SICaT</title>
       
         <meta contentType="text/html; charset=UTF-8">
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
         

        <style>
            .titulos{
                width: 100%;
            }
            .inputs{
                width: 100%;
            }
            .margim{
                /*                border-style: solid;
                                border-width: 2px;
                               color:  steelblue;*/


            }


        </style>







    </head>
    <body>

        <%@include  file="menu.jsp" %>

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

        <c:if test="${msgErro != null}">
            <div class="container"  style="margin-top: 2%;" >
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong> ${msgErro}</strong> 
                </div>
            </div>
        </c:if>


        <div class="container">



            <div class="panel panel-primary" style="margin-top: 2%">


                <div class="panel-heading">
                    <h3 class="panel-title">Avaliação De Processos</h3>
                </div>
                <div class="panel-body">
                    <form action="SalvarAvaliacaoDaReivindicacao">


                        <label for="nome">N° Reivindicação</label>
                        <input name="idReivindicacao" type="text" class="form-control" value="${reivindicacaoParaAvaliar.idReivindicacao}" readonly="" style="width:10%;" />

                        <br>  

                        <table class="table table-responsive">  


                            <!--//======================================================================================================-->

                            <br>   
                            <tr class="success">
                                <td class="success">
                                    <div class="titulos">
                                        Sua reivindicação foi avaliada dentro do prazo?
                                    </div>
                                </td> 
                            </tr>
                            <tr>
                                <td class="success">
                                    <div class="inputs">

                                        <input type="radio" name="avaliadacaoDoPrazo" value="1"> Sim      <input type="radio" name="avaliadacaoDoPrazo" value="0"> Não

                                    </div>
                                </td> 
                            </tr>


                            <!--=============================================================================-->

                            <tr class="success">
                                <td class="success">
                                    <div class="titulos">
                                        Qual sua nota em relação ao atendimento do representante?
                                    </div>
                                </td> 

                            </tr>
                            <tr>
                                <td class="success">
                                    <div class="inputs">
                                        <input type="radio" name="atendimentoDoRepresentante" value="1"> 1  
                                        <input type="radio" name="atendimentoDoRepresentante" value="2"> 2  
                                        <input type="radio" name="atendimentoDoRepresentante" value="3"> 3  
                                        <input type="radio" name="atendimentoDoRepresentante" value="4"> 4  
                                        <input type="radio" name="atendimentoDoRepresentante" value="5"> 5  
                                        <input type="radio" name="atendimentoDoRepresentante" value="6"> 6  
                                        <input type="radio" name="atendimentoDoRepresentante" value="7"> 7   
                                        <input type="radio" name="atendimentoDoRepresentante" value="8"> 8  
                                        <input type="radio" name="atendimentoDoRepresentante" value="9"> 9  
                                        <input type="radio" name="atendimentoDoRepresentante" value="10"> 10   
                                    </div>
                                </td>
                            </tr>

                            <!--=============================================================================================-->

                            <tr class="success">
                                <td class="success">
                                    <div class="titulos">
                                        Qual sua nota em relação  ao atendimento do coordenador?
                                    </div>
                                </td> 

                            </tr>
                            <tr>
                                <td class="success">
                                    <div class="inputs">
                                        <input type="radio" name="atendimentoDoCoordenador" value="1"> 1  
                                        <input type="radio" name="atendimentoDoCoordenador" value="2"> 2  
                                        <input type="radio" name="atendimentoDoCoordenador" value="3"> 3  
                                        <input type="radio" name="atendimentoDoCoordenador" value="4"> 4  
                                        <input type="radio" name="atendimentoDoCoordenador" value="5"> 5  
                                        <input type="radio" name="atendimentoDoCoordenador" value="6"> 6  
                                        <input type="radio" name="atendimentoDoCoordenador" value="7"> 7   
                                        <input type="radio" name="atendimentoDoCoordenador" value="8"> 8  
                                        <input type="radio" name="atendimentoDoCoordenador" value="9"> 9  
                                        <input type="radio" name="atendimentoDoCoordenador" value="10"> 10  
                                    </div>
                                </td>
                            </tr>

                            <!--=============================================================================================-->

                            <tr class="success">
                                <td class="success">
                                    <div class="titulos">
                                        Está satisfeito com o resultado da avaliação da sua reivindicação?
                                    </div>
                                </td> 

                            </tr>
                            <tr>
                                <td class="success">
                                    <div class="inputs">
                                        <input type="radio" name="satisfeito" value="1"> Sim   <input type="radio" name="satisfeito" value="0"> Não
                                    </div>
                                </td>
                            </tr>

                            <!--=============================================================================================-->

                            <tr class="success">
                                <td class="success">
                                    <div class="titulos">
                                        Possui alguma sugestão para nos oferecer?
                                    </div>
                                </td> 

                            </tr>
                            <tr>
                                <td class="success">
                                    <div class="inputs">
                                        <!--                                        <textarea  name="sugestãoOferecida" maxlength="255" rows="4"  cols="50" class="form-control"  style="width:100%;" ></textarea>-->
                                        <textarea  name="descricao" maxlength="255" rows="4"  cols="50" class="form-control"  style="width:100%;" ></textarea>
                                    </div>
                                </td>
                            </tr>

                        </table>    

                        <div class="inputs">
                            <input type="button" class="btn btn-default"  value ="Voltar" onclick="location.href = 'ListarProntaParaAvaliar'" >
                            <input class="btn btn-success" type="submit" value="Enviar">

                        </div>

                    </form>

                </div>
            </div>
        </div>

    </body>
</html>
