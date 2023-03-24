import "./App.css";

function App() {

  return <div className="App">
    <User name="Wouter" age={29} email="wouterdijks.com" />
    <Job salary={239000} position="React developer" company="Arcady"/>
  </div>;
}

const User = (props) => {
  return (
    <div>
     <h1>{props.name}</h1>
     <h1>{props.age}</h1>
     <h1>{props.email}</h1>
    </div>
  );
};

const Job = (props) => {
  return (
    <div>
     <h1>{props.salary}</h1>
     <h1>{props.position}</h1>
     <h1>{props.company}</h1>
    </div>
  );
};

export default App;
