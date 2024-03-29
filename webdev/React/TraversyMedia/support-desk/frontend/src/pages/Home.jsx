import { FaQuestionCircle, FaTicketAlt } from "react-icons/fa"
import { useSelector } from "react-redux"
import { Link } from "react-router-dom"

function Home() {
  const { user } = useSelector((state) => state.auth)

  return (
    <>
      <section className="heading">
        <h1>
          {user && `Welcome ${user.name},`} <br></br> What do you need help
          with?
        </h1>
        <p>Please choose from an option below</p>
      </section>

      <Link to="/new-ticket" className="btn btn-reverse btn-block">
        <FaQuestionCircle />
        Create New Ticket
      </Link>

      <Link to="/tickets" className="btn btn btn-block">
        <FaTicketAlt />
        View my Tickets
      </Link>
    </>
  )
}
export default Home
