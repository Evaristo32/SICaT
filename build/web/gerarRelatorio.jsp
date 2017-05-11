<%-- 
    Document   : gerarRelatorio
    Created on : 18/10/2016, 10:49:09
    Author     : Evaristo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>SICaT</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
       

    </head>
    <body>

        <%@include file="menuCoordenacao.jsp"%>


        <c:if test="${msgAlerta != null}">
            <div class="container"  style="margin-top: 2%;" >
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong> ${msgAlerta}</strong> 
                </div>
            </div>
        </c:if>
        <div class="container" style="width: 40%; margin-top: 2%">


            <div class="panel panel-primary" >


                <div class="panel-heading">
                    <h3 class="panel-title">Gerar Relatório</h3>
                </div>
                <div class="panel-body">
                    <form action="ListarPorData">
                        <div style="width: 40%; float:right"> <label>
                                Data Final  
                            </label>
                            <input type="date" class="form-control" name="dataFinal" >
                        </div>

                        <div style="width: 40%">
                            <label>
                                Data Inicial
                            </label>
                            <input type="date" class="form-control" name="dataInicial">
                        </div>
                        <br>
                        <input class="btn btn-success" type="submit" value="Gerar Relatório">
                    </form>

                </div>
            </div>
        </div>



    </body>
</html>
