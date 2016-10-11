package br.com.sicat.factory;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class ConnectionFactory {

    private static SessionFactory sessionFactory;

    static {

        try {
            Configuration configuration = new Configuration();
            configuration.configure();
            sessionFactory.openSession();

        } catch (Throwable ex) {

            System.err.println("OPsss falha na criação." + ex);
            throw new ExceptionInInitializerError(ex);

        }

    }

    public static Session getSession() {
        return sessionFactory.openSession();
    }

}
