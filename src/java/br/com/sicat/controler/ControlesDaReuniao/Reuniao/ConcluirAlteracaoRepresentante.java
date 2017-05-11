
package br.com.sicat.controler.ControlesDaReuniao.Reuniao;

import br.com.sicat.dao.DaoReuniao;
import br.com.sicat.model.Reuniao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


    public class ConcluirAlteracaoRepresentante extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
   
        
           long id = Long.parseLong(request.getParameter("idReuniao"));
            DaoReuniao daoReuniao = new DaoReuniao();
           Reuniao reuniaoParaAlterar =(Reuniao) daoReuniao.BuscarPorId(Reuniao.class, id);
           
            String dataTexto = request.getParameter("data");
               String horaTexto = request.getParameter("hora");
           if(!dataTexto.trim().equals("")  && !horaTexto.trim().equals("")){
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            
            try {
                Date data = formatter.parse(dataTexto);
                
                reuniaoParaAlterar.setData(data);
            } catch (ParseException ex) {
                Logger.getLogger(SalvarReuniao.class.getName()).log(Level.SEVERE, null, ex);
            }

         
            formatter = new SimpleDateFormat("HH:mm:ss");
            try {
                Date hora = formatter.parse(horaTexto);
                reuniaoParaAlterar.setHora(hora);
            } catch (ParseException ex) {
                Logger.getLogger(SalvarReuniao.class.getName()).log(Level.SEVERE, null, ex);
            }
           
        
           reuniaoParaAlterar.setStatus("Aguardando Confirmação");

           daoReuniao.AlterarReuniao(reuniaoParaAlterar);
            String msgSucesso = "Reunião alterada com sucesso.";
               request.setAttribute("msgSucesso", msgSucesso);
           
           
           }else{
               String msgAlerta = "Os campos Data e Hora é obrigatório.";
               request.setAttribute("msgAlerta", msgAlerta);
               
          
            
            request.setAttribute("reuniaoRecusada", reuniaoParaAlterar);
           }
        
        
           
           
           
           
           
           
            RequestDispatcher dispatcher = request.getRequestDispatcher("AlterarReuniao.jsp");
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
