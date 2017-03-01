
package TaskManager.Dao;

import TaskManager.App.Task;
import TaskManager.Dao.TaskDao;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class TaskDaoImpl implements TaskDao {
    private static final Logger logger = LoggerFactory.getLogger(TaskDaoImpl.class);
    private SessionFactory sessionFactory;

    public TaskDaoImpl() {
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addTask(Task task) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(task);
        logger.info("Task successfully saved. Task details: " + task);
    }

    public void updateTask(Task task) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(task);
        logger.info("Task successfully update. Task details: " + task);
    }

    public void removeTask(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Task task = (Task)session.load(Task.class, new Integer(id));
        if(task != null) {
            session.delete(task);
        }

        logger.info("Task successfully removed. Task detail: " + task);
    }

    public void returnTask(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Task task = (Task)session.load(Task.class, new Integer(id));
        task.setDone(false);
        session.update(task);

        logger.info("Task successfully removed. Task detail: " + task);
    }

    public Task getTaskById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Task task = (Task)session.load(Task.class, new Integer(id));
        logger.info("Task successfully loaded. Task details: " + task);
        return task;
    }

    public List<Task> showTasks(String acc) {
        Session session = this.sessionFactory.getCurrentSession();
        List taskList = session.createQuery("from Task where done = false and account = :acc")
                .setString("acc",acc).list();
        Iterator var3 = taskList.iterator();

        while(var3.hasNext()) {
            Task task = (Task)var3.next();
            logger.info("Task list: " + task);
        }

        return taskList;
    }

    public List<Task> showDoneTasks(String acc){
        Session session = this.sessionFactory.getCurrentSession();
        List taskList = session.createQuery("from Task where done = true and account = :acc ")
                .setString("acc",acc).list();
        Iterator var3 = taskList.iterator();

        while(var3.hasNext()) {
            Task task = (Task)var3.next();
            logger.info("Task list: " + task);
        }

        return taskList;
    }

    public void closeTask(int id){
        Session session = this.sessionFactory.getCurrentSession();
        Task task = (Task)session.load(Task.class, new Integer(id));
        task.setDone(true);
        session.update(task);
        logger.info("Task successfully done. Task detail: " + task.toString());
    }
}
