package com.example.asana;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "TaskServlet", urlPatterns = {"/api/tasks"})
public class TaskServlet extends HttpServlet {
    private static final Gson GSON = new GsonBuilder().setPrettyPrinting().create();

    private static final List<Task> SAMPLE_TASKS = Arrays.asList(
            new Task(1, "Design onboarding flow", "Alice", "In Progress", "2024-06-28", "High", 60, "Product"),
            new Task(2, "Prepare Q3 roadmap", "Bob", "Not Started", "2024-07-05", "Medium", 0, "Strategy"),
            new Task(3, "Implement SSO integration", "Charlie", "In Progress", "2024-07-12", "High", 35, "Engineering"),
            new Task(4, "Migrate analytics events", "Dana", "Blocked", "2024-06-24", "High", 20, "Data"),
            new Task(5, "Customer health review", "Eve", "Complete", "2024-06-18", "Low", 100, "Customer Success"),
            new Task(6, "QA regression suite", "Frank", "In Progress", "2024-06-30", "Medium", 50, "QA"),
            new Task(7, "Revamp marketing site", "Grace", "Not Started", "2024-07-15", "Medium", 0, "Marketing"),
            new Task(8, "Capacity planning", "Heidi", "In Progress", "2024-06-27", "Low", 40, "Operations")
    );

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(GSON.toJson(SAMPLE_TASKS));
    }

    private static class Task {
        private final int id;
        private final String title;
        private final String assignee;
        private final String status;
        private final String dueDate;
        private final String priority;
        private final int progress;
        private final String team;

        Task(int id, String title, String assignee, String status, String dueDate, String priority, int progress, String team) {
            this.id = id;
            this.title = title;
            this.assignee = assignee;
            this.status = status;
            this.dueDate = dueDate;
            this.priority = priority;
            this.progress = progress;
            this.team = team;
        }
    }
}
