/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validacao(){
    
    if(document.reuniaoForm.assunto.value == " "){
        alert("O campo <Assunto> é de preenchimento obrigatorio.");
        document.reuniaoForm.assunto.focus();
        return false;
    }
    
    
    if(document.reuniaoForm.assunto.value.length < 5){
        alert("O campo <Assunto> deve conter no minimo 5 caractéres.");
        document.reuniaoForm.assunto.focus();
        return false;
    }
       if(document.reuniaoForm.assunto.value.length > 10){
        alert("O campo <Assunto> deve conter no maximo 10 caractéres.");
        document.reuniaoForm.assunto.focus();
        return false;
    }
    
    if(document.reuniaoForm.descricao.value == " "){
        alert("O campo <Descrição> é de preenchimento obrigatorio.");
        document.reuniaoForm.descricao.focus();
        return false;
    } 
    
    if(document.reuniaoForm.descricao.value.length < 5){
        alert("O campo <Assunto> deve conter no minimo 5 caractéres.");
        document.reuniaoForm.assunto.focus();
        return false;
    }
       if(document.reuniaoForm.descricao.value.length > 10){
        alert("O campo <Assunto> deve conter no maximo 10 caractéres.");
        document.reuniaoForm.assunto.focus();
        return false;
    }
    
    if(document.reuniaoForm.data.value.indexof('/')== 3){
        alert("O campo <Data> deve conter esse formato DD/MM/YYYY.");
        document.reuniaoForm.data.focus();
        return false;
    }
      if(document.reuniaoForm.hora !== "HH:MM"){
        alert("O campo <Hora> deve conter esse formato DD/MM/YYYY.");
        document.reuniaoForm.hora.focus();
        return false;
    }
    
    
    
}
