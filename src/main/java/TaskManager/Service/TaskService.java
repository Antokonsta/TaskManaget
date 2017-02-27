package TaskManager.Service;

import TaskManager.App.Task;
import java.util.List;

public interface TaskService {
    void addTask(Task var1);

    void updateTask(Task var1);

    void removeTask(int var1);

    void returnTask(int id);

    Task getTaskById(int var1);

    List<Task> showTasks();

    List<Task> showDoneTasks();

    void closeTask(int id);
}
