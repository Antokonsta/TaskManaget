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
            value = {"tasks/{acc}"},
            method = {RequestMethod.GET}
    )
    public String listTasks(@PathVariable("acc") String acc,Model model) {
        model.addAttribute("acc",acc);
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", this.taskService.showTasks(acc));
        return "tasks";
    }
    @RequestMapping(
            value = {"doneTask/{acc}"},
            method = {RequestMethod.GET}
    )
    public String listDoneTasks(@PathVariable("acc") String acc,
                                Model model) {
        model.addAttribute("acc",acc);
        model.addAttribute("listDoneTasks", this.taskService.showDoneTasks(acc));
        return "doneTask";
    }
    @RequestMapping(
            value = {"/addTask/{acc}"},
            method = {RequestMethod.GET}
    )
    public String showAddTask(@PathVariable("acc") String acc,Model model) {
        model.addAttribute("task", new Task());
        model.addAttribute("acc",acc);
        return "addTask";
    }

    @RequestMapping(
            value = {"/tasks/add/{acc}"},
            method = {RequestMethod.POST}
    )
    public String addTask(@PathVariable("acc") String acc,@ModelAttribute("task") Task task, Model model) {
        task.setAccount(acc);
        if(task.getNumberOfTask() == 0) {
            this.taskService.addTask(task);
        } else {
            this.taskService.updateTask(task);
        }
        model.addAttribute("acc",acc);
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", this.taskService.showTasks(acc));
        return "tasks";
    }

    @RequestMapping({"/remove/{numberOfTask}/{acc}"})
    public String removeTask(@PathVariable("acc") String acc,
                             @PathVariable("numberOfTask") int numberOfTask, Model model) {

        this.taskService.removeTask(numberOfTask);
        model.addAttribute("acc",acc);
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", this.taskService.showTasks(acc));
        return "tasks";
    }

    @RequestMapping({"edit/{numberOfTask}/{acc}"})
    public String editTask(@PathVariable("acc") String acc,
                           @PathVariable("numberOfTask") int numberOfTask, Model model) {
        model.addAttribute("acc",acc);
        model.addAttribute("task", this.taskService.getTaskById(numberOfTask));
        return "addTask";
    }

    @RequestMapping({"taskdata/{numberOfTask}/{acc}"})
    public String taskData(@PathVariable("acc") String acc,
                           @PathVariable("numberOfTask") int numberOfTask, Model model) {
        model.addAttribute("acc",acc);
        model.addAttribute("task", this.taskService.getTaskById(numberOfTask));
        return "tasksdata";
    }
    @RequestMapping({"done/{numberOfTask}/{acc}"})
    public String doneTask(@PathVariable("acc") String acc,
                           @PathVariable("numberOfTask") int numberOfTask, Model model) {

        this.taskService.closeTask(numberOfTask);
        model.addAttribute("acc",acc);
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", this.taskService.showTasks(acc));
        return "tasks";
    }

    @RequestMapping({"/return/{numberOfTask}/{acc}"})
    public String returnTask(@PathVariable("acc") String acc,
                             @PathVariable("numberOfTask") int numberOfTask, Model model) {
        this.taskService.returnTask(numberOfTask);
        model.addAttribute("acc",acc);
        model.addAttribute("listDoneTasks", this.taskService.showDoneTasks(acc));
        return "doneTask";
    }

}
