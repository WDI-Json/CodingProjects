import { useSelector } from "react-redux";

export const Home = () => {
  const userName = useSelector((state: any) => state.user.value.username);
  return (
    <div>
      <h1>homepage</h1>
      <p>Welcome {userName} </p>
    </div>
  );
};
