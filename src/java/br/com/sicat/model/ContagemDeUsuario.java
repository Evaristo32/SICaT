package br.com.sicat.model;

import java.util.List;


public class ContagemDeUsuario{
    
    
    private List<String> usuariosInsatisfeitos;
    private List<String> usuariosSatisfeitos;

    public List<String> getUsuariosInsatisfeitos() {
        return usuariosInsatisfeitos;
    }

    public void setUsuariosInsatisfeitos(List<String> usuariosInsatisfeitos) {
        this.usuariosInsatisfeitos = usuariosInsatisfeitos;
    }

    public List<String> getUsuariosSatisfeitos() {
        return usuariosSatisfeitos;
    }

    public void setUsuariosSatisfeitos(List<String> usuariosSatisfeitos) {
        this.usuariosSatisfeitos = usuariosSatisfeitos;
    }
    
    
    
}
