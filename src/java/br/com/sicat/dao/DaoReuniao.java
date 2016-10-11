package br.com.sicat.dao;

import br.com.sicat.model.Reivindicacao;
import br.com.sicat.model.Reuniao;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

public class DaoReuniao extends GenericDAO<Reuniao> {
    
      public List<Reuniao> findByStatus(String status) {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Criteria crit = s.createCriteria(Reuniao.class);
        crit.add(Restrictions.eq("status", status));
        return crit.list();
    }

}
