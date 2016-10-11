package br.com.sicat.controler.ControlesDaReuniao.Reuniao;

import br.com.sicat.dao.DaoReuniao;
import br.com.sicat.model.Reuniao;
import java.io.IOException;
import java.io.PrintWriter;
import static java.time.Clock.system;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExcluirReuniao extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            
            long id = Long.parseLong(request.getParameter("idReuniao"));
            
            
            DaoReuniao daoReuniao = new DaoReuniao();
            
            Reuniao reuniao = (Reuniao) daoReuniao.BuscarPorId(Reuniao.class, id);
            daoReuniao.RemoverReuniao(reuniao);
            
             List<Reuniao> reunioes = daoReuniao.findALL(Reuniao.class);

        request.setAttribute("reunioes", reunioes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("reuniao.jsp");
        dispatcher.forward(request, response);


        }

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
