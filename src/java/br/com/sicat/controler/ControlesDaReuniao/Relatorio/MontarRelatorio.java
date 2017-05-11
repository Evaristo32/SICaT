package br.com.sicat.controler.ControlesDaReuniao.Relatorio;

import br.com.sicat.model.AvaliacaoDoProcesso;
import br.com.sicat.model.ContagemDeUsuario;
import br.com.sicat.model.ObjetoDasListasDeAvaliacoesDeProcesso;
import br.com.sicat.model.ObjetoDasListasDeReivindicacoes;
import br.com.sicat.model.Reivindicacao;
import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class MontarRelatorio {

    //Metodo para filtrar Listas de Reivindicações
    public ObjetoDasListasDeReivindicacoes FiltrarListaDeReivindicacaoEQuantidade(List<Reivindicacao> listaDeReivindicaoDoPeriodo) {

        ObjetoDasListasDeReivindicacoes objetoDasListasDeReivindicacoes = new ObjetoDasListasDeReivindicacoes();

        objetoDasListasDeReivindicacoes.setListaDeReivindicacaoCriadas(listaDeReivindicaoDoPeriodo);
        objetoDasListasDeReivindicacoes.setQuatidadeCriadas(listaDeReivindicaoDoPeriodo.size());

        // Filtrando reivindicações Aprovadas
        List<Reivindicacao> listaDeReivindicacaoAprovadas = listaDeReivindicaoDoPeriodo.stream().filter(r -> r.getStatus().equals("Aprovada")).collect(Collectors.toList());
        objetoDasListasDeReivindicacoes.setListaDeReivindicacaoAprovadas(listaDeReivindicacaoAprovadas);
        objetoDasListasDeReivindicacoes.setQuatidadeAprovadas(listaDeReivindicacaoAprovadas.size());

        // Filtrando reivindicações Rejeitadas
        List<Reivindicacao> listaDeReivindicacaoRejeitadas = listaDeReivindicaoDoPeriodo.stream().filter(r -> r.getStatus().equals("Reprovada")).collect(Collectors.toList());
        objetoDasListasDeReivindicacoes.setListaDeReivindicacaoRejeitadas(listaDeReivindicacaoRejeitadas);
        objetoDasListasDeReivindicacoes.setQuatidadeRejeitadas(listaDeReivindicacaoRejeitadas.size());

        objetoDasListasDeReivindicacoes.setListaDeReivindicacaoAtrasadas(listaDeReivindicaoDoPeriodo);

        // Filtrando reivindicações Andamento
        List<Reivindicacao> listaDeReivindicacaoAndamento = listaDeReivindicaoDoPeriodo.stream().filter(r -> r.getStatus().equals("Andamento")).collect(Collectors.toList());
        objetoDasListasDeReivindicacoes.setListaDeReivindicacaoAndamento(listaDeReivindicacaoAndamento);
        objetoDasListasDeReivindicacoes.setQuatidadeAndamento(listaDeReivindicacaoAndamento.size());

        // Filtrando reivindicações Abertas
        List<Reivindicacao> listaDeReivindicacaoAbertas = listaDeReivindicaoDoPeriodo.stream().filter(r -> r.getStatus().equals("Aberta")).collect(Collectors.toList());
        objetoDasListasDeReivindicacoes.setListaDeReivindicacaoAbertas(listaDeReivindicacaoAbertas);
        objetoDasListasDeReivindicacoes.setQuatidadeAbertas(listaDeReivindicacaoAbertas.size());

        // Filtrando reivindicações Prontas
        List<Reivindicacao> listaDeReivindicacaoProntas = listaDeReivindicaoDoPeriodo.stream().filter(r -> r.getStatus().equals("Pronta")).collect(Collectors.toList());
        objetoDasListasDeReivindicacoes.setListaDeReivindicacaoProntas(listaDeReivindicacaoProntas);
        objetoDasListasDeReivindicacoes.setQuatidadeProntas(listaDeReivindicacaoProntas.size());

        // Filtrando reivindicações Confirmadas
        List<Reivindicacao> listaDeReivindicacaoConfirmadas = listaDeReivindicaoDoPeriodo.stream().filter(r -> r.getStatus().equals("Confirmada")).collect(Collectors.toList());
        objetoDasListasDeReivindicacoes.setListaDeReivindicacaoConfirmadas(listaDeReivindicacaoConfirmadas);
        objetoDasListasDeReivindicacoes.setQuatidadeConfirmadas(listaDeReivindicacaoConfirmadas.size());

        List<Reivindicacao> listaDeReivindicacaoEncerradas = listaDeReivindicaoDoPeriodo.stream().filter(r -> r.getStatus().equals("Encerrada")).collect(Collectors.toList());
        objetoDasListasDeReivindicacoes.setListaDeReivindicacaoEncerrada(listaDeReivindicacaoEncerradas);
        objetoDasListasDeReivindicacoes.setQuatidadeEncerradas(listaDeReivindicacaoEncerradas.size());

        return objetoDasListasDeReivindicacoes;
    }

    //Metodo para filtrar Avaliações do Processo
    public ObjetoDasListasDeAvaliacoesDeProcesso FiltrarListaDeAvaliacaoDoProcessoEQuantidade(List<AvaliacaoDoProcesso> listarDeAvaliacaoDoPeriodo) {
        ObjetoDasListasDeAvaliacoesDeProcesso objetoDasListasDeAvaliacoesDeProcesso = new ObjetoDasListasDeAvaliacoesDeProcesso();

        objetoDasListasDeAvaliacoesDeProcesso.setListaDeAvaliacaoDoProcessoRealizadas(listarDeAvaliacaoDoPeriodo);
        objetoDasListasDeAvaliacoesDeProcesso.setQuantidadeDeAvaliacaoDoProcessoRealizadas(listarDeAvaliacaoDoPeriodo.size());

        //Filtrando Avaliações do periodo com status Muito Ruim
        List<AvaliacaoDoProcesso> listarDeAvaliacaoDoPeriodoComStatusMuitoRuim = listarDeAvaliacaoDoPeriodo.stream().filter(a -> a.getStatus().equals("Muito Ruim")).collect(Collectors.toList());
        objetoDasListasDeAvaliacoesDeProcesso.setListaDeAvaliacaoDoProcessoMuitoRuim(listarDeAvaliacaoDoPeriodoComStatusMuitoRuim);
        objetoDasListasDeAvaliacoesDeProcesso.setQuantidadeDeAvaliacaoDoProcessoMuitoRuim(listarDeAvaliacaoDoPeriodoComStatusMuitoRuim.size());

        //Filtrando Avaliações do periodo com status Muito Ruim
        List<AvaliacaoDoProcesso> listarDeAvaliacaoDoPeriodoComStatusRuim = listarDeAvaliacaoDoPeriodo.stream().filter(a -> a.getStatus().equals("Ruim")).collect(Collectors.toList());
        objetoDasListasDeAvaliacoesDeProcesso.setListaDeAvaliacaoDoProcessoRuim(listarDeAvaliacaoDoPeriodo);
        objetoDasListasDeAvaliacoesDeProcesso.setQuantidadeDeAvaliacaoDoProcessoRuim(listarDeAvaliacaoDoPeriodo.size());

        //Filtrando Avaliações do periodo com status Muito Ruim
        List<AvaliacaoDoProcesso> listarDeAvaliacaoDoPeriodoComStatusNeutro = listarDeAvaliacaoDoPeriodo.stream().filter(a -> a.getStatus().equals("Neutro")).collect(Collectors.toList());
        objetoDasListasDeAvaliacoesDeProcesso.setListaDeAvaliacaoDoProcessoNeutro(listarDeAvaliacaoDoPeriodoComStatusNeutro);
        objetoDasListasDeAvaliacoesDeProcesso.setQuantidadeDeAvaliacaoDoProcessoNeutro(listarDeAvaliacaoDoPeriodoComStatusNeutro.size());

        //Filtrando Avaliações do periodo com status Muito Ruim
        List<AvaliacaoDoProcesso> listarDeAvaliacaoDoPeriodoComStatusBom = listarDeAvaliacaoDoPeriodo.stream().filter(a -> a.getStatus().equals("Bom")).collect(Collectors.toList());
        objetoDasListasDeAvaliacoesDeProcesso.setListaDeAvaliacaoDoProcessoBom(listarDeAvaliacaoDoPeriodo);
        objetoDasListasDeAvaliacoesDeProcesso.setQuantidadeDeAvaliacaoDoProcessoBom(listarDeAvaliacaoDoPeriodoComStatusBom.size());

        //Filtrando Avaliações do periodo com status Muito Ruim
        List<AvaliacaoDoProcesso> listarDeAvaliacaoDoPeriodoComStatusMuitoBom = listarDeAvaliacaoDoPeriodo.stream().filter(a -> a.getStatus().equals("Muito Bom")).collect(Collectors.toList());
        objetoDasListasDeAvaliacoesDeProcesso.setListaDeAvaliacaoDoProcessoMuitoBom(listarDeAvaliacaoDoPeriodoComStatusMuitoBom);
        objetoDasListasDeAvaliacoesDeProcesso.setQuantidadeDeAvaliacaoDoProcessoMuitoBom(listarDeAvaliacaoDoPeriodoComStatusMuitoBom.size());

        //Calcular Alunos satisfeitos e Insatisfeitos
        ArrayList<String> UsuariosInsatisfeitos = CalcularQuantidadeDeAlunosInsatisfeitos(listarDeAvaliacaoDoPeriodo);
        ArrayList<String> UsuariosSatisfeitos = CalcularQuantidadeDeAlunosSatisfeitos(listarDeAvaliacaoDoPeriodo);

        objetoDasListasDeAvaliacoesDeProcesso.setAlunosInsatisfeito(UsuariosInsatisfeitos.size());
        objetoDasListasDeAvaliacoesDeProcesso.setAlunosSatisfeito(UsuariosSatisfeitos.size());

        //Calcular media final do representante e do coordenador    
        double somarMediaDoCoordenador = 0, somarMediadoRepresentante = 0;
        double mediaFinalCoordenador = 0, mediaFinalRepresentante = 0;
        int alunosInsatisfeitos = 0;
        int alunoSatisfeito = 0;
        for (AvaliacaoDoProcesso avaliacaoDoProcesso : listarDeAvaliacaoDoPeriodo) {
            somarMediaDoCoordenador += avaliacaoDoProcesso.getMediaDoCoordenador();
            somarMediadoRepresentante += avaliacaoDoProcesso.getMediaDoRepresentante();
            if (avaliacaoDoProcesso.getSatisfacao() == 0) {

                alunosInsatisfeitos += 1;

            } else if (avaliacaoDoProcesso.getSatisfacao() == 2) {
                alunoSatisfeito += 1;
            }
        }

        mediaFinalRepresentante = somarMediadoRepresentante / listarDeAvaliacaoDoPeriodo.size();
        mediaFinalCoordenador = somarMediaDoCoordenador / listarDeAvaliacaoDoPeriodo.size();
        objetoDasListasDeAvaliacoesDeProcesso.setMediaRepresentante(mediaFinalRepresentante);
        objetoDasListasDeAvaliacoesDeProcesso.setMediaCoordenador(mediaFinalCoordenador);

        return objetoDasListasDeAvaliacoesDeProcesso;
    }

    private ArrayList<String> CalcularQuantidadeDeAlunosInsatisfeitos(List<AvaliacaoDoProcesso> listarDeAvaliacaoDoPeriodo) {
        ArrayList<String> usuariosInsatisfeitos = new ArrayList<String>();
        ArrayList<String> tamanhoUsuariosInsatisfeitos = new ArrayList<String>();
        ContagemDeUsuario contagemDeUsuario = new ContagemDeUsuario();

        for (AvaliacaoDoProcesso listaDeAvaliacaoDoPeriodo : listarDeAvaliacaoDoPeriodo) {
            if (listaDeAvaliacaoDoPeriodo.getSatisfacao() == 0) {
                if (usuariosInsatisfeitos.equals("")) {
                    usuariosInsatisfeitos.add(listaDeAvaliacaoDoPeriodo.getUsuario());
                } else {
                    
                    usuariosInsatisfeitos.add(listaDeAvaliacaoDoPeriodo.getUsuario());
                    contagemDeUsuario.setUsuariosInsatisfeitos(usuariosInsatisfeitos);

                    for (String usuario : contagemDeUsuario.getUsuariosInsatisfeitos()) {
                        if (!listaDeAvaliacaoDoPeriodo.getUsuario().equals(usuario)) {
                            tamanhoUsuariosInsatisfeitos.add(listaDeAvaliacaoDoPeriodo.getUsuario());
                        }
                    }
                }
            }

        }

        return tamanhoUsuariosInsatisfeitos;
    }

    private ArrayList<String> CalcularQuantidadeDeAlunosSatisfeitos(List<AvaliacaoDoProcesso> listarDeAvaliacaoDoPeriodo) {
        ArrayList<String> usuariosSatisfeitos = new ArrayList<String>();
        ArrayList<String> tamanhoUsuariosSatisfeitos = new ArrayList<String>();
        String aux = "";
        ContagemDeUsuario contagemDeUsuario = new ContagemDeUsuario();

        for (AvaliacaoDoProcesso listaDeAvaliacaoDoPeriodo : listarDeAvaliacaoDoPeriodo) {

            if (listaDeAvaliacaoDoPeriodo.getSatisfacao() == 2) {

                if (usuariosSatisfeitos.equals("")) {
                    
                    usuariosSatisfeitos.add(listaDeAvaliacaoDoPeriodo.getUsuario());
                } 
                else {

                    usuariosSatisfeitos.add(listaDeAvaliacaoDoPeriodo.getUsuario());
                    contagemDeUsuario.setUsuariosSatisfeitos(usuariosSatisfeitos);

                    for (String usuariosSatisfeito : contagemDeUsuario.getUsuariosSatisfeitos()) {

                        if (!usuariosSatisfeito.equals(aux)) {
                            aux = usuariosSatisfeito;

                            tamanhoUsuariosSatisfeitos.add(aux);
                        }
                    }

                }
            }

        }

        return tamanhoUsuariosSatisfeitos;
    }

}
