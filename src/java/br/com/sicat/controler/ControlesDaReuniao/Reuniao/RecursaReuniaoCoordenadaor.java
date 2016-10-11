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

public class RecursaReuniaoCoordenadaor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String local = "";
        Reuniao reuniaoAguardandoConfirmacao = null;
        DaoReuniao daoReuniao = new DaoReuniao();

        String descricaoDaRejeicao = request.getParameter("descricaoDaRejeicao");

        // verificar isso com o professor rafael  isEmpty()
        if (descricaoDaRejeicao == null || descricaoDaRejeicao.trim().equals("")) {
            String msgAlerta = "Campo motivo da rejeição é obrigatorio.";
            request.setAttribute("msgAlerta", msgAlerta);
            long id = Long.parseLong(request.getParameter("idReuniao"));
            reuniaoAguardandoConfirmacao = (Reuniao) daoReuniao.BuscarPorId(Reuniao.class, id);

            local = "VisualizarReuniaoAguardandoConfirmacaoCoordenador.jsp";
        }
        if (descricaoDaRejeicao ==  null || descricaoDaRejeicao.trim().equals("")) {
            String msgAlerta = "Campo motivo da rejeição é obrigatorio.";
            request.setAttribute("msgAlerta", msgAlerta);
            long id = Long.parseLong(request.getParameter("idReuniao"));
            reuniaoAguardandoConfirmacao = (Reuniao) daoReuniao.BuscarPorId(Reuniao.class, id);

            local = "VisualizarReuniaoAguardandoConfirmacaoCoordenador.jsp";
        } else {

            long id = Long.parseLong(request.getParameter("idReuniao"));

            Reuniao reuniao = (Reuniao) daoReuniao.BuscarPorId(Reuniao.class, id);
            reuniao.setStatus("Recusada");
            reuniao.setRejeitadaPeloUsuario(request.getUserPrincipal().toString());
            reuniao.setDescricaoDaRejeicao(descricaoDaRejeicao);
            daoReuniao.AlterarReuniao(reuniao);
            String msgSucesso = "Reunião recusuda com sucesso.";
            request.setAttribute("msgSucesso", msgSucesso);
            local = "reuniao.jsp";

        }

        List<Reuniao> reunioesCadastradas = daoReuniao.findByStatus("Cadastrada");
        List<Reuniao> reunioesAguardandoConfirmacao = daoReuniao.findByStatus("Aguardando Confirmação");
        List<Reuniao> reunioesConfirmadas = daoReuniao.findByStatus("Confirmada");
        List<Reuniao> reunioesRecusadas = daoReuniao.findByStatus("Recusada");
        List<Reuniao> reunioesConcluidas = daoReuniao.findByStatus("Concluida");

        request.setAttribute("reuniaoAguardandoConfirmacao", reuniaoAguardandoConfirmacao);
        request.setAttribute("reunioesCadastradas", reunioesCadastradas);
        request.setAttribute("reunioesAguardandoConfirmacao", reunioesAguardandoConfirmacao);
        request.setAttribute("reunioesRecusadas", reunioesRecusadas);
        request.setAttribute("reunioesConfirmadas", reunioesConfirmadas);
        request.setAttribute("reunioesConcluidas", reunioesConcluidas);
        RequestDispatcher dispatcher = request.getRequestDispatcher(local);
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
