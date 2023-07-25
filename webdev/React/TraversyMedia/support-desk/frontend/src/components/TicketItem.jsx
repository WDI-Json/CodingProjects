import { Link } from "react-router-dom"

function TicketItem({ ticket }) {
  return (
    <tr className="ticket">
      <td>{new Date(ticket.createdAt).toLocaleString("en-gb")}</td>
      <td>{ticket.product}</td>
      <td className={`status status-${ticket.status}`}>{ticket.status}</td>
      <td>
        <Link to={`/ticket/${ticket._id}`} className="btn btn-reverse btn-sm">
          View
        </Link>
      </td>
    </tr>
  )
}
export default TicketItem
