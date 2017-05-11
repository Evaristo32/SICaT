package br.com.sicat.controler.ControlesDaReuniao.Reuniao;

import br.com.sicat.dao.DaoReivindicacao;
import br.com.sicat.dao.DaoReuniao;
import br.com.sicat.model.Reivindicacao;
import br.com.sicat.model.Reuniao;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.String.format;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SalvarReuniao extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        java.util.Date agora = new java.util.Date();
        Date data = null;
        Date hora = null;
        Date dataAtual = new Date();
       
//        Calendar dataLimite = Calendar.getInstance();
//            dataLimite.setTime(new java.util.Date());
//            dataLimite.add(Calendar.DAY_OF_MONTH, -1);//

        DaoReivindicacao daoReivindicacao = new DaoReivindicacao();
        DaoReuniao daoReuniao = new DaoReuniao();

        Reuniao reuniao = new Reuniao();

        String idsSelecionados[] = request.getParameterValues("selectRivindicacao");

        if (idsSelecionados != null) {

            List<Long> ids = new ArrayList<Long>();
            for (String id : idsSelecionados) {
                ids.add(Long.parseLong(id));
            }

            List<Reivindicacao> reivindicacaoesParaSalvarReuniao = daoReivindicacao.findByIds(ids);

            reuniao.setAssunto(request.getParameter("assunto"));
            reuniao.setDescricao(request.getParameter("descricao"));
            reuniao.setStatus("Aguardando Confirmação");
            reuniao.setCriadaPeloRepresentante(request.getUserPrincipal().toString());

            String dataTexto = request.getParameter("data");
            String horaTexto = request.getParameter("hora");
            

            String msgCondicao = VerificarData(dataAtual, data, hora, dataTexto, horaTexto);
            if (msgCondicao.equals("")) {

                DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

                try {
                    data = formatter.parse(dataTexto);

                } catch (ParseException ex) {
                    Logger.getLogger(SalvarReuniao.class.getName()).log(Level.SEVERE, null, ex);
                }

                DateFormat formatter1 = new SimpleDateFormat("HH:mm");
                try {
//                    Date horaParaSalvar = ;
                    reuniao.setHora(formatter1.parse(request.getParameter("hora")+":00"));
                    System.out.println("Esse deu certo ##############################################  DEu certo " + hora);

                } catch (ParseException ex) {
                    Logger.getLogger(SalvarReuniao.class.getName()).log(Level.SEVERE, null, ex);
                }

                if (data.before(dataAtual)) {
                    String msgAlerta = "Data de realização da reunião não pode ser menor que a data atual.";
                    request.setAttribute("msgAlerta", msgAlerta);
                } else if (reuniao.getAssunto() == null || reuniao.getAssunto().trim().equals("")) {
                    String msgAlerta = "Campo assunto é obrigatório.";
                    request.setAttribute("msgAlerta", msgAlerta);
                } else if (reuniao.getDescricao() == null
                        || reuniao.getDescricao().trim().equals("")) {
                    String msgAlerta = "Campo descrição é obrigatório.";
                    request.setAttribute("msgAlerta", msgAlerta);
                } else {

                    reuniao.setData(data);
                 
                   

                    reuniao.setReivindicacoes(reivindicacaoesParaSalvarReuniao);

                    String status = "Andamento";
                    for (Reivindicacao r : reivindicacaoesParaSalvarReuniao) {

                        Reivindicacao reivindicacao = (Reivindicacao) daoReivindicacao.BuscarPorId(Reivindicacao.class, r.getIdReivindicacao());
                        reivindicacao.setStatus(status);
                        daoReivindicacao.AlterarReuniao(reivindicacao);

                    }

                   
                   daoReuniao.SalvarReuniao(reuniao);
                    System.out.println("########################################### Hora " + reuniao.getHora());
                    String msgSucesso = "Reunião cadastrada com sucesso.";
                    request.setAttribute("msgSucesso", msgSucesso);

                }
            } else {
                String msgAlerta = msgCondicao;
                request.setAttribute("msgAlerta", msgAlerta);
            }

        } else {
            String msgAlerta = "Para criar uma reunião é necessario selecionar no minimo uma reivindicação.";
            request.setAttribute("msgAlerta", msgAlerta);
        }

        List<Reivindicacao> reivindicacoesAbertas = daoReivindicacao.findByStatus("Aberta");
        List<Reivindicacao> reivindicacoesAprovadas = daoReivindicacao.findByStatus("Aprovada");
        List<Reivindicacao> reivindicacoesConfirmada = daoReivindicacao.findByStatus("Confirmada");

        request.setAttribute("reivindicacoesAbertas", reivindicacoesAbertas);
        request.setAttribute("reivindicacoesAprovadas", reivindicacoesAprovadas);
        request.setAttribute("reivindicacoesConfirmada", reivindicacoesConfirmada);
        RequestDispatcher dispatcher = request.getRequestDispatcher("analizarReivindicacao.jsp");
        dispatcher.forward(request, response);

    }

    private String VerificarData(Date dataAtual, Date dataAgendada, Date hora, String dataTexto, String horaTexto) {

        String msgAlerta = "";

        if (dataTexto.equals("") || dataTexto == null) {
            msgAlerta = "O campo data é de preenchimento obrigatoro.";
        } else if (horaTexto.equals("") || horaTexto == null) {
            msgAlerta = "O campo hora é de preenchimento obrigatoro.";
        }

        return msgAlerta;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
