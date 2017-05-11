package br.com.sicat.dao;

import br.com.sicat.model.AvaliacaoDoProcesso;
import br.com.sicat.model.Reivindicacao;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

public class DaoAvaliarProcesso extends GenericDAO<AvaliacaoDoProcesso> {

 

    public List<AvaliacaoDoProcesso> ListaEntreDatas(Date dataInicial,Date dataFinal) {

        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Criteria crit = s.createCriteria(AvaliacaoDoProcesso.class);
        crit.add(Restrictions.between("data", dataInicial, dataFinal));

        return crit.list();
    }


}
