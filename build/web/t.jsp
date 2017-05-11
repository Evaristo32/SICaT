
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
        <title>JSP Page</title>
    </head>
    <body>


        <form action="ConcluirAlteracaoReivindicacao"   class="col-xs-12 col-sm-4 col-md-3">

            <label>IdReuniao</label><br>
            <input type="text" name="idReivindicacao" class="form-control" value="${reivindicacao.idReivindicacao}"><br>
            <label>Assunto</label><br>
            <input type="text" name="assunto" class="form-control" value="${reivindicacao.assunto}"><br>
            <label>Descrição</label><br>
            <textarea name="descricao" class="form-control" rows="4" cols="50">
                ${reivindicacao.descricao}
            </textarea><br>
            <label>Date</label><br>
            <input type="date" name="data" class="form-control" value="${reivindicacao.data}"></input><br>
            <label>hora</label><br>
            <input type="time" name="hora" class="form-control" value="${reivindicacao.hora}"><br><br>


            <button type="button" onClick="location.href = 'Reivindicacao.jsp'" class="btn btn-default">Cancelar</button>
            <button type="submit"   class="btn btn-success">Salvar</button>

        </form>
    </body>
</html>
