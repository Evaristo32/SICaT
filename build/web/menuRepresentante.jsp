<%-- 
    Document   : menuRepresentante
    Created on : 20/09/2016, 10:23:06
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

                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">

                             <li class="dropdown ">
                                <a  class="dropdown-toggle AA " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Espaço Representante</a>
                            </li>
                            
                            <li class="dropdown ">
                                <a  onClick="location.href = 'ListarReivindicacaoRepresentante'" class="dropdown-toggle AA " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Analisar Reivindicação</a>
                            </li>

                            <li class="dropdown ">
                                <a  onClick="location.href = 'ListarReunioes'" class="dropdown-toggle AA " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Controlar Reunião</a>
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
