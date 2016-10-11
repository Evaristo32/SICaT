package br.com.sicat.controler.ControlesDaReuniao.Reivindicacao;

import br.com.sicat.dao.DaoReivindicacao;
import br.com.sicat.model.Reivindicacao;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SalvarReivindicacao extends HttpServlet {

    public String getServletInfo() {
        System.out.println("");
        return "Short description";
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        java.util.Date agora = new java.util.Date();
        DaoReivindicacao daoReivindicacao = new DaoReivindicacao();

        String idCondicional = request.getParameter("idReivindicacao");
        if (idCondicional == null || idCondicional.equals("")) {
            String assunto = request.getParameter("assunto");
            String descricao = request.getParameter("descricao");

            Reivindicacao reivindicacao1 = new Reivindicacao();
            reivindicacao1.setAssunto(assunto);
            reivindicacao1.setDescricao(descricao);
            reivindicacao1.setData(agora);
            reivindicacao1.setHora(agora);
            reivindicacao1.setStatus("Aberta");
            reivindicacao1.setUsuario(request.getUserPrincipal().toString());

            String MSGAlert = verificador(reivindicacao1);

            if (MSGAlert.equals("")) {

                daoReivindicacao.SalvarReuniao(reivindicacao1);
                String msgSucesso = "Reivindicação salva com sucesso.";
                request.setAttribute("msgSucesso", msgSucesso);
            } else {
                String msgExclusao = MSGAlert;
                request.setAttribute("msgExclusao", msgExclusao);
            }

        }

        if (!idCondicional.equals("")) {

            long id = Long.parseLong(request.getParameter("idReivindicacao"));
            Reivindicacao reivindicacao2 = (Reivindicacao) daoReivindicacao.BuscarPorId(Reivindicacao.class, id);
            reivindicacao2.setAssunto(request.getParameter("assunto"));
            reivindicacao2.setDescricao(request.getParameter("descricao"));
            reivindicacao2.setData(agora);
            reivindicacao2.setHora(agora);
            reivindicacao2.setUsuario(request.getUserPrincipal().toString());

            daoReivindicacao.AlterarReuniao(reivindicacao2);

            String msgSucesso = "Reivindicação " + reivindicacao2.getIdReivindicacao() + " Alterada com sucesso.";
            request.setAttribute("msgSucesso", msgSucesso);
        }

//        String dataTexto = request.getParameter("data");
//        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
//        try {
//            Date date = (java.util.Date)formatter.parse(dataTexto);
//        } catch (ParseException ex) {
//            Logger.getLogger(SalvarReuniao.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        String horaTexto = request.getParameter("hora");
//        formatter = new SimpleDateFormat("HH:mm:ss");
//        try {
//            Date hora = (java.util.Date)formatter.parse(horaTexto);
//        } catch (ParseException ex) {
//            Logger.getLogger(SalvarReuniao.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        reivindicacao.setAluno( new Aluno());
//        reivindicacao.setReuniao(new Reuniao());
        List<Reivindicacao> reivindicacoes = daoReivindicacao.findByUser(request.getUserPrincipal().toString());

        System.out.println("reivindicacoes:");

        for (Reivindicacao r : reivindicacoes) {
            System.out.println("rev:" + r.getAssunto());
        }
        request.setAttribute("reivindicacoes", reivindicacoes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("reivindicacao.jsp");
        dispatcher.forward(request, response);

    }

    public String verificador(Reivindicacao reivindicacao) {
        String MSGAlert = "";

        if (reivindicacao.getAssunto() == null || reivindicacao.getAssunto().trim().equals("")) {
            MSGAlert = "Campo assunto é obrigatório.";
        }
        if (reivindicacao.getDescricao() == null || reivindicacao.getDescricao().trim().equals("")) {
            MSGAlert = "Campo descrição é obrigatório.";
        }

        return MSGAlert;
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
}
