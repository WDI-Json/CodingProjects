import { useRef, useState, useEffect } from "react";

function UseRefExample2() {
  const [name, setName] = useState("");
  const renders = useRef(1);
  const prevName = useRef("");

  useEffect(() => {
    renders.current++;
    prevName.current = name;
  }, [name]);

  return (
    <div>
      <h1>Renders: {renders.current}</h1>
      <h2>Prev Name State: {prevName.current}</h2>
      <input
        type="text"
        value={name}
        className="form-control mb-3"
        onChange={(e) => setName(e.target.value)}
      />
    </div>
  );
}
export default UseRefExample2;
