
package TaskManager.Service;

import TaskManager.App.Task;
import TaskManager.Dao.TaskDao;
import TaskManager.Dao.TaskDaoImpl;
import TaskManager.Service.TaskService;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TaskServiceImpl implements TaskService {
    private TaskDao taskDao;

    public TaskServiceImpl() {
    }

    @Transactional
    public void addTask(Task task) {
        this.taskDao.addTask(task);
    }

    @Transactional
    public void updateTask(Task task) {
        this.taskDao.updateTask(task);
    }

    @Transactional
    public void removeTask(int id) {
        this.taskDao.removeTask(id);
    }

    @Transactional
    public Task getTaskById(int id) {
        return this.taskDao.getTaskById(id);
    }

    @Transactional
    public List<Task> showTasks() {
        return this.taskDao.showTasks();
    }

    @Transactional
    public List<Task> showDoneTasks() {
        return this.taskDao.showDoneTasks();
    }

    @Transactional
    public void closeTask(int id) {
        this.taskDao.closeTask(id);
    }

    @Transactional
    public void returnTask(int id) {
        this.taskDao.returnTask(id);
    }

    public void setTaskDao(TaskDaoImpl taskDao) {
        this.taskDao = taskDao;
    }

}

