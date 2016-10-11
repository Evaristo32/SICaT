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
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            
            try {
                Date data = formatter.parse(dataTexto);
                
                reuniao.setData(data);
            } catch (ParseException ex) {
                Logger.getLogger(SalvarReuniao.class.getName()).log(Level.SEVERE, null, ex);
            }

            String horaTexto = request.getParameter("hora");
            formatter = new SimpleDateFormat("HH:mm:ss");
            try {
                Date hora = formatter.parse(horaTexto);
                reuniao.setHora(hora);
            } catch (ParseException ex) {
                Logger.getLogger(SalvarReuniao.class.getName()).log(Level.SEVERE, null, ex);
            }
           
            reuniao.setReivindicacoes(reivindicacaoesParaSalvarReuniao);

            if (reuniao.getAssunto() == null || reuniao.getAssunto().trim().equals("")) {
                String msgAlerta = "Campo assunto é obrigatório.";
                request.setAttribute("msgAlerta", msgAlerta);
            }

            if (reuniao.getDescricao() == null
                    || reuniao.getDescricao().trim().equals("")) {
                String msgAlerta = "Campo descrição é obrigatório.";
                request.setAttribute("msgAlerta", msgAlerta);
            } else {

                String status = "Andamento";
                for (Reivindicacao r : reivindicacaoesParaSalvarReuniao) {

                    Reivindicacao reivindicacao = (Reivindicacao) daoReivindicacao.BuscarPorId(Reivindicacao.class, r.getIdReivindicacao());
                    reivindicacao.setStatus(status);
                    daoReivindicacao.AlterarReuniao(reivindicacao);

                }

                daoReuniao.SalvarReuniao(reuniao);
                String msgSucesso = "Reunião cadastrada com sucesso.";
                request.setAttribute("msgSucesso", msgSucesso);

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
