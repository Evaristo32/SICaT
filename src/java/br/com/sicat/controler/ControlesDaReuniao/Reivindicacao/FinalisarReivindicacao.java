package br.com.sicat.controler.ControlesDaReuniao.Reivindicacao;

import br.com.sicat.dao.DaoReivindicacao;
import br.com.sicat.dao.DaoReuniao;
import br.com.sicat.model.Reivindicacao;
import br.com.sicat.model.Reuniao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FinalisarReivindicacao extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String descricaoDaConfirmacao = request.getParameter("descricaoDaConfirmacao");

        System.out.println("Eu passei aqui ############################################################### na servlet de finalizar");

        DaoReivindicacao daoReivindicacao = new DaoReivindicacao();

        if (!descricaoDaConfirmacao.trim().equals("")) {
            long idReivindicacao = Long.parseLong(request.getParameter("idReivindicacao"));
            Reivindicacao reivindicacao = (Reivindicacao) daoReivindicacao.BuscarPorId(Reivindicacao.class, idReivindicacao);
            reivindicacao.setStatus("Finalizada");

            daoReivindicacao.AlterarReuniao(reivindicacao);
            String msgSucesso = "Reivindicação finaizada com sucesso.";
            request.setAttribute("msgSucesso", msgSucesso);
        } else {

            String msgAlerta = "Campo resultado é obrigatório.";
            request.setAttribute("msgAlerta", msgAlerta);
            long id = Long.parseLong(request.getParameter("idReuniao"));
            DaoReuniao daoReuniao = new DaoReuniao();
            Reuniao reuniaoConcluida = (Reuniao) daoReuniao.BuscarPorId(Reuniao.class, id);

            request.setAttribute("reuniaoConcluida", reuniaoConcluida);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("visualizarReuniaoConcluidaCoordenador.jsp");
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
