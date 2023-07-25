import React, { useEffect } from "react"
import { useSelector, useDispatch } from "react-redux"
import { getTickets } from "../features/tickets/ticketSlice"

import Spinner from "../components/Spinner"
import BackButton from "../components/BackButton"
import TicketItem from "../components/TicketItem"

function Tickets() {
  const { tickets } = useSelector((state) => state.ticket)

  const dispatch = useDispatch()

  useEffect(() => {
    dispatch(getTickets())
  }, [dispatch])

  return !tickets ? (
    <Spinner />
  ) : (
    <>
      <BackButton url="/" />
      <h1 className="tickets-page-header">Active Tickets</h1>
      <div>
        <table className="tickets">
          <thead>
            <tr className="ticket-headings">
              <th>Date</th>
              <th>Product</th>
              <th>Status</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {tickets
              .filter((ticket) => ticket.status !== "closed")
              .map((ticket) => (
                <React.Fragment key={ticket._id}>
                  <TicketItem ticket={ticket} />
                </React.Fragment>
              ))}
          </tbody>
        </table>
      </div>

      <h1 className="tickets-page-header">Closed Tickets</h1>
      <div>
        <table className="tickets">
          <thead>
            <tr className="ticket-headings">
              <th>Date</th>
              <th>Product</th>
              <th>Status</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {tickets
              .filter((ticket) => ticket.status === "closed")
              .map((ticket) => (
                <React.Fragment key={ticket._id}>
                  <TicketItem ticket={ticket} />
                </React.Fragment>
              ))}
          </tbody>
        </table>
      </div>
    </>
  )
}
export default Tickets
