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
public class AvaliacaoDoProcesso {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long idAvaliacaoDoProcesso;

    private int avaliadaNoPrazo;
    private double atendimentoDoRepresentante;
    private double atendimentoDoCoordenador;
    private int satisfacao;
    private String descricaoSugestãoOferecida;
    private int pesoSugestãoOferecida;
    private String status;
    private String usuario;
    private double percentualFinal;

    @Temporal(TemporalType.DATE)
    private Date data;
    @Temporal(TemporalType.TIME)
    private Date hora;
    @OneToOne//(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Reivindicacao reivindicacao;

    public Long getIdAvaliacaoDoProcesso() {
        return idAvaliacaoDoProcesso;
    }

    public void setIdAvaliacaoDoProcesso(Long idAvaliacaoDoProcesso) {
        this.idAvaliacaoDoProcesso = idAvaliacaoDoProcesso;
    }

    public int getAvaliadaNoPrazo() {
        return avaliadaNoPrazo;
    }

    public void setAvaliadaNoPrazo(int avaliadaNoPrazo) {
        this.avaliadaNoPrazo = avaliadaNoPrazo;
    }

    public double getAtendimentoDoRepresentante() {
        return atendimentoDoRepresentante;
    }

    public void setAtendimentoDoRepresentante(double atendimentoDoRepresentante) {
        this.atendimentoDoRepresentante = atendimentoDoRepresentante;
    }

    public double getAtendimentoDoCoordenador() {
        return atendimentoDoCoordenador;
    }

    public void setAtendimentoDoCoordenador(double atendimentoDoCoordenador) {
        this.atendimentoDoCoordenador = atendimentoDoCoordenador;
    }

    public int getSatisfacao() {
        return satisfacao;
    }

    public void setSatisfacao(int satisfacao) {
        this.satisfacao = satisfacao;
    }

    public String getDescricaoSugestãoOferecida() {
        return descricaoSugestãoOferecida;
    }

    public void setDescricaoSugestãoOferecida(String descricaoSugestãoOferecida) {
        this.descricaoSugestãoOferecida = descricaoSugestãoOferecida;
    }

    public int getPesoSugestãoOferecida() {
        return pesoSugestãoOferecida;
    }

    public void setPesoSugestãoOferecida(int pesoSugestãoOferecida) {
        this.pesoSugestãoOferecida = pesoSugestãoOferecida;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public double getPercentualFinal() {
        return percentualFinal;
    }

    public void setPercentualFinal(double percentualFinal) {
        this.percentualFinal = percentualFinal;
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

    public Reivindicacao getReivindicacao() {
        return reivindicacao;
    }

    public void setReivindicacao(Reivindicacao reivindicacao) {
        this.reivindicacao = reivindicacao;
    }

}
