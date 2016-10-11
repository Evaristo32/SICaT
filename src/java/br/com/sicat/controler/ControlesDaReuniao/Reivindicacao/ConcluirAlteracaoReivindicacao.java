package br.com.sicat.controler.ControlesDaReuniao.Reivindicacao;

import br.com.sicat.dao.DaoReivindicacao;
import br.com.sicat.model.Reivindicacao;
import static com.sun.xml.bind.util.CalendarConv.formatter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConcluirAlteracaoReivindicacao extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        java.util.Date agora = new java.util.Date();
        String i = request.getParameter("idReivindicacao");
   
       Long idReuniao = Long.parseLong(request.getParameter("idReivindicacao"));
        DaoReivindicacao daoReivindicacao = new DaoReivindicacao();
        Reivindicacao reivindicacao = (Reivindicacao) daoReivindicacao.BuscarPorId(Reivindicacao.class, idReuniao);

        reivindicacao.setAssunto(request.getParameter("assunto"));
        reivindicacao.setDescricao(request.getParameter("descricao"));

//        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
//        try {
//            Date date = (java.util.Date) formatter.parse(request.getParameter("data"));
//
//        } catch (ParseException ex) {
//            Logger.getLogger(ConcluirAlteracaoReivindicacao.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        formatter = new SimpleDateFormat("HH:mm:ss");
//        try {
//            Date hora = (java.util.Date) formatter.parse(request.getParameter("hora"));
//        } catch (ParseException ex) {
//            Logger.getLogger(ConcluirAlteracaoReivindicacao.class.getName()).log(Level.SEVERE, null, ex);
//        }

        reivindicacao.setData(agora);
        reivindicacao.setHora(agora);
        
        
        daoReivindicacao.AlterarReuniao(reivindicacao);
        
       
        String user = request.getUserPrincipal().toString();
        System.out.println("user: " + user);
        if(user != null && !user.trim().isEmpty()) {
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
