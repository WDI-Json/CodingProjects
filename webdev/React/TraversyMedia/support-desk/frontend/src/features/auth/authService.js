import axios from "axios"
import { objectStringsToLowercase } from "../../utils"
const API_URL = "/api/users/"

// Register user
const register = async (userData) => {
  const lowercasedData = objectStringsToLowercase(userData)
  const response = await axios.post(API_URL, lowercasedData)

  if (response.data) {
    localStorage.setItem("user", JSON.stringify(response.data))
  }
  return response.data
}

// Login user
const login = async (userData) => {
  const lowercasedData = objectStringsToLowercase(userData)
  console.log(lowercasedData)
  const response = await axios.post(API_URL + "login", lowercasedData)

  if (response.data) {
    localStorage.setItem("user", JSON.stringify(response.data))
  }
  return response.data
}

// Logout user
const logout = () => localStorage.removeItem("user")

const authService = {
  register,
  logout,
  login,
}

export default authService
