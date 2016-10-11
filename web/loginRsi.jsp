<%-- 
    Document   : loginRsi
    Created on : 05/10/2016, 08:26:28
    Author     : Evaristo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>Reuniao</title>
        <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>


        <script type="text/javascript">
<!--
            //se a sessão expirar, o script abaixo
            //evita que a página se abra em um iframe
            if (window.parent != document.parentWindow) {
                window.parent.navigate(document.location);
            }
-->
        </script>

        <style>

            .ip{
                margin-right:auto;
            }
            .PA{
                /*                margin-bottom: auto;*/
                margin-top: 5%;
                margin-left: auto;
                margin-right: auto;
                width: 30%;

            }
            .Inpu{
                float: left;
                width: 50%;
                margin-left: 4px;
                margin-top:  20px;
            }
            .Campos{
                float: left; width: 50%; margin-left: 4px;
            }
            .Texto{
                float: left; width: 50%; margin-left: 4px;
            }
            .hi{
                align-text:center;
            }
        </style>

    </head>
    <body>


        <div class="container PA">


            <div class="panel-footer">
                <div class="panel-body ">


                    <img src="http://pft.rsinet.com.br/themes/default/media/logo.gif" />

                    <h1 class="hi">Portal da Fábrica de Testes RSI</h1> 
                    <form id="frmLogin" name="frmLogin" action="login.asp?lang=BR" method="post">  
                        <fieldset>      
                            <legend>Login</legend>   
                            <div class="Texto">
                                <label for="txtLogin">Usuário:</label>     
                            </div>
                            <div class="Campos">
                                <input type="text" id="txtLogin" name="txtLogin" value="" class="form-control"/>  
                            </div>

                            <div class="Texto">
                                <label for="txtSenha">Senha:</label>  
                            </div>
                            <div class="Campos">
                                <input type="password" id="txtSenha" name="txtSenha" class="form-control"/>     
                            </div>
                            <div class="Inpu">
                                <button type="submit" class="btn btn-default">Entrar</button>    
                                <button type="reset" class="btn btn-default">Limpar</button>   
                            </div>

                        </fieldset>  
                        <fieldset>
                            <legend>Idioma</legend>
                            <a href=?lang=en>English</a> <a href=?lang=jp>&#26085;&#26412;&#35486;</a>
                        </fieldset>              
                    </form>
                </div>
                
            </div>
              <div class="ip">
                    Seu IP é: 177.5.220.50
                </div>

        </div>



    </pre>
    <script type="text/javascript">
            <!--
    document.getElementById('txtLogin').focus();
-->
    </script>
</body>
</html>
