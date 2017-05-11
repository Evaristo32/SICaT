<%-- 
    Document   : montarRelatorio
    Created on : 18/10/2016, 17:58:25
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

        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"></h3>
                </div>
                <div class="panel-body">
                     <table class="table table-responsive">
                        <tr><td>Criadas</td><td>
                            Com status Bom</td></tr>
                        <td>${numeroDeReivindicacaoCriadas}</td>
                        <td>${numAvaliacaoStatusBom}</td>
                    </table>
                   
                </div>
            </div>
        </div>
    </body>
</html>
