package br.com.sicat.controler.ControlesDaReuniao.Reivindicacao;

import br.com.sicat.dao.DaoReivindicacao;
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

public class ListarProntaParaAvaliar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DaoReivindicacao daoReivindicacao = new DaoReivindicacao();
        ArrayList<Reivindicacao> reivindicacoesParaAvaliar = new ArrayList<Reivindicacao>();

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
            String msgNenhumRegistro = "Não tem reivindicação para ser avaliar no momento.";
            request.setAttribute("msgNenhumRegistro", msgNenhumRegistro);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("reivindicacoesEncerradas.jsp");
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
