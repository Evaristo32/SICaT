package br.com.sicat.dao;

import br.com.sicat.model.AvaliacaoDoProcesso;
import br.com.sicat.model.Reivindicacao;
import br.com.sicat.model.Reuniao;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

public class DaoReivindicacao extends GenericDAO<Reivindicacao> {

    public List<Reivindicacao> findByUser(String usuario) {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Criteria crit = s.createCriteria(Reivindicacao.class);
        crit.add(Restrictions.eq("usuario", usuario));
        return crit.list();
    }

    public List<Reivindicacao> findByStatus(String status) {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Criteria crit = s.createCriteria(Reivindicacao.class);
        crit.add(Restrictions.eq("status", status));
        return crit.list();
    }
    
    public List<Reivindicacao> findByIds(List<Long> ids) {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Criteria crit = s.createCriteria(Reivindicacao.class);
        crit.add(Restrictions.in("idReivindicacao", ids));
        return crit.list();
    }

    public List<Reivindicacao> findByUser_findByStatus(String usuario, String status) {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Criteria crit = s.createCriteria(Reivindicacao.class);
        crit.add(Restrictions.eq("usuario", usuario));
        crit.add(Restrictions.eq("status", status));
        return crit.list();
    }
    
      public List<Reivindicacao> ListaEntreDatas(Date dataInicial,Date dataFinal) {

        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Criteria crit = s.createCriteria(Reivindicacao.class);
        crit.add(Restrictions.between("data", dataInicial, dataFinal));

        return crit.list();
    }

}
