package br.com.sicat.controler.ControlesDaReuniao.Reuniao;

import br.com.sicat.dao.DaoReuniao;
import br.com.sicat.model.Reuniao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListarReunioes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DaoReuniao daoReuniao = new DaoReuniao();

        List<Reuniao> reunioesCadastradas = daoReuniao.findByStatus("Cadastrada");
        List<Reuniao> reunioesAguardandoConfirmacao = daoReuniao.findByStatus("Aguardando Confirmação");
        List<Reuniao> reunioesConfirmadas = daoReuniao.findByStatus("Confirmada");
        List<Reuniao> reunioesRecusadas = daoReuniao.findByStatus("Recusada");
        List<Reuniao> reunioesConcluidas = daoReuniao.findByStatus("Concluida");

        request.setAttribute("reunioesCadastradas", reunioesCadastradas);
        request.setAttribute("reunioesAguardandoConfirmacao", reunioesAguardandoConfirmacao);
        request.setAttribute("reunioesRecusadas", reunioesRecusadas);
        request.setAttribute("reunioesConfirmadas", reunioesConfirmadas);
        request.setAttribute("reunioesConcluidas", reunioesConcluidas);
        RequestDispatcher dispatcher = request.getRequestDispatcher("reunioesCadastradas.jsp");
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
