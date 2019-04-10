package ro.siit.servlet;

import ro.siit.model.old.DatabaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

    @WebServlet(urlPatterns = {"/home"})
    public class Homepage extends HttpServlet {

        private DatabaseManager dbManager = DatabaseManager.getInstance();
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String actionString = req.getParameter("action");
            String action = (actionString != null) ? actionString : "list";


        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String actionString = req.getParameter("action");
            String action = (actionString != null) ? actionString : "list";
            switch(action){

        }
    }

}
