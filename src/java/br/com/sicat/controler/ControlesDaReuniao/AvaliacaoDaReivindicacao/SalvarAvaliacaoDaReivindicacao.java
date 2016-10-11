package br.com.sicat.controler.ControlesDaReuniao.AvaliacaoDaReivindicacao;

import br.com.sicat.dao.DaoAvaliarProcesso;
import br.com.sicat.dao.DaoReivindicacao;
import br.com.sicat.model.AvaliacaoDoProcesso;
import br.com.sicat.model.Reivindicacao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SalvarAvaliacaoDaReivindicacao extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        java.util.Date agora = new java.util.Date();

        String SugestãoOferecida;
        int avaliadacaoDoPrazo = Integer.parseInt(request.getParameter("avaliadacaoDoPrazo"));
        double atendimentoDoRepresentante = Double.parseDouble(request.getParameter("atendimentoDoRepresentante"));
        double atendimentoDoCoordenador = Double.parseDouble(request.getParameter("atendimentoDoCoordenador"));
        int satisfeito = Integer.parseInt(request.getParameter("satisfeito"));
        String condicaoSugestãoOferecida = request.getParameter("descricao");
        String usuario = request.getUserPrincipal().toString();
        System.out.println("33333333333333333333333333333333333333333333333333333333333333333333333333333 ################################ " + condicaoSugestãoOferecida);
        if (condicaoSugestãoOferecida == null) {
            SugestãoOferecida = "";
        } else {
            SugestãoOferecida = condicaoSugestãoOferecida;
        }
        System.out.println("# ################################################ entrada " + avaliadacaoDoPrazo);
        System.out.println("###################################################  entrada " + atendimentoDoRepresentante);
        System.out.println("#####################################################  entrada  aten" + atendimentoDoCoordenador);
        System.out.println("######################################################## entrada satisfacao" + satisfeito);
        System.out.println("############################################################# entrada sugestao " + SugestãoOferecida);

        long idReivindicacao = Long.parseLong(request.getParameter("idReivindicacao"));

        DaoReivindicacao daoReivindicacao = new DaoReivindicacao();
        Reivindicacao reivindicacao = (Reivindicacao) daoReivindicacao.BuscarPorId(Reivindicacao.class, idReivindicacao);
//        reivindicacao.setStatus("Encerrada");

        CalcularPercentualDaAvaliacao calcularPercentualDaAvaliacao = new CalcularPercentualDaAvaliacao();
        AvaliacaoDoProcesso avaliacaoParaSalvar = calcularPercentualDaAvaliacao.montarAvaliacao(avaliadacaoDoPrazo, atendimentoDoRepresentante,
        atendimentoDoCoordenador, satisfeito, condicaoSugestãoOferecida, usuario, reivindicacao);

        System.out.println("#################################################  saida " + avaliacaoParaSalvar.getAvaliadaNoPrazo());
        System.out.println("################################################# saida " + avaliacaoParaSalvar.getAtendimentoDoRepresentante());
        System.out.println("################################################# saida " + avaliacaoParaSalvar.getAtendimentoDoCoordenador());
        System.out.println("################################################# saida " + avaliacaoParaSalvar.getSatisfacao());
        System.out.println("#################################################  saida " + avaliacaoParaSalvar.getPesoSugestãoOferecida());
        System.out.println("#################################################  saida " + avaliacaoParaSalvar.getDescricaoSugestãoOferecida());

        DaoAvaliarProcesso daoAvaliarProcesso = new DaoAvaliarProcesso();
        daoAvaliarProcesso.SalvarReuniao(avaliacaoParaSalvar);

//criarPesoDaAvaliacao(avaliadacaoDoPrazo,atendimentoDoRepresentante,atendimentoDoCoordenador,satisfeito, String sugestãoOferecida);
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
