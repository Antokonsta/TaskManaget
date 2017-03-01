package TaskManager.controller;

import TaskManager.App.Account;
import TaskManager.App.Task;
import TaskManager.Service.AccService;
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
    private AccService accService;

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
            value = {"doneTask"},
            method = {RequestMethod.GET}
    )
    public String listDoneTasks(Model model) {
        model.addAttribute("listDoneTasks", this.taskService.showDoneTasks());
        return "doneTask";
    }
    @RequestMapping(
            value = {"addTask"},
            method = {RequestMethod.GET}
    )
    public String showAddTask(Model model) {
        model.addAttribute("task", new Task());
        return "addTask";
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
        return "addTask";
    }

    @RequestMapping({"taskdata/{numberOfTask}"})
    public String taskData(@PathVariable("numberOfTask") int numberOfTask, Model model) {
        model.addAttribute("task", this.taskService.getTaskById(numberOfTask));
        return "tasksdata";
    }
    @RequestMapping({"done/{numberOfTask}"})
    public String doneTask(@PathVariable("numberOfTask") int numberOfTask) {
        this.taskService.closeTask(numberOfTask);
        return "redirect:/tasks";
    }

    @RequestMapping({"/return/{numberOfTask}"})
    public String returnTask(@PathVariable("numberOfTask") int numberOfTask) {
        this.taskService.returnTask(numberOfTask);
        return "redirect:/doneTask";
    }

}
