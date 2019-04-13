package ro.siit.model;

import ro.siit.entity.Planner;
import ro.siit.entity.Task;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class DbManager {

    private Connection connection;

    private static DbManager instance;

    private DbManager(String type, String host, String port, String dbName, String user, String pw) {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("Can’t load driver. Verify CLASSPATH");
            System.err.println(e.getMessage());
        }

        this.connection = buildConnection(type, host, port, dbName, user, pw);
    }

    public static DbManager getInstance() {
        if (instance == null) {
            instance = new DbManager("postgresql", "localhost", "5432", "daily_planner", "postgres", "Tombola14.");
        }
        return instance;
    }

    private Connection buildConnection(String type, String host, String port, String dbName, String user, String pw) {
        DriverManager.setLoginTimeout(60);  // wait 1 min; optional: DB may be busy, good to set a higher timeout
        try {
            String url = new StringBuilder()
                    .append("jdbc:")
                    .append(type)       // “mysql” / “db2” / “mssql” / “oracle” / ...
                    .append("://")
                    .append(host)
                    .append(":")
                    .append(port)
                    .append("/")
                    .append(dbName)
                    .append("?user=")
                    .append(user)
                    .append("&password=")
                    .append(pw).toString();
            return DriverManager.getConnection(url);
        } catch (SQLException e) {
            System.err.println("Cannot connect to the database: " + e.getMessage());
        }
        return null;
    }

    public List<Task> getAllTasks() {
        List<Task> allTasks = new ArrayList<>();

        try (Statement statement = connection.createStatement()) {
            ResultSet tasks = statement.executeQuery("SELECT * FROM tasks order by name asc");
            while (tasks.next()) {
                Task task = new Task();
                task.setId(UUID.fromString(tasks.getString(1)));
                task.setPlanId((UUID.fromString(tasks.getString(2))));
                task.setName(tasks.getString(3));
                task.setDescription(tasks.getString(4));
                task.setDate(tasks.getDate(5));
                task.setStatus(tasks.getString(6));
                allTasks.add(task);
            }
        } catch (SQLException sqlEx) {
            System.out.println(sqlEx);
        }

        return allTasks;
    }

    public Task getTaskById(String id) {
        Task task = new Task();
        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM tasks WHERE id = ?")) {
            statement.setObject(1, UUID.fromString(id));
            ResultSet taskResult = statement.executeQuery();
            taskResult.next();
            task.setId(UUID.fromString(taskResult.getString(1)));
            task.setPlanId(UUID.fromString(taskResult.getString(2)));
            task.setName(taskResult.getString(3));
            task.setDescription(taskResult.getString(4));
            task.setDate(taskResult.getDate(5));
            task.setStatus(taskResult.getString(6));
            System.out.println("caut task-ul: " + task.getName() + " cu id-ul: " + task.getId());
        } catch (SQLException sqlEx){
            System.out.println(sqlEx);
        }

        return task;
    }

    public void addTask(Task task) {
        try {
            PreparedStatement insertStatement = connection.prepareStatement("INSERT INTO tasks VALUES (? , ?, ?, ?, ?, ?)");
            insertStatement.setObject(1, task.getId());
            insertStatement.setObject(2, task.getPlanId());
            insertStatement.setString(3, task.getName());
            insertStatement.setString(4, task.getDescription());
            insertStatement.setDate(5, task.getDate());
            insertStatement.setString(6, task.getStatus());

            insertStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void updateTask(Task task) {
        try {
            PreparedStatement insertStatement = connection.prepareStatement("UPDATE tasks SET name = ?,description = ?, date = ?, status = ?, plan_id = ? WHERE id = ?");
            insertStatement.setObject(6, task.getId());
            insertStatement.setString(1, task.getName());
            insertStatement.setString(2, task.getDescription());
            insertStatement.setObject(3, new Timestamp(task.getDate().getTime()));
            insertStatement.setString(4, task.getStatus());
            insertStatement.setObject(5, task.getPlanId());
            System.out.println("query de update, boss:");
            System.out.println(insertStatement);
            insertStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteTask (String id) {
        try {
            PreparedStatement insertStatement = connection.prepareStatement("DELETE FROM tasks WHERE id = ?");
            insertStatement.setObject(1, UUID.fromString(id));
            insertStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void changeTaskStatus (String id){
        try {
            System.out.println("schimb statusul pentru: " + id);
            PreparedStatement insertStatement = connection.prepareStatement("UPDATE tasks SET status = 'Completed' WHERE id = ?");
            insertStatement.setObject(1, UUID.fromString(id));
            insertStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public List<Planner> getAllLists() {
        List<Planner> allLists = new ArrayList<>();

        try (Statement statement = connection.createStatement()) {
            ResultSet plans = statement.executeQuery("SELECT * FROM plans order by name asc");
            while(plans.next()){
                Planner plan = new Planner();
                plan.setId(UUID.fromString(plans.getString(1)));
                plan.setName(plans.getString(2));
                plan.setDescription(plans.getString(3));
                allLists.add(plan);
            }
        } catch (SQLException sqlEx){
            System.out.println(sqlEx);
        }

        return allLists;
    }

    public Planner getListById(String id) {
        Planner planner = new Planner();
        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM plans WHERE id = ?")) {
            statement.setObject(1, UUID.fromString(id));
            ResultSet plannerResult = statement.executeQuery();
            plannerResult.next();
            planner.setId(UUID.fromString(plannerResult.getString(1)));
            planner.setName(plannerResult.getString(2));
            planner.setDescription(plannerResult.getString(3));
        } catch (SQLException sqlEx){
            System.out.println(sqlEx);
        }

        return planner;
    }


    public void updateList(Planner planner) {
        try {
            PreparedStatement insertStatement = connection.prepareStatement("UPDATE plans SET name = ?, description = ? WHERE id = ?");
            insertStatement.setObject(3, planner.getId());
            insertStatement.setString(1, planner.getName());
            insertStatement.setString(2, planner.getDescription());
            insertStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteList(String id) {
        try {
            PreparedStatement insertStatement = connection.prepareStatement("DELETE FROM plans WHERE id = ?");
            insertStatement.setObject(1, UUID.fromString(id));
            insertStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void addList(Planner planner){
        try {
            PreparedStatement insertStatement = connection.prepareStatement("INSERT INTO plans VALUES (?, ?, ?)");
            insertStatement.setObject(1, planner.getId());
            insertStatement.setString(2, planner.getName());
            insertStatement.setString(3, planner.getDescription());
            insertStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//    public Task getTasksFromList(String id) {
//        Task task = new Task();
//        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM tasks WHERE plan_id = ?")) {
//            statement.setObject(1, UUID.fromString(id));
//            ResultSet taskResult = statement.executeQuery();
//            taskResult.next();
//            task.setId(UUID.fromString(taskResult.getString(1)));
//            task.setPlanId(UUID.fromString(taskResult.getString(2)));
//            task.setName(taskResult.getString(3));
//            task.setDescription(taskResult.getString(4));
//            task.setDate(taskResult.getDate(5));
//            task.setStatus(taskResult.getString(6));
//        } catch (SQLException sqlEx){
//            System.out.println(sqlEx);
//        }
//
//        return task;
//    }
//
}
