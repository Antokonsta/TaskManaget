package TaskManager.App;

import javax.persistence.*;

@Entity
@Table(
        name = "Task"
)
public class Task {
    @Id
    @Column(
            name = "number"
    )
    @GeneratedValue(
            strategy = GenerationType.IDENTITY
    )
    private int numberOfTask;
    @Column(
            name = "name"
    )
    private String nameOfTask;
    @Column(
            name = "startdate"
    )
    private String startDateOfTask;
    @Column(
            name = "deadline"
    )
    private String deadLineOfTask;
    @Column(
            name = "description"
    )
    private String description;

    @Column(
            name = "done"
    )
    private boolean done = false;

    @Column(
            name = "account"
    )
    private String account;

    public Task() {

    }

    public Task(String account) {
        this.account = account;
    }

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }



    public int getNumberOfTask() {
        return this.numberOfTask;
    }

    public void setNumberOfTask(int numberOfTask) {
        this.numberOfTask = numberOfTask;
    }

    public String getNameOfTask() {
        return this.nameOfTask;
    }

    public void setNameOfTask(String nameOfTask) {
        this.nameOfTask = nameOfTask;
    }

    public String getStartDateOfTask() {
        return this.startDateOfTask;
    }

    public void setStartDateOfTask(String startDateOfTask) {
        this.startDateOfTask = startDateOfTask;
    }

    public String getDeadLineOfTask() {
        return this.deadLineOfTask;
    }

    public void setDeadLineOfTask(String deadLineOfTask) {
        this.deadLineOfTask = deadLineOfTask;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String toString() {
        return "Задача{Название - " + this.nameOfTask + '\'' + " ,Дата начала - " + this.startDateOfTask + " ,Дедлайн - " + this.deadLineOfTask + '}';
    }
}
