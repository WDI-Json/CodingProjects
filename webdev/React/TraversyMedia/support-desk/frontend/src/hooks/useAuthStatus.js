import { useState, useEffect } from "react";
import { UseSelector, useSelector } from "react-redux/es/hooks/useSelector";

export const useAuthStatus = () => {
  const [loggedIn, setLoggedId] = useState(false);
  const [checkingStatus, setCheckingStatus] = useState(true);

  const { user } = useSelector((state) => state.auth);

  useEffect(() => {
    if (user) {
      setLoggedId(true);
    } else {
      setLoggedId(false);
    }
    setCheckingStatus(false);
  }, [user]);
  return { loggedIn, checkingStatus };
};
