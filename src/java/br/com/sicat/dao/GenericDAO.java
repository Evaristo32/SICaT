package br.com.sicat.dao;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
//import br.ucb.saam.factory.ConnectionFactory;

public abstract class GenericDAO<T> {

    public GenericDAO() {

    }

//    private Session session;
//    private Transaction transaction;
//
//    public void SalvarReuniao(T objeto) {
//        try {
//            this.session = ConnectionFactory.getSession();
//            this.transaction = this.session.beginTransaction();
//            this.SalvarReuniao(objeto);
//            this.transaction.commit();
//
//        } catch (Exception e) {
//            this.transaction.rollback();
//        } finally {
//            this.session.close();
//        }
//    }
    public void SalvarOuAlterar(T objeto) {

        // pegando uma seção com o banco
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        // abrindo essa seção
        Session s = sf.openSession();
        // abrindo a transação
        s.getTransaction().begin();
        // salvando objeto
        s.saveOrUpdate(objeto);
        // descaregando objeto no banco
        s.flush();
        // fechando a transação
        s.getTransaction().commit();
        // fechando a conexão
        s.close();
    }

    // metodo para salvar um registro no banco
    public void SalvarReuniao(T objeto) {

       
        // pegando uma seção com o banco
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        // abrindo essa seção
        Session s = sf.openSession();
        // abrindo a transação
        s.getTransaction().begin();
        // salvando objeto
        s.save(objeto);
        // descaregando objeto no banco
        s.flush();
        // fechando a transação
        s.getTransaction().commit();
        // fechando a conexão
        s.close();
    }

    public void AlterarReuniao(T objeto) {

        // pegando uma seção com o banco
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        // abrindo essa seção
        Session s = sf.openSession();
        // abrindo a transação
        s.getTransaction().begin();
        // salvando objeto
        s.update(objeto);

        // descaregando objeto no banco
        s.flush();
        // fechando a transação
        s.getTransaction().commit();
        // fechando a conexão
        s.close();
    }

    // metodo bara excluir um registro do banco
    public void RemoverReuniao(T objetivo) {

        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.getTransaction().begin();
        s.delete(objetivo);
        s.flush();
        s.getTransaction().commit();
        s.close();

    }

    // metodo para buscar uma reuniao por ID
    public Object BuscarPorId(Class<T> classe, Long id) {

        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.getTransaction().begin();
        Object Object = s.get(classe, id);
        s.getTransaction().commit();
        s.close();
        return Object;
    }

    // metodo para listar todas os registros do banco
    public List<T> findALL(Class<T> classe) {

        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Criteria crit = s.createCriteria(classe);
        List results = crit.list();

        return results;
    }

    // metodo para pesquisar com as inicais do nome
    public List<T> ListarPelasIniciais(Class<T> classe, String assunto) {

        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Criteria crit = s.createCriteria(classe);
        crit.add(Restrictions.like("assunto", assunto + "%"));
        List results = crit.list();

        return results;
    }

}
