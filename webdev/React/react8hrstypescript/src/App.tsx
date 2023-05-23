import './App.css';
import { Person, Country, Props } from './components/Person';

function App() {

const persons: Props[] = [
  {
    name: "John",
    email: "john@example.com",
    age: 25,
    isMarried: false,
    friends: [],
    country: Country.Brazil
},
{
    name: "Emily",
    email: "emily@example.com",
    age: 30,
    isMarried: true,
    friends: [],
    country: Country.Canada
},
{
    name: "Michael",
    email: "michael@example.com",
    age: 35,
    isMarried: true,
    friends: [],
    country: Country.France
}
]



  return (
    <div className="App">
      <Person
                name="Wouter"
                email="Wouter@mail.com"
                age={29}
                isMarried={true}
                friends={persons}
                country= {Country.Brazil}
            />
    </div>
  );
}

export default App;
