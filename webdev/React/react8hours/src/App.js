import styles from "./App.module.css";
import { useState } from "react";
import { TaskComp } from "./Task";

function App() {
  const [todoList, setTodoList] = useState([]);
  const [newTask, setNewtask] = useState("")

  const handleChange = (event) => {
    setNewtask(event.target.value)
  };

  const addTask = () => {
    const task = {
      id: todoList.length === 0 ? 1 : todoList[todoList.length - 1].id + 1,
      taskName: newTask,
    }
    setTodoList([...todoList, task])
  }

  const deleteTask = (taskId) => {
    setTodoList(todoList.filter((task) => task.id !== taskId));
  }

  const completeTask = (id) => {
    setTodoList(
      todoList.map((task) => {
        return task.id === id ? { ...task, completed: true } : task;
      })
    );
  };

  return (
    <div className={styles.App}>
      <div className={styles.addTask}>
        <input onChange={handleChange} />
        <button onClick={addTask}> Add Task</button>
      </div>
      <div className={styles.list}>
        {todoList.map((task) => {
          return (
            <TaskComp
              taskName={task.taskName}
              id={task.id}
              completed={task.completed}
              deleteTask={deleteTask}
              completeTask={completeTask}
            />
          );
        })}
      </div>
    </div>
  );
}

export default App;
