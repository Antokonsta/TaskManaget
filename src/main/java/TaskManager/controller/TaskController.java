package TaskManager.controller;

import TaskManager.App.Task;
import TaskManager.Service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TaskController {
    private TaskService taskService;

    public TaskController() {
    }

    @Autowired(
            required = true
    )
    @Qualifier("taskService")
    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }

    @RequestMapping(
            value = {"tasks"},
            method = {RequestMethod.GET}
    )
    public String listTasks(Model model) {
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", this.taskService.showTasks());
        return "tasks";
    }

    @RequestMapping(
            value = {"/tasks/add"},
            method = {RequestMethod.POST}
    )
    public String addTask(@ModelAttribute("task") Task task) {
        if(task.getNumberOfTask() == 0) {
            this.taskService.addTask(task);
        } else {
            this.taskService.updateTask(task);
        }

        return "redirect:/tasks";
    }

    @RequestMapping({"/remove/{numberOfTask}"})
    public String removeTask(@PathVariable("numberOfTask") int numberOfTask) {
        this.taskService.removeTask(numberOfTask);
        return "redirect:/tasks";
    }

    @RequestMapping({"edit/{numberOfTask}"})
    public String editTask(@PathVariable("numberOfTask") int numberOfTask, Model model) {
        model.addAttribute("task", this.taskService.getTaskById(numberOfTask));
        model.addAttribute("listTasks", this.taskService.showTasks());
        return "tasks";
    }

    @RequestMapping({"taskdata/{numberOfTask}"})
    public String taskData(@PathVariable("numberOfTask") int numberOfTask, Model model) {
        model.addAttribute("task", this.taskService.getTaskById(numberOfTask));
        return "tasksdata";
    }
}
