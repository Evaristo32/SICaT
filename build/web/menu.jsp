
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <style>
            .menu{
                display: block;
                background-color:  steelblue;
            }
            .AA{
                color: white;
            }
            .centralizarMenu{
              width: 85%;
              margin-right: auto;
              margin-left:  auto;
            }
        </style>


    </head>
    <body>
        <div class=" centralizarMenu">
            <nav class="menu" >

                <div class="container-fluid">
                    <!--
                                     Crud reunião -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">

                              <li class="dropdown ">
                                <a  class="dropdown-toggle AA " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Espaço Aluno</a>
                            </li>
                            
                            <li class="dropdown ">
                                <a  onClick="location.href = 'ListarReivindicacao'" class="dropdown-toggle AA " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Controlar Reivindicação</a>

                            </li>

                            <li class="dropdown">
                                <a onClick="location.href = 'ListarProntaParaAvaliar'" class="dropdown-toggle AA" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Avaliar Processo</a>
                            </li>          

                            <li class="dropdown">
                                <a onClick="location.href = 'Logoff'" class="dropdown-toggle AA" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sair</a>
                            </li>


                    </div>
                </div>

            </nav>

        </div>

    </body>
</html>
