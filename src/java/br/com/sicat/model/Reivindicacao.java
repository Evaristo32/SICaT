package br.com.sicat.model;

import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Reivindicacao {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long idReivindicacao;

    private String usuario;
    private String aprovadaPeloRepresentante;
    private String confirmadaPeloCoordenador;
    private String rejeitadaPeloUsuario;
    private String assunto;
    private String descricao;
    @Temporal(TemporalType.DATE)
    private Date data;
    @Temporal(TemporalType.TIME)
    private Date hora;
    private String status;
    private String descricaoDaRejeicao;
// 
    @OneToOne
    private AvaliacaoDoProcesso avaliacaoDoProcesso;

    
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getAprovadaPeloRepresentante() {
        return aprovadaPeloRepresentante;
    }

    public void setAprovadaPeloRepresentante(String aprovadaPeloRepresentante) {
        this.aprovadaPeloRepresentante = aprovadaPeloRepresentante;
    }

    public String getConfirmadaPeloCoordenador() {
        return confirmadaPeloCoordenador;
    }

    public void setConfirmadaPeloCoordenador(String confirmadaPeloCoordenador) {
        this.confirmadaPeloCoordenador = confirmadaPeloCoordenador;
    }

    public String getRejeitadaPeloUsuario() {
        return rejeitadaPeloUsuario;
    }

    public void setRejeitadaPeloUsuario(String rejeitadaPeloUsuario) {
        this.rejeitadaPeloUsuario = rejeitadaPeloUsuario;
    }
    
    public Long getIdReivindicacao() {
        return idReivindicacao;
    }

    public void setIdReivindicacao(Long idReivindicacao) {
        this.idReivindicacao = idReivindicacao;
    }

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescricaoDaRejeicao() {
        return descricaoDaRejeicao;
    }

    public void setDescricaoDaRejeicao(String descricaoDaRejeicao) {
        this.descricaoDaRejeicao = descricaoDaRejeicao;
    }

    public AvaliacaoDoProcesso getAvaliacaoDoProcesso() {
        return avaliacaoDoProcesso;
    }

    public void setAvaliacaoDoProcesso(AvaliacaoDoProcesso avaliacaoDoProcesso) {
        this.avaliacaoDoProcesso = avaliacaoDoProcesso;
    }

    
}
