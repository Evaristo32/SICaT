<%-- 
    Document   : menuCoordenacao
    Created on : 20/09/2016, 10:40:06
    Author     : Evaristo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <style>
            .menu{
                display: block;
                background-color:  steelblue;
            }
            .AA{
                color: white;
            }
            .centralizarMenu{
                width: 84%;
                margin-right: auto;
                margin-left:  auto;
            }
            .espaco{
                color: white;
                
            }
        </style>
    </head>
    <body>



        <div class=" centralizarMenu">
            <nav class="menu" >



                <div class="container-fluid">




                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">

                            <li class="dropdown ">
                                <a  class="dropdown-toggle AA " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Espaço Coordenador</a>
                            </li>
                            
                            <li class="dropdown ">
                                <a  onClick="location.href = 'ListarReuniaoCordenador'" class="dropdown-toggle AA " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Controle de Reunião</a>
                            </li>

                            <li class="dropdown ">
                                <a  onClick="location.href = 'ListarReivindicacaoCoordenador'" class="dropdown-toggle AA " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Analisar Reivindicação</a>
                            </li>

                            <li class="dropdown ">
                                <a  onClick="location.href = 'ListarAvaliacoesRealizadas'" class="dropdown-toggle AA " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Avaliações</a>
                            </li>

                            <li class="dropdown ">
                                <a  onClick="location.href = 'gerarRelatorio.jsp'" class="dropdown-toggle AA " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Relatório</a>
                            </li>
                            
                            <li class="dropdown">
                                <a onClick="location.href = 'Logoff'" class="dropdown-toggle AA" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sair</a>
                            </li>
                          

                        </ul>
                    </div>
                </div>

            </nav>

        </div>


    </body>
</html>
