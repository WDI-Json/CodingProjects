import styles from "./App.module.css";
import { Planet } from "./Planets";
import { useState } from "react";

// function App() {
//   const planets = [
//     { name: "Mars", isGasPlanet: false },
//     { name: "Earth", isGasPlanet: false },
//     { name: "Jupiter", isGasPlanet: true },
//     { name: "Venus", isGasPlanet: false },
//     { name: "Neptune", isGasPlanet: true },
//     { name: "Uranus", isGasPlanet: true },
//   ];

//   return (
//     <div className={styles.App}>
//       {planets.map((planet, key) => {
//         return <Planet name={planet.name} isGasPlanet={planet.isGasPlanet} />
//       })}
//     </div>
//   );
// }
function App() {
  const [count, setNumber] = useState(0);

  return (
    <div className={styles.App}>
      <button onClick={() => {
        setNumber(count + 1)
      }}>Increase</button>

      <button onClick={() => {
        setNumber(count - 1)
      }}>Decrease</button>

      <button onClick={() => {
        setNumber(0)
      }}>Reset to 0</button>

      <h1>Current number is {count}</h1>
    </div >
  );
}

export default App;
