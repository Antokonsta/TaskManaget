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

import java.util.List;

@Controller
public class LoginController {

    private AccService accService;
    private TaskService taskService;
    @Autowired(
            required = true
    )
    @Qualifier("AccService")
    public void setAccService(AccService accService) {
        this.accService = accService;
    }


    @Autowired(
            required = true
    )
    @Qualifier("taskService")
    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }


    @RequestMapping(
            value = {"autorization"},
            method = {RequestMethod.GET}
    )

    public String showAutorizationPage(Model model) {

        model.addAttribute("login", new Account());
        return "autorization";
    }


    @RequestMapping(
            value = {"/login/check"},
            method = {RequestMethod.POST}
    )
    public String checkLogin(@ModelAttribute("login") Account login, Model model) {
        if(this.accService.checkLogin(login)){
            model.addAttribute("task", new Task());
            model.addAttribute("listTasks", this.taskService.showTasks());
            return "tasks";
        }
        return "redirect:/autorization";
    }



    @RequestMapping(
            value = {"/login/add"},
            method = {RequestMethod.POST}
    )
    public String addAccount(@ModelAttribute("login") Account login) {
        this.accService.addAcc(login);
        return "successPage";
    }
}
