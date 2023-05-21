import styles from "./App.module.css";
import { useEffect, useState } from "react";
import Axios from "axios";

function App() {
  const [catFact, setCatFact] = useState("");
  const catUrl = "https://catfact.ninja/fact"

  useEffect(() => {
    getCatfact()
  }, [])
  const getCatfact = () => {
    Axios.get(catUrl).then((response) => {
      setCatFact(response.data.fact)
    })
  }

  return (
    <div className={styles.App}>
      <button onClick={() => {
        getCatfact()
      }}>Generate Cat Fact
      </button>
      <p>{catFact}</p>
    </div>
  );
}

export default App;
