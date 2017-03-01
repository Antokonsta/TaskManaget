package TaskManager.Dao;

import TaskManager.App.Account;


public interface AccDAO {
    void addAcc(Account login);

    boolean checkLogin(Account login);


}
