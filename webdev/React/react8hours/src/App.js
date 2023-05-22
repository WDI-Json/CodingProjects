import styles from "./App.module.css";
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import { Home } from "./pages/Home";
import { Profile } from "./pages/Profile";
import { Contact } from "./pages/Contact";
import { Navbar } from "./pages/Navbar";
import { useState, createContext } from "react";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { Form } from "./pages/Form";
import { useToggle } from "./Components/useToggle";
import { Cat } from "./Components/Cat";
import { CounterPage } from "./pages/CounterPage";
export const AppContext = createContext();

function App() {
  const [userName, setUserName] = useState("Wouter")
  const client = new QueryClient({
    defaultOptions: {
      queries: {
        refetchOnWindowFocus: false
      }
    }
  })

  const [isVisible, toggle] = useToggle()
  const [isVisible2, toggle2] = useToggle()

  return (
    <div className={styles.App}>
      <QueryClientProvider client={client}>
        <AppContext.Provider value={{ userName, setUserName }}>
          <Router>
            <Navbar />
            <Routes>
              <Route path="/" element={<Home />} />
              <Route path="/profile" element={<Profile />} />
              <Route path="/contact" element={<Contact />} />
              <Route path="/counter" element={<CounterPage />} />
              <Route path="*" element={<h1> PAGE NOT FOUND</h1>} />
            </Routes>
          </Router>
        </AppContext.Provider>
      </QueryClientProvider>


      <button onClick={toggle}>{isVisible ? "Hide" : "Show"}</button>
      {isVisible && <h1>Hidden text!</h1>}
      <button onClick={toggle2}>{isVisible2 ? "Hide" : "Show"}</button>
      {isVisible2 && <h1>Hidden text2!</h1>}

    </div >
  );
}

export default App;
