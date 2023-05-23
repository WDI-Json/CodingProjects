import { useState } from "react";
import { login, logout } from "../store";
import { useDispatch, useSelector } from "react-redux";

export const Login = () => {
  const [newUserName, setnewUserName] = useState("");
  const dispatch = useDispatch();
  const userName = useSelector((state: any) => state.user.value.username);

  return (
    <div>
      <h1>THIS IS THE LOGIN PAGE {userName}</h1>
      <input onChange={(e) => setnewUserName(e.target.value)} />
      <button onClick={() => dispatch(login({ username: newUserName }))}>
        Submit login
      </button>
      <button onClick={() => dispatch(logout())}>Logout</button>
    </div>
  );
};
