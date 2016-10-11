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

public class AlterarReivindicacao extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        long id = Long.parseLong(request.getParameter("idReivindicacao"));
        DaoReivindicacao daoReivindicacao = new DaoReivindicacao();
        Reivindicacao reivindicacaoParaAlterar = (Reivindicacao) daoReivindicacao.BuscarPorId(Reivindicacao.class, id);

        /*
           RE 10 >> Reivindicações aprovadas pelo representnte 
           não poderão ser alteradas.
         */
        if (!reivindicacaoParaAlterar.getStatus().equals("Aberta")) {
            String msgAlerta = "A reivindicação N° " + reivindicacaoParaAlterar.getIdReivindicacao() + " não pode ser alterada, porque já está " + reivindicacaoParaAlterar.getStatus() +".";
            request.setAttribute("msgAlerta", msgAlerta);
        } else {

            request.setAttribute("reivindicacaoParaAlterar", reivindicacaoParaAlterar);
        }

        String user = request.getUserPrincipal().toString();
        System.out.println("user: " + user);
        if (user != null && !user.trim().isEmpty()) {
            List<Reivindicacao> reivindicacoes = daoReivindicacao.findByUser(user);
            request.setAttribute("reivindicacoes", reivindicacoes);
        }

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
