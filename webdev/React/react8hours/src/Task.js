import styles from "./App.module.css";

export const TaskComp = (props) => {
    return (
        <div
            className={styles.task}
            style={{ backgroundColor: props.completed ? "green" : "white" }}
        >
            <h1>{props.taskName}</h1>
            <button onClick={() => props.completeTask(props.id)}> Complete </button>
            <button onClick={() => props.deleteTask(props.id)}> X </button>
        </div>
    );
};