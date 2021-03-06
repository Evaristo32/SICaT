package br.com.sicat.controler.ControlesDaReuniao.Reivindicacao;

import br.com.sicat.dao.DaoReivindicacao;
import br.com.sicat.model.Reivindicacao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IncluirStatusConfirmada extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        long id = Long.parseLong(request.getParameter("idReivindicacao"));
        DaoReivindicacao daoReivindicacao = new DaoReivindicacao();

        Reivindicacao reivindicacao = (Reivindicacao) daoReivindicacao.BuscarPorId(Reivindicacao.class, id);
        reivindicacao.setStatus("Confirmada");
        reivindicacao.setConfirmadaPeloCoordenador(request.getUserPrincipal().toString());
        daoReivindicacao.AlterarReuniao(reivindicacao);

        String msgSucesso = "Reivindicação de n° " + reivindicacao.getIdReivindicacao() + " confirmada com sucesso.";

        request.setAttribute("msgSucesso", msgSucesso);
        List<Reivindicacao> reivindicacoesAprovadas = daoReivindicacao.findByStatus("Aprovada");
        List<Reivindicacao> reivindicacoesAbertas = daoReivindicacao.findByStatus("Aberta");
        List<Reivindicacao> reivindicacoesConfirmada = daoReivindicacao.findByStatus("Confirmada");
        request.setAttribute("reivindicacoesAprovadas", reivindicacoesAprovadas);
        request.setAttribute("reivindicacoesAbertas", reivindicacoesAbertas);
        request.setAttribute("reivindicacoesConfirmada", reivindicacoesConfirmada);
        RequestDispatcher dispatcher = request.getRequestDispatcher("analizarReivindicacaoCoordenador.jsp");
        dispatcher.forward(request, response);

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
