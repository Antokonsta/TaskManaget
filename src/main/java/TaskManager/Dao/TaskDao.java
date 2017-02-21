package TaskManager.Dao;

import TaskManager.App.Task;
import java.util.List;

public interface TaskDao {
    void addTask(Task var1);

    void updateTask(Task var1);

    void removeTask(int var1);

    Task getTaskById(int var1);

    List<Task> showTasks();
}
