import styles from "./App.module.css";
import { useEffect, useState } from "react";
import Axios from "axios";

function App() {
  const [generatedExcuse, setGeneratedExcuse] = useState("")

  const fetchExcuse = (excuse) => {
    Axios.get(`https://excuser-three.vercel.app/v1/excuse/${excuse}`)
      .then((response) => {
        setGeneratedExcuse(response.data[0].excuse)
      })
  }

  return (
    <div className={styles.App}>
      <h1>Generate an excuse!</h1>
      <button onClick={() => fetchExcuse("party")}>Party</button>
      <button onClick={() => fetchExcuse("family")}>Family</button>
      <button onClick={() => fetchExcuse("office")}>Office</button>
      <button onClick={() => fetchExcuse("children")}>Children</button>
      <button onClick={() => fetchExcuse("college")}>College</button>
      <button onClick={() => fetchExcuse("developers")}>Developers</button>
      <p>{generatedExcuse}</p>
    </div>
  );
}

export default App;
