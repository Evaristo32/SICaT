package br.com.sicat.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;

@Entity
public class Reuniao {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long idReuniao;

    private String assunto;
    private String descricao;
    private String status;

    private String criadaPeloRepresentante;
    private String confirmadaPeloCoordenador;

//    private String usuario;
    private String rejeitadaPeloUsuario;
    private String descricaoDaRejeicao;

    @Temporal(TemporalType.DATE)
    private Date data;

    @Temporal(TemporalType.TIME)
    private Date hora;
    @OneToMany(fetch = FetchType.EAGER)
    private List<Reivindicacao> reivindicacoes;
    
    

    private String campos;

    public Long getIdReuniao() {
        return idReuniao;
    }

//    public String getUsuario() {
//        return usuario;
//    }
//
//    public void setUsuario(String usuario) {
//        this.usuario = usuario;
//    }
//    public String getConfirmadaPorUsuario() {
//        return ConfirmadaPorUsuario;
//    }
//
//    public void setConfirmadaPorUsuario(String ConfirmadaPorUsuario) {
//        this.ConfirmadaPorUsuario = ConfirmadaPorUsuario;
//    }
    public String getDescricaoDaRejeicao() {
        return descricaoDaRejeicao;
    }

    public void setDescricaoDaRejeicao(String descricaoDaRejeicao) {
        this.descricaoDaRejeicao = descricaoDaRejeicao;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCriadaPeloRepresentante() {
        return criadaPeloRepresentante;
    }

    public void setCriadaPeloRepresentante(String criadaPeloRepresentante) {
        this.criadaPeloRepresentante = criadaPeloRepresentante;
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

    public List<Reivindicacao> getReivindicacoes() {
        return reivindicacoes;
    }

    public void setReivindicacoes(List<Reivindicacao> reivindicacoes) {
        this.reivindicacoes = reivindicacoes;
    }

    public String getCampos() {
        return campos;
    }

    public void setCampos(String campos) {
        this.campos = campos;
    }

}
