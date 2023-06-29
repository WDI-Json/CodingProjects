import PropTypes from "prop-types";

function Header({ text }) {
  return (
    <header>
      <div className="container"></div>
      <h2>{text}</h2>
    </header>
  );
}

Header.defaultProps = {
  text: "Feedback UI",
};

Header.PropTypes = {
  text: PropTypes.string,
};

export default Header;
