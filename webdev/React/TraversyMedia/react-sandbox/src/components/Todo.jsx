import { useState, useEffect, useRef } from "react";

function Todo() {
  const [loading, setLoading] = useState(true);
  const [todo, setTodo] = useState({});

  useEffect(() => {
    const controller = new AbortController();
    fetch("https://jsonplaceholder.typicode.com/todos/1", {
      signal: controller.signal,
    })
      .then((response) => response.json())
      .then((data) => {
        setTimeout(() => {
          setTodo(data);
          setLoading(false);
        }, 3000);
      });
  }, []);
  return loading ? <h3>Loading...</h3> : <h1>{todo.title}</h1>;
}
export default Todo;
