package TaskManager.Dao;

import TaskManager.App.Account;

import java.util.Iterator;
import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class AccDAOImpl implements AccDAO {

    private static final Logger logger = LoggerFactory.getLogger(TaskDaoImpl.class);
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addAcc(Account login) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(login);
        logger.info("Login successfully saved. login details: " + login);
    }


    public boolean checkLogin(Account account) {
        boolean flag = false;
        Session session = this.sessionFactory.getCurrentSession();
        List loginList = session.createQuery("from Account ").list();
        Iterator var3 = loginList.iterator();

        while (var3.hasNext()) {
            Account acc = (Account) var3.next();
            if (acc.getLogin().equals(account.getLogin())) {
                if (acc.getPassword().equals(account.getPassword())) {
                    flag = true;
                    }
                }
            }
        return flag;

    }
}
