package br.com.sicat.controler.ControlesDaReuniao.AvaliacaoDaReivindicacao;

import br.com.sicat.dao.DaoReivindicacao;
import br.com.sicat.model.AvaliacaoDoProcesso;
import br.com.sicat.model.Reivindicacao;

public class CalcularPercentualDaAvaliacao {

    java.util.Date agora = new java.util.Date();

    int AvaliadaNoPrazo = 0;
    double AtendimentoDoRepresentante = 0.0;
    double AtendimentoDoCoordenador = 0.0;
    int Satisfacao = 0;

    public AvaliacaoDoProcesso montarAvaliacao(int avaliadacaoDoPrazo, double atendimentoDoRepresentante, double atendimentoDoCoordenador, int satisfeito, String condicaoSugestãoOferecida, String usuario, Reivindicacao reivindicacao) {

        AvaliacaoDoProcesso avaliacaoDoProcesso = new AvaliacaoDoProcesso();

        avaliacaoDoProcesso.setAvaliadaNoPrazo(calcularAvaliacaoNoPrazo(avaliadacaoDoPrazo));
        avaliacaoDoProcesso.setAtendimentoDoRepresentante(CalcularAtendimentoDoRepresentante(atendimentoDoRepresentante));
        avaliacaoDoProcesso.setAtendimentoDoCoordenador(calcularAtendimentoDoCoordenador(atendimentoDoCoordenador));
        avaliacaoDoProcesso.setSatisfacao(calcularSatisfacao(satisfeito));

        if (condicaoSugestãoOferecida == null) {

            String sugestao = "";
            avaliacaoDoProcesso.setPesoSugestãoOferecida(calcularSugestãoOferecida(sugestao));
            avaliacaoDoProcesso.setDescricaoSugestãoOferecida(sugestao);
        } else {
            avaliacaoDoProcesso.setPesoSugestãoOferecida(calcularSugestãoOferecida(condicaoSugestãoOferecida));
            avaliacaoDoProcesso.setDescricaoSugestãoOferecida(condicaoSugestãoOferecida);
        }

        avaliacaoDoProcesso.setData(agora);
        avaliacaoDoProcesso.setHora(agora);
        avaliacaoDoProcesso.setUsuario(usuario);
        avaliacaoDoProcesso.setReivindicacao(reivindicacao);
        reivindicacao.setStatus("Encerrada");
        
        
        DaoReivindicacao daoReivindicacao = new DaoReivindicacao();
        daoReivindicacao.AlterarReuniao(reivindicacao);
        
        double percentualFinal = percentualFinal(avaliacaoDoProcesso);
        avaliacaoDoProcesso.setPercentualFinal(percentualFinal);

        String status = calcularStatus(percentualFinal);
        avaliacaoDoProcesso.setStatus(status);
        avaliacaoDoProcesso.setMediaDoCoordenador(atendimentoDoCoordenador);
        avaliacaoDoProcesso.setMediaDoRepresentante(atendimentoDoRepresentante);
        
        return avaliacaoDoProcesso;
    }

    // Calcula se a avaliação foi realizada no prazo
    private int calcularAvaliacaoNoPrazo(int avaliadacaoDoPrazo) {
        if (avaliadacaoDoPrazo == 1) {
            AvaliadaNoPrazo = 2;
        } else {
            AvaliadaNoPrazo = 0;
        }

        return AvaliadaNoPrazo;
    }

    //Calcula o nivel do atendimento do representante
    private double CalcularAtendimentoDoRepresentante(double atendimentoDoRepresentante) {

        //        Verifica o atendimento do Representante
        if (atendimentoDoRepresentante < 2.0) {
            AtendimentoDoRepresentante = 0.0;

        } else if (atendimentoDoRepresentante >= 2.0 && atendimentoDoRepresentante < 5.0) {
            AtendimentoDoRepresentante = 0.5;

        } else if (atendimentoDoRepresentante >= 5.0 && atendimentoDoRepresentante < 7.0) {
            AtendimentoDoRepresentante = 1.0;

        } else if (atendimentoDoRepresentante >= 7.0 && atendimentoDoRepresentante < 8.0) {
            AtendimentoDoRepresentante = 1.5;

        } else if (atendimentoDoRepresentante >= 8.0 && atendimentoDoRepresentante <= 10.0) {
            AtendimentoDoRepresentante = 2.0;
        }

        return AtendimentoDoRepresentante;
    }

    // Calcula o nivel do atendimento do coordenador
    private double calcularAtendimentoDoCoordenador(double atendimentoDoCoordenador) {

        //        Verifica o atendimento do Coordenador
        if (atendimentoDoCoordenador < 2) {
            AtendimentoDoCoordenador = 0.0;
        } else if (atendimentoDoCoordenador >= 2 && atendimentoDoCoordenador < 5) {
            AtendimentoDoCoordenador = 0.5;
        } else if (atendimentoDoCoordenador >= 5 && atendimentoDoCoordenador < 7) {
            AtendimentoDoCoordenador = 1.0;
        } else if (atendimentoDoCoordenador >= 7 && atendimentoDoCoordenador < 8) {
            AtendimentoDoCoordenador = 1.5;
        } else if (atendimentoDoCoordenador >= 8 && atendimentoDoCoordenador <= 10.0) {
            AtendimentoDoCoordenador = 2.0;
        }

        return AtendimentoDoCoordenador;
    }

    //Calcula o nivel de satisfação do aluno
    private int calcularSatisfacao(int satisfeito) {

        //        nivel de satisfação
        if (satisfeito == 1) {
            Satisfacao = 2;
        } else {
            Satisfacao = 0;
        }

        return Satisfacao;
    }

    // Calcula sugetão de melhoria
    private int calcularSugestãoOferecida(String condicaoSugestãoOferecida) {

        // Verifica sugestão de melhoria
        if (condicaoSugestãoOferecida.trim().equals("")) {
            Satisfacao = 2;
        } else {
            Satisfacao = 0;
        }

        return Satisfacao;
    }

    // Calcula o percentual finalda avaliação
    private Double percentualFinal(AvaliacaoDoProcesso avaliacaoDoProcesso) {

        int ResultadoAvaliadaNoPrazo = avaliacaoDoProcesso.getAvaliadaNoPrazo();
        double ResultadoAtendimentoDoRepresentante = avaliacaoDoProcesso.getAtendimentoDoRepresentante();
        double Resultado = avaliacaoDoProcesso.getAtendimentoDoCoordenador();
        int ResultadoSatisfacao = avaliacaoDoProcesso.getSatisfacao();
        int ResultadoPesoSugestaoOferecida = avaliacaoDoProcesso.getPesoSugestãoOferecida();

        double peso = Resultado + ResultadoAtendimentoDoRepresentante + ResultadoAvaliadaNoPrazo + ResultadoSatisfacao + ResultadoPesoSugestaoOferecida;
        System.out.println("######################################################################################## calculo " + peso);
        return peso;
    }

    // Calcula o status da avaliação
    private String calcularStatus(double percentualFinal) {

        String statusDaAvaliacao = "";

        if (percentualFinal < 3.0) {
            statusDaAvaliacao = "Muito Ruim";
        }
        if (percentualFinal >= 3.0 && percentualFinal < 5.0) {
            statusDaAvaliacao = "Ruim";
        }
        if (percentualFinal >= 5.0 && percentualFinal < 7.0) {
            statusDaAvaliacao = "Neutro";
        }
        if (percentualFinal >= 7.0 && percentualFinal < 9.0) {
            statusDaAvaliacao = "Bom";
        }
        if (percentualFinal >= 9.0 && percentualFinal <= 10.0) {
            statusDaAvaliacao = "Muito Bom";
            
        }

        return statusDaAvaliacao;
    }

}
