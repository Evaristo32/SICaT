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
import javax.xml.ws.Dispatch;

public class IncluirStatusReprovada extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String localParaDirecionar = "";
        Reivindicacao reivindicacao = null;

        DaoReivindicacao daoReivindicacao = new DaoReivindicacao();

        String desc = request.getParameter("descricaoDaRejeicao");

        if (!desc.trim().equals("")) {
            long id = Long.parseLong(request.getParameter("idReivindicacao"));
            reivindicacao = (Reivindicacao) daoReivindicacao.BuscarPorId(Reivindicacao.class, id);

            reivindicacao.setStatus("Reprovada");
            reivindicacao.setDescricaoDaRejeicao(desc);
            reivindicacao.setRejeitadaPeloUsuario(request.getUserPrincipal().toString());

            daoReivindicacao.AlterarReuniao(reivindicacao);

            List<Reivindicacao> reivindicacoes = daoReivindicacao.findByStatus("Aberta");
            request.setAttribute("reivindicacoes", reivindicacoes);

            String msgSucesso = "Reivindicação de n° " + reivindicacao.getIdReivindicacao() + " reprovada com sucesso.";
            request.setAttribute("msgSucesso", msgSucesso);
            localParaDirecionar = "analizarReivindicacao.jsp";

            List<Reivindicacao> reivindicacoesAbertas = daoReivindicacao.findByStatus("Aberta");
            List<Reivindicacao> reivindicacoesAprovadas = daoReivindicacao.findByStatus("Aprovada");
            List<Reivindicacao> reivindicacoesConfirmada = daoReivindicacao.findByStatus("Confirmada");
            request.setAttribute("reivindicacoesAbertas", reivindicacoesAbertas);
            request.setAttribute("reivindicacoesAprovadas", reivindicacoesAprovadas);
            request.setAttribute("reivindicacoesConfirmada", reivindicacoesConfirmada);

        }

        if (desc.trim().equals("")) {

            String msgAlerta = "Campo descrição da rejeição é obrigatório.";
            request.setAttribute("msgAlerta", msgAlerta);

            long id = Long.parseLong(request.getParameter("idReivindicacao"));
            reivindicacao = (Reivindicacao) daoReivindicacao.BuscarPorId(Reivindicacao.class, id);
            localParaDirecionar = "VisualizarReivindicacao.jsp";
        }

        request.setAttribute("reivindicacao", reivindicacao);

        RequestDispatcher dispatcher = request.getRequestDispatcher(localParaDirecionar);
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
