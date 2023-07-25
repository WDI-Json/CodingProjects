import { Link } from "react-router-dom"

function TicketItem({ ticket }) {
  const { createdAt, product, status, _id } = ticket
  return (
    <tr className="ticket">
      <td>{new Date(createdAt).toLocaleString("en-gb")}</td>
      <td>{product}</td>
      <td className={`status status-${status}`}>{status}</td>
      <td>
        <Link to={`/ticket/${_id}`} className="btn btn-reverse btn-sm">
          View
        </Link>
      </td>
    </tr>
  )
}
export default TicketItem
