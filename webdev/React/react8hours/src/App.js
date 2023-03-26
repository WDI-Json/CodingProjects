import styles from "./App.module.css";
import { Planet } from "./Planets";


function App() {
  const planets = [
    { name: "Mars", isGasPlanet: false },
    { name: "Earth", isGasPlanet: false },
    { name: "Jupiter", isGasPlanet: true },
    { name: "Venus", isGasPlanet: false },
    { name: "Neptune", isGasPlanet: true },
    { name: "Uranus", isGasPlanet: true },
  ];

  return (
    <div className={styles.App}>
      {planets.map((planet, key) => {
        return <Planet name={planet.name} isGasPlanet={planet.isGasPlanet} />
      })}
    </div>
  );
}

export default App;
