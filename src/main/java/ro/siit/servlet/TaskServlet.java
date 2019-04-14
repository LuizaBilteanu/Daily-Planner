package ro.siit.servlet;

import ro.siit.entity.Planner;
import ro.siit.entity.Task;
import ro.siit.model.DbManager;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.UUID;


@WebServlet(urlPatterns = {"/tasks"})
public class TaskServlet extends HttpServlet {

    private Planner planner;

    public TaskServlet() {
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        this.planner = new Planner();
    }

    private DbManager dbManager = DbManager.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String actionString = req.getParameter("action");
        String action = (actionString != null) ? actionString : "list";

        switch (action) {
            case ("add"):
                req.setAttribute("lists", dbManager.getAllLists());
                req.getRequestDispatcher("/jsps/tasks/addTasks.jsp").forward(req, resp);
                break;
            case ("edit"):
                String taskId = req.getParameter("id");
                req.setAttribute("task", dbManager.getTaskById(taskId));
                req.setAttribute("lists", dbManager.getAllLists());
                req.getRequestDispatcher("/jsps/tasks/editTasks.jsp").forward(req, resp);
                break;
            case ("delete"):
                taskId = req.getParameter("id");
                dbManager.deleteTask(taskId);
                this.redirectToTasks(resp);
                break;
            case ("update"):
                taskId = req.getParameter("id");
                dbManager.changeTaskStatus(taskId);
                this.redirectToTasks(resp);
                break;

            default:
                List<Task> tasks;
                String listId = req.getParameter("planId");
                if (listId != null) {
                    tasks = dbManager.tasksFromList(listId);
                } else {
                    tasks = dbManager.getAllTasks();
                }
                req.setAttribute("tasks", tasks);
                req.getRequestDispatcher("/jsps/tasks/listTasks.jsp").forward(req, resp);
                break;
        }
    }

    private void redirectToTasks(HttpServletResponse resp) throws IOException {
        resp.sendRedirect("/home/tasks");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String actionString = req.getParameter("action");
        String action = (actionString != null) ? actionString : "list";

        switch (action) {
            case ("add"):
                Task task = new Task();
                task.setId(UUID.randomUUID());
                task.setPlanId(UUID.fromString(req.getParameter("list")));
                task.setName(req.getParameter("name"));
                task.setDescription(req.getParameter("description"));
                task.setDate(Date.valueOf(req.getParameter("inputDate")));
                task.setStatus(req.getParameter("status"));

                dbManager.addTask(task);
                this.redirectToTasks(resp);
                break;

            case ("edit"):
                task = new Task();
                task.setId(UUID.fromString(req.getParameter("id")));
                task.setName(req.getParameter("name"));
                task.setDescription(req.getParameter("description"));
                task.setDate(Date.valueOf(req.getParameter("inputDate")));
                task.setStatus(req.getParameter("status"));
                task.setPlanId(UUID.fromString(req.getParameter("planId")));
                task.setStatus(req.getParameter("status"));

                dbManager.updateTask(task);
                this.redirectToTasks(resp);
                break;
            default:
                List<Task> tasks = dbManager.getAllTasks();
                req.setAttribute("tasks", tasks);
                req.getRequestDispatcher("/jsps/tasks/listTasks.jsp").forward(req, resp);
                break;
        }
    }
}
