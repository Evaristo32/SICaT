package br.com.sicat.controler.ControlesDaReuniao.Reivindicacao;

import br.com.sicat.dao.DaoReivindicacao;
import br.com.sicat.dao.DaoReuniao;
import br.com.sicat.model.Reivindicacao;
import br.com.sicat.model.Reuniao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExcluirReivindicacao extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DaoReivindicacao daoReivindicacao = new DaoReivindicacao();

        long id = Long.parseLong(request.getParameter("idReivindicacao"));
        Reivindicacao reivindicacaoParaExcluir = (Reivindicacao) daoReivindicacao.BuscarPorId(Reivindicacao.class, id);

        if (reivindicacaoParaExcluir.getStatus().equals("Aberta")) {
            daoReivindicacao.RemoverReuniao(reivindicacaoParaExcluir);
            String msgExclusao = "Reivindicação de N° " + reivindicacaoParaExcluir.getIdReivindicacao() + " excluida com sucesso.";
            request.setAttribute("msgExclusao", msgExclusao);
        } else {
            String msgAlerta = "A reivindicação N° " + reivindicacaoParaExcluir.getIdReivindicacao() + " não pode ser excluida, porque já está " + reivindicacaoParaExcluir.getStatus() +".";
            request.setAttribute("msgAlerta", msgAlerta);
        }

        List<Reivindicacao> reivindicacoes = daoReivindicacao.findByUser(request.getUserPrincipal().toString());

        request.setAttribute("reivindicacoes", reivindicacoes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("reivindicacao.jsp");
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
