package ro.siit.servlet;

import ro.siit.Action;
import ro.siit.entity.Task;
import ro.siit.entity.Planner;
import ro.siit.model.DbManager;


import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;


    @WebServlet(urlPatterns = {"/lists"})
    public class PlannerServlet extends HttpServlet {

        private DbManager dbManager = DbManager.getInstance();
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String actionString = req.getParameter("action");
            String action = (actionString != null) ? actionString : "list";
            switch(action){
                case("add"):
                    req.getRequestDispatcher("/jsps/planner/addPlanner.jsp").forward(req, resp);
                    break;
                case("edit"):
                    String planerId = req.getParameter("id");
                    req.setAttribute("planner", dbManager.getTaskById(planerId));
                    req.getRequestDispatcher("/jsps/planner/editPlanner.jsp").forward(req, resp);
                    break;
                case("delete"):
                    planerId = req.getParameter("id");
                    dbManager.deleteList(planerId);
                    // break;
                default:
                    List<Planner> planners = dbManager.getAllLists();
                    req.setAttribute("planners", planners);
                    req.getRequestDispatcher("/jsps/planner/listPlanner.jsp").forward(req, resp);
            }
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String actionString = req.getParameter("action");
            String action = (actionString != null) ? actionString : "list";
            // System.out.println(action);
            switch(action){
                case("add"):
                    Planner planner  = new Planner();
                    planner.setId(UUID.randomUUID());
                    planner.setName(req.getParameter("name"));
                    planner.setDescription(req.getParameter("description"));

                    dbManager.addList(planner);

                    List<Planner> planners = dbManager.getAllLists();
                    req.setAttribute("planners", planners);
                    req.getRequestDispatcher("/jsps/planner/listPlanner.jsp").forward(req, resp);
                    break;

                case("edit"):
                    planner  = new Planner();
                    planner.setId(UUID.fromString(req.getParameter("id")));
                    planner.setName(req.getParameter("name"));
                    planner.setDescription(req.getParameter("description"));

                    dbManager.updateList(planner);

                    planners = dbManager.getAllLists();
                    req.setAttribute("planners", planners);
                    req.getRequestDispatcher("/jsps/planner/listPlanner.jsp").forward(req, resp);
                    break;

                default:
                    planners = dbManager.getAllLists();
                    req.setAttribute("planners", planners);
                    req.getRequestDispatcher("/jsps/planner/listPlanner.jsp").forward(req, resp);
            }
        }
}
