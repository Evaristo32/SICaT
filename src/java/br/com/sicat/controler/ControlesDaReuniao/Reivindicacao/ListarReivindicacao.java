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

public class ListarReivindicacao extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");


        DaoReivindicacao daoReivindicacao = new DaoReivindicacao();
       
        String user = request.getUserPrincipal().toString();
        System.out.println("user: " + user);
        if(user != null && !user.trim().isEmpty()) {
            List<Reivindicacao> reivindicacoes = daoReivindicacao.findByUser(user);
            request.setAttribute("reivindicacoes", reivindicacoes);
        }
         RequestDispatcher dispatcher = request.getRequestDispatcher("reivindicacao.jsp");
        dispatcher.forward(request, response);
        
        
        
//        String status = "Aberto";
//         if(user != null && !user.trim().isEmpty()) {
//            List<Reivindicacao> reivindicacoes = daoReivindicacao.findByUser_findByStatus(user, status);
//            request.setAttribute("reivindicacoes", reivindicacoes);
//        }
//        
        
       

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
