<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>To-Do List</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      max-width: 400px;
      margin: 50px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
    }
    input[type="text"] {
      width: 70%;
      padding: 8px;
      font-size: 16px;
    }
    button {
      padding: 8px 15px;
      font-size: 16px;
      margin-left: 5px;
      cursor: pointer;
    }
    ul {
      margin-top: 20px;
      padding-left: 20px;
    }
    li {
      padding: 6px 0;
      border-bottom: 1px solid #eee;
    }
  </style>
</head>
<body>
  <h2>To-Do List</h2>
  <input type="text" id="taskInput" placeholder="Enter new task..." />
  <button id="addBtn">Add</button>

  <ul id="taskList"></ul>

  <script>
    const taskInput = document.getElementById('taskInput');
    const addBtn = document.getElementById('addBtn');
    const taskList = document.getElementById('taskList');

    let tasks = [];

    function renderTasks() {
      // Use map to create list item strings and join them
      taskList.innerHTML = tasks
        .map(task => `<li>${task}</li>`)
        .join('');
    }

    addBtn.addEventListener('click', () => {
      const newTask = taskInput.value.trim();
      if (newTask) {
        tasks.push(newTask);
        renderTasks();
        taskInput.value = '';
        taskInput.focus();
      }
    });

    // Optional: add task when pressing Enter key
    taskInput.addEventListener('keypress', e => {
      if (e.key === 'Enter') addBtn.click();
    });
  </script>
</body>
</html>
