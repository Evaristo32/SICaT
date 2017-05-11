package br.com.sicat.controler.ControlesDaReuniao.AvaliacaoDaReivindicacao;

import br.com.sicat.controler.ControlesDaReuniao.Grafico.MontarGrafico;
import br.com.sicat.controler.ControlesDaReuniao.Relatorio.MontarRelatorio;
import br.com.sicat.controler.ControlesDaReuniao.Reuniao.SalvarReuniao;
import br.com.sicat.dao.DaoAvaliarProcesso;
import br.com.sicat.dao.DaoReivindicacao;
import br.com.sicat.model.AvaliacaoDoProcesso;
import br.com.sicat.model.ObjetoDasListasDeAvaliacoesDeProcesso;
import br.com.sicat.model.ObjetoDasListasDeReivindicacoes;
import br.com.sicat.model.Reivindicacao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import static java.util.Collections.list;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.jasper.tagplugins.jstl.ForEach;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

public class ListarPorData extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String localParaIr = "";

        Date dataAtual = new Date();

        MontarRelatorio montarRelatorio = new MontarRelatorio();
        
        String dataInicialRecebida = request.getParameter("dataInicial");
        String dataFinalRecebida = request.getParameter("dataFinal");

        if (!dataInicialRecebida.equals("") && !dataFinalRecebida.equals("")) {
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date dataInicial = null;
            Date dataFinal = null;
            try {
                dataInicial = formatter.parse(dataInicialRecebida);

            } catch (ParseException ex) {
                Logger.getLogger(SalvarReuniao.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                dataFinal = formatter.parse(dataFinalRecebida);

            } catch (ParseException ex) {
                Logger.getLogger(SalvarReuniao.class.getName()).log(Level.SEVERE, null, ex);
            }

            DaoAvaliarProcesso daoAvaliarProcesso = new DaoAvaliarProcesso();//|| dataInicial.after(dataCondicao)

            String msgCondicao = VerificarData(dataInicial, dataFinal, dataAtual);
            if (msgCondicao.equals("")) {
                localParaIr = "exportaRelatorio.jsp";

                List<AvaliacaoDoProcesso> listarDeAvaliacaoDoPeriodo = daoAvaliarProcesso.ListaEntreDatas(dataInicial, dataFinal);
                ObjetoDasListasDeAvaliacoesDeProcesso listarDeAvaliacaoDoPeriodoFiltradasComQuantidade = montarRelatorio.FiltrarListaDeAvaliacaoDoProcessoEQuantidade(listarDeAvaliacaoDoPeriodo);
                request.setAttribute("listarDeAvaliacaoDoPeriodoFiltradasComQuantidade", listarDeAvaliacaoDoPeriodoFiltradasComQuantidade);

                DaoReivindicacao daoReivindicacao = new DaoReivindicacao();
                List<Reivindicacao> listaDeReivindicaoDoPeriodo = daoReivindicacao.ListaEntreDatas(dataInicial, dataFinal);

                ObjetoDasListasDeReivindicacoes listasReivindicacaoFiltradasComQuantidade = montarRelatorio.FiltrarListaDeReivindicacaoEQuantidade(listaDeReivindicaoDoPeriodo);
                request.setAttribute("listasReivindicacaoFiltradasComQuantidade", listasReivindicacaoFiltradasComQuantidade);
            } else {
                String msgAlerta = msgCondicao;
                request.setAttribute("msgAlerta", msgAlerta);
                localParaIr = "gerarRelatorio.jsp";

            }
        } else {
            String msgAlerta = "Os Campos Data inicial e Data final é de preenchimento obrigatório.";
            request.setAttribute("msgAlerta", msgAlerta);
            localParaIr = "gerarRelatorio.jsp";
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(localParaIr);
        dispatcher.forward(request, response);

    }

    private String VerificarData(Date dataInicial, Date dataFinal, Date dataAtual) {

        String msgAlerta = "";

        if (dataInicial.after(dataAtual)) {
            msgAlerta = "Data inicial do periodo informado não pode ser maior que a data atual.";
        }
        if (dataInicial.after(dataFinal)) {
            msgAlerta = "Data inicial do periodo informado não pode ser maior que a data final.";
        } else if (dataFinal.after(dataAtual)) {
            msgAlerta = "Data final do periodo informado não pode ser maior que a data de atual.";
        }

        return msgAlerta;
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
