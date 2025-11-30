<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Asana Task Manager</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Asana-like Dashboard</a>
        <span class="navbar-text text-secondary">Team visibility for tasks &amp; capacity</span>
    </div>
</nav>
<main class="container my-4">
    <div class="row g-3 mb-3">
        <div class="col-sm-6 col-lg-3">
            <div class="card shadow-sm stat-card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <h6 class="card-subtitle text-muted">Total Tasks</h6>
                        <span class="badge bg-primary" id="total-count">0</span>
                    </div>
                    <div class="stat-value" id="total-progress">-</div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card shadow-sm stat-card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <h6 class="card-subtitle text-muted">In Progress</h6>
                        <span class="badge bg-info" id="progress-count">0</span>
                    </div>
                    <div class="stat-value" id="progress-average">-</div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card shadow-sm stat-card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <h6 class="card-subtitle text-muted">Blocked</h6>
                        <span class="badge bg-warning text-dark" id="blocked-count">0</span>
                    </div>
                    <div class="stat-value" id="blocked-label">-</div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card shadow-sm stat-card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <h6 class="card-subtitle text-muted">Completed</h6>
                        <span class="badge bg-success" id="complete-count">0</span>
                    </div>
                    <div class="stat-value" id="complete-rate">-</div>
                </div>
            </div>
        </div>
    </div>

    <div class="card shadow-sm mb-3">
        <div class="card-body">
            <div class="row g-3 align-items-end">
                <div class="col-md-4">
                    <label class="form-label" for="status-filter">Status</label>
                    <select id="status-filter" class="form-select">
                        <option value="">All</option>
                        <option value="Not Started">Not Started</option>
                        <option value="In Progress">In Progress</option>
                        <option value="Blocked">Blocked</option>
                        <option value="Complete">Complete</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label" for="team-filter">Team</label>
                    <select id="team-filter" class="form-select">
                        <option value="">All</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label" for="assignee-search">Assignee</label>
                    <input id="assignee-search" type="text" class="form-control" placeholder="Search by name">
                </div>
            </div>
        </div>
    </div>

    <div class="card shadow-sm">
        <div class="card-header bg-white">
            <h5 class="mb-0">Task List</h5>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0" id="tasks-table">
                    <thead class="table-light">
                    <tr>
                        <th scope="col">Title</th>
                        <th scope="col">Assignee</th>
                        <th scope="col">Team</th>
                        <th scope="col">Status</th>
                        <th scope="col">Priority</th>
                        <th scope="col">Due</th>
                        <th scope="col">Progress</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td colspan="7" class="text-center text-muted">Loading tasks...</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/app.js"></script>
</body>
</html>
