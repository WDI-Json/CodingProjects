import { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { getTickets, reset } from "../features/tickets/ticketSlice";
import Spinner from "../components/Spinner";
import BackButton from "../components/BackButton";

function Tickets() {
  const { user } = useSelector((state) => state.auth);
  const { tickets, isLoading, isSucces } = useSelector((state) => state.ticket);

  const dispatch = useDispatch();

  useEffect(() => {
    return () => {
      if (isSucces) {
        dispatch(reset());
      }
    };
  }, [dispatch, isSucces]);

  useEffect(() => {
    dispatch(getTickets());
  }, [dispatch]);

  if (isLoading) {
    <Spinner />;
  }

  return <div>Tickets</div>;
}
export default Tickets;
