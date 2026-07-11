const statusFilter = document.getElementById('status-filter');
const teamFilter = document.getElementById('team-filter');
const assigneeSearch = document.getElementById('assignee-search');
const tasksTableBody = document.querySelector('#tasks-table tbody');

const totalCountEl = document.getElementById('total-count');
const progressCountEl = document.getElementById('progress-count');
const blockedCountEl = document.getElementById('blocked-count');
const completeCountEl = document.getElementById('complete-count');

const totalProgressEl = document.getElementById('total-progress');
const progressAverageEl = document.getElementById('progress-average');
const blockedLabelEl = document.getElementById('blocked-label');
const completeRateEl = document.getElementById('complete-rate');

let tasks = [];

function statusClass(status) {
    switch (status) {
        case 'In Progress':
            return 'status-pill in-progress';
        case 'Blocked':
            return 'status-pill blocked';
        case 'Complete':
            return 'status-pill complete';
        default:
            return 'status-pill not-started';
    }
}

function priorityClass(priority) {
    switch (priority.toLowerCase()) {
        case 'high':
            return 'priority-high';
        case 'medium':
            return 'priority-medium';
        default:
            return 'priority-low';
    }
}

function renderTable(rows) {
    if (!rows.length) {
        tasksTableBody.innerHTML = '<tr><td colspan="7" class="text-center text-muted">No tasks match the filter.</td></tr>';
        return;
    }

    tasksTableBody.innerHTML = rows.map(task => `
        <tr>
            <td>${task.title}</td>
            <td>${task.assignee}</td>
            <td>${task.team}</td>
            <td><span class="${statusClass(task.status)}">${task.status}</span></td>
            <td class="${priorityClass(task.priority)}">${task.priority}</td>
            <td>${task.dueDate}</td>
            <td>
                <div class="progress" style="height: 10px;">
                    <div class="progress-bar" role="progressbar" style="width: ${task.progress}%" aria-valuenow="${task.progress}" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <small class="text-muted">${task.progress}%</small>
            </td>
        </tr>`).join('');
}

function populateTeamFilter(list) {
    const teams = Array.from(new Set(list.map(task => task.team))).sort();
    teamFilter.innerHTML = '<option value="">All</option>' + teams.map(team => `<option value="${team}">${team}</option>`).join('');
}

function applyFilters() {
    const status = statusFilter.value;
    const team = teamFilter.value;
    const assigneeTerm = assigneeSearch.value.trim().toLowerCase();

    const filtered = tasks.filter(task => {
        const matchesStatus = !status || task.status === status;
        const matchesTeam = !team || task.team === team;
        const matchesAssignee = !assigneeTerm || task.assignee.toLowerCase().includes(assigneeTerm);
        return matchesStatus && matchesTeam && matchesAssignee;
    });

    renderTable(filtered);
    refreshStats(filtered);
}

function refreshStats(list) {
    const total = list.length;
    const inProgress = list.filter(t => t.status === 'In Progress');
    const blocked = list.filter(t => t.status === 'Blocked');
    const complete = list.filter(t => t.status === 'Complete');

    totalCountEl.textContent = tasks.length;
    progressCountEl.textContent = inProgress.length;
    blockedCountEl.textContent = blocked.length;
    completeCountEl.textContent = complete.length;

    const avgProgress = list.length ? Math.round(list.reduce((sum, t) => sum + t.progress, 0) / list.length) : 0;
    const completeRate = tasks.length ? Math.round((complete.length / tasks.length) * 100) : 0;

    totalProgressEl.textContent = `${total} showing`;
    progressAverageEl.textContent = `${avgProgress}% avg`;
    blockedLabelEl.textContent = blocked.length ? 'Follow up' : 'All clear';
    completeRateEl.textContent = `${completeRate}% done`; 
}

async function loadTasks() {
    try {
        const response = await fetch('api/tasks');
        if (!response.ok) {
            throw new Error(`Failed to load tasks: ${response.status}`);
        }
        tasks = await response.json();
        populateTeamFilter(tasks);
        applyFilters();
    } catch (err) {
        console.error(err);
        tasksTableBody.innerHTML = `<tr><td colspan="7" class="text-danger text-center">${err.message}</td></tr>`;
    }
}

[statusFilter, teamFilter, assigneeSearch].forEach(control => {
    control.addEventListener('input', applyFilters);
});

document.addEventListener('DOMContentLoaded', loadTasks);
