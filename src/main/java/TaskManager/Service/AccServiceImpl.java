package TaskManager.Service;

import java.util.List;

import TaskManager.App.Account;

import TaskManager.Dao.AccDAO;
import TaskManager.Dao.AccDAOImpl;
import TaskManager.Dao.TaskDaoImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AccServiceImpl implements AccService{

    private AccDAO accDAO;


    @Transactional
    public void addAcc(Account login) {
        this.accDAO.addAcc(login);
    }

    @Transactional
    public boolean checkLogin(Account login) {
        return this.accDAO.checkLogin(login);
    }

    public void setAccDao(AccDAOImpl accDao) {
        this.accDAO = accDao;
    }

}
