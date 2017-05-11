package br.com.sicat.controler.ControlesDaReuniao.AvaliacaoDaReivindicacao;

import br.com.sicat.dao.DaoAvaliarProcesso;
import br.com.sicat.dao.DaoReivindicacao;
import br.com.sicat.model.AvaliacaoDoProcesso;
import br.com.sicat.model.Reivindicacao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SalvarAvaliacaoDaReivindicacao extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DaoReivindicacao daoReivindicacao = new DaoReivindicacao();
        java.util.Date agora = new java.util.Date();
        String SugestãoOferecida;
        String localParaIr = "";

        String avaliadacaoNoPrazo = request.getParameter("avaliadacaoDoPrazo");
        String atendimentoNoRepresentante = request.getParameter("atendimentoDoRepresentante");
        String atendimentoNoCoordenador = request.getParameter("atendimentoDoCoordenador");
        String satisfacao = request.getParameter("satisfeito");
        ArrayList<Reivindicacao> reivindicacoesParaAvaliar = new ArrayList<Reivindicacao>();
        String msgCondicao = verificador(avaliadacaoNoPrazo, atendimentoNoRepresentante, atendimentoNoCoordenador, satisfacao);

        if (msgCondicao.equals("") || msgCondicao == null) {

            int avaliadacaoDoPrazo = Integer.parseInt(request.getParameter("avaliadacaoDoPrazo"));
            double atendimentoDoRepresentante = Double.parseDouble(request.getParameter("atendimentoDoRepresentante"));
            double atendimentoDoCoordenador = Double.parseDouble(request.getParameter("atendimentoDoCoordenador"));
            int satisfeito = Integer.parseInt(request.getParameter("satisfeito"));
            String condicaoSugestãoOferecida = request.getParameter("descricao");
            String usuario = request.getUserPrincipal().toString();

            if (condicaoSugestãoOferecida == null) {
                SugestãoOferecida = "";
            } else {
                SugestãoOferecida = condicaoSugestãoOferecida;
            }

            long idReivindicacao = Long.parseLong(request.getParameter("idReivindicacao"));

            Reivindicacao reivindicacao = (Reivindicacao) daoReivindicacao.BuscarPorId(Reivindicacao.class, idReivindicacao);

            CalcularPercentualDaAvaliacao calcularPercentualDaAvaliacao = new CalcularPercentualDaAvaliacao();
            AvaliacaoDoProcesso avaliacaoParaSalvar = calcularPercentualDaAvaliacao.montarAvaliacao(avaliadacaoDoPrazo, atendimentoDoRepresentante,
                    atendimentoDoCoordenador, satisfeito, condicaoSugestãoOferecida, usuario, reivindicacao);

            if (avaliacaoParaSalvar != null) {
                DaoAvaliarProcesso daoAvaliarProcesso = new DaoAvaliarProcesso();
                daoAvaliarProcesso.SalvarReuniao(avaliacaoParaSalvar);
                String msgSucesso = "Avaliação realizada com sucesso.";
                request.setAttribute("msgSucesso", msgSucesso);
                localParaIr = "reivindicacoesEncerradas.jsp";
            } else {
                String msgErro = "Avaliação não pode ser realizada com sucesso.";
                request.setAttribute("msgErro", msgErro);
                localParaIr = "capturarDadosRelatorio.jsp";

                Reivindicacao reivindicacaoParaAvaliar = (Reivindicacao) daoReivindicacao.BuscarPorId(Reivindicacao.class, idReivindicacao);
                request.setAttribute("reivindicacaoParaAvaliar", reivindicacaoParaAvaliar);
            }

            List<Reivindicacao> reivindicacoesEncerrado = daoReivindicacao.findByStatus("Pronta");
            request.setAttribute("reivindicacoesEncerrado", reivindicacoesEncerrado);
        } else {
            String msgAlerta = msgCondicao;
            request.setAttribute("msgAlerta", msgAlerta);
            localParaIr = "capturarDadosRelatorio.jsp";

            long idReivindicacao = Long.parseLong(request.getParameter("idReivindicacao"));
            Reivindicacao reivindicacaoParaAvaliar = (Reivindicacao) daoReivindicacao.BuscarPorId(Reivindicacao.class, idReivindicacao);
            request.setAttribute("reivindicacaoParaAvaliar", reivindicacaoParaAvaliar);

        }

        List<Reivindicacao> reivindicacoesAtrasadas = daoReivindicacao.findByStatus("Atrasada");
        List<Reivindicacao> reivindicacoesFinalizadas = daoReivindicacao.findByStatus("Finalizada");

        for (Reivindicacao reivindicacoesAtrasada : reivindicacoesAtrasadas) {
            reivindicacoesParaAvaliar.add(reivindicacoesAtrasada);
            for (Reivindicacao reivindicacoesFinalizada : reivindicacoesFinalizadas) {
                reivindicacoesParaAvaliar.add(reivindicacoesFinalizada);
            }

        }

        if (reivindicacoesParaAvaliar.size() != 0) {
            request.setAttribute("reivindicacoesParaAvaliar", reivindicacoesParaAvaliar);
        } else {
            String msgNenhumRegistro = "Não reivindicação para avaliar no momento.";
            request.setAttribute("msgNenhumRegistro", msgNenhumRegistro);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(localParaIr);
        dispatcher.forward(request, response);

    }

    private String verificador(String avaliadacaoNoPrazo, String atendimentoNoRepresentante, String atendimentoNoCoordenador, String satisfacao) {

        String msgAlerta = "";

        if (avaliadacaoNoPrazo == null || avaliadacaoNoPrazo.equals("")) {
            msgAlerta = "A pergunta " + "( Sua reivindicação foi avaliada dentro do prazo? )" + " é de preenchimento obrigatória.";
        }
        if (atendimentoNoRepresentante == null || atendimentoNoRepresentante.equals("")) {
            msgAlerta = "A pergunta " + "( Qual sua nota em relação ao atendimento do representante? )" + " é de preenchimento obrigatória.";
        }
        if (atendimentoNoCoordenador == null || atendimentoNoCoordenador.equals("")) {
            msgAlerta = "A pergunta " + "( Qual sua nota em relação ao atendimento do coordenador? )" + " é de preenchimento obrigatória.";
        }
        if (satisfacao == null || satisfacao.equals("")) {
            msgAlerta = "A pergunta " + "( Está satisfeito com o resultado da avaliação da sua reivindicação? )" + " é de preenchimento obrigatória.";
        }

        return msgAlerta;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
