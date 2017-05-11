<%-- 
    Document   : exportaRelatorio
    Created on : 19/10/2016, 08:30:03
    Author     : Evaristo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt-br">
    <head>
        <title>SICaT</title>
      
         <meta contentType="text/html; charset=UTF-8">
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.js"></script>
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.js"></script>


        <script>

            function Imprimir(id) {
                window.print();

            }

//        </script>



    </head>
    <body>



        <%@include file="menuCoordenacao.jsp"%>





        <div class="container" id="relatorio" style="margin-top: 2%    ">


            <label><h1>Relatório De Controle</h1></label>

            <div class="panel-heading"><h3>Reivindicação</h3></div>
            <div class="panel-body">
                <table class="table table-bordered">
                    <tr class="active" >
                        <td><label>Criadas</label></td>
                        <td><label>Aberta</label></td>
                        <td><label>Aprovadas</label></td>
                        <td><label>Rejeitadas</label></td>
                        <td><label>Confirmada</label></td>
                        <td><label>Andamento</label></td>
                        <td><label>Pronta</label></td>
                        <td><label>Encerradas</label></td>
                        <td><label>Atrasadas</label></td>
                    </tr>
                    <td>${listasReivindicacaoFiltradasComQuantidade.getQuatidadeCriadas()}</td>
                    <td>${listasReivindicacaoFiltradasComQuantidade.getQuatidadeAbertas()}</td>
                    <td>${listasReivindicacaoFiltradasComQuantidade.getQuatidadeAprovadas()}</td>
                    <td>${listasReivindicacaoFiltradasComQuantidade.getQuatidadeRejeitadas()}</td>
                    <td>${listasReivindicacaoFiltradasComQuantidade.getQuatidadeConfirmadas()}</td>
                    <td>${listasReivindicacaoFiltradasComQuantidade.getQuatidadeAndamento()}</td>
                    <td>${listasReivindicacaoFiltradasComQuantidade.getQuatidadeProntas()}</td>
                    <td>${listasReivindicacaoFiltradasComQuantidade.getQuatidadeEncerradas()}</td>
                    <td>${listasReivindicacaoFiltradasComQuantidade.getQuatidadeAtrasadas()}</td>
                </table>
                <!--O Grafico de REIVINDICAÇÂO está montado aqui-->
                <canvas id="Reivindicacoes" width="1000" height="200"></canvas>
            </div>
            <div class="panel-heading"><h3>Avaliações De Qualidade</h3></div>
            <div class="panel-body">
                <table class="table table-bordered">
                    <tr class="active" >
                        <td><label>Realizadas</label></td>
                        <td><label>Muito ruim</label></td>
                        <td><label>Ruim</label></td>
                        <td><label>Neutro</label></td>
                        <td><label>Bom</label></td>
                        <td><label>Muito Bom</label></td>
                    </tr>
                    <td>${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getQuantidadeDeAvaliacaoDoProcessoRealizadas()}</td>
                    <td>${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getQuantidadeDeAvaliacaoDoProcessoMuitoRuim()}</td>
                    <td>${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getQuantidadeDeAvaliacaoDoProcessoMuitoRuim()}</td>
                    <td>${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getQuantidadeDeAvaliacaoDoProcessoNeutro()}</td>
                    <td>${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getQuantidadeDeAvaliacaoDoProcessoBom()}</td>
                    <td>${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getQuantidadeDeAvaliacaoDoProcessoMuitoBom()}</td>

                </table>
                <!--O Grafico de AVALIAÇÂODEQUALIDADE está montado aqui-->
                <canvas id="AvaliacoesDeQualidade" width="1000" height="200"></canvas>
            </div>
            <div class="panel-heading"><h3>Média de Aprovação</h3></div>
            <div class="panel-body">
                <table class="table table-bordered">
                    <tr class="active" >
                        <td><label>Representante</label></td>
                        <td><label>Coordenador</label></td>
                        <td><label>Alunos Satisfeitos</label></td>
                        <td><label>Alunos Insatisfeitos</label></td>
                    </tr>
                    <td>${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getMediaRepresentante()}</td>
                    <td>${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getMediaCoordenador()}</td>
                    <td>${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getAlunosSatisfeito()}</td>
                    <td>${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getAlunosInsatisfeito()}</td>

                </table>
                <!--Grafico Da Média de Aprovação-->
                <canvas id="MediaDeAprovacao" width="1000" height="200"></canvas>
                <br>
                <input type="button" class=" btn btn-default" onClick="Imprimir('relatorio')" value="Imprimir">
            </div>

        </div>




















        <script>
            var dataReivindicacao = {
                labels: ["Criadas", "Aberta", "Aprovadas", "Rejeitadas", "Confirmada", "Andamento", "Pronta", "Encerradas", "Atrasadas"],
                datasets: [{
                        label: "Reivindicação",
                        fillColor: "rgba(151,187,205,0.5)",
                        strokeColor: "rgba(151,187,205,0.8)",
                        highlightFill: "rgba(151,187,205,0.75)",
                        highlightStroke: "rgba(151,187,205,1)",
                        data: [
            ${listasReivindicacaoFiltradasComQuantidade.getQuatidadeCriadas()},
            ${listasReivindicacaoFiltradasComQuantidade.getQuatidadeAbertas()},
            ${listasReivindicacaoFiltradasComQuantidade.getQuatidadeAprovadas()},
            ${listasReivindicacaoFiltradasComQuantidade.getQuatidadeRejeitadas()},
            ${listasReivindicacaoFiltradasComQuantidade.getQuatidadeConfirmadas()},
            ${listasReivindicacaoFiltradasComQuantidade.getQuatidadeAndamento()},
            ${listasReivindicacaoFiltradasComQuantidade.getQuatidadeProntas()},
            ${listasReivindicacaoFiltradasComQuantidade.getQuatidadeEncerradas()},
            ${listasReivindicacaoFiltradasComQuantidade.getQuatidadeAtrasadas()}]
                    }]
            };

            var ctx = document.getElementById('Reivindicacoes').getContext('2d');
            var myReivindicacaoChart = new Chart(ctx).Bar(dataReivindicacao);

        </script>

        <script>
            var dataAvaliacao = {
                labels: ["Realizadas", "Muito Ruim", "Ruim", "Neutro", "Bom", "Muito Bom"],
                datasets: [{
                        label: "Reivindicação",
                        fillColor: "rgba(151,187,205,0.5)",
                        strokeColor: "rgba(151,187,205,0.8)",
                        highlightFill: "rgba(151,187,205,0.75)",
                        highlightStroke: "rgba(151,187,205,1)",
                        data: [
            ${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getQuantidadeDeAvaliacaoDoProcessoRealizadas()},
            ${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getQuantidadeDeAvaliacaoDoProcessoMuitoRuim()},
            ${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getQuantidadeDeAvaliacaoDoProcessoMuitoRuim()},
            ${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getQuantidadeDeAvaliacaoDoProcessoNeutro()},
            ${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getQuantidadeDeAvaliacaoDoProcessoBom()},
            ${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getQuantidadeDeAvaliacaoDoProcessoMuitoBom()}]
                    }]
            };

            var ctx = document.getElementById('AvaliacoesDeQualidade').getContext('2d');
            var myReivindicacaoChart = new Chart(ctx).Bar(dataAvaliacao);

        </script>


        <script>
            var dataMediaDeAprovacao = {
                labels: ["Representante", "Coordenador", "Alunos Satisfeitos", "Alunos Insatisfeitos"],
                datasets: [{
                        label: "Reivindicação",
                        fillColor: "rgba(151,187,205,0.5)",
                        strokeColor: "rgba(151,187,205,0.8)",
                        highlightFill: "rgba(151,187,205,0.75)",
                        highlightStroke: "rgba(151,187,205,1)",
                        data: [
            ${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getMediaRepresentante()},
            ${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getMediaCoordenador()},
            ${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getAlunosSatisfeito()},
            ${listarDeAvaliacaoDoPeriodoFiltradasComQuantidade.getAlunosInsatisfeito()}
                        ]
                    }]
            };

            var ctx = document.getElementById('MediaDeAprovacao').getContext('2d');
            var myReivindicacaoChart = new Chart(ctx).Bar(dataMediaDeAprovacao);

        </script>

    </body>
</html>
