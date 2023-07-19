const express = require("express");
const router = express.Router();
const {
  registerLogin,
  registerUser,
} = require("../controllers/userController");

router.post("/", registerUser);
router.post("/login", registerLogin);

module.exports = router;
