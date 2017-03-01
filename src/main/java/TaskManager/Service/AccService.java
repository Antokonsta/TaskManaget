package TaskManager.Service;

import TaskManager.App.Account;

/**
 * Created by Anton on 28.02.17.
 */
public interface AccService {
    void addAcc(Account login);
    boolean checkLogin(Account login);
}
