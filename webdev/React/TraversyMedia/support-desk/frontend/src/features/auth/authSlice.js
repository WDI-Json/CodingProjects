import { createSlice, createAsyncThunk, createAction } from "@reduxjs/toolkit"
import authService from "./authService"
import { extractErrorMessage } from "../../utils"

// Get user from localstorage
const user = JSON.parse(localStorage.getItem("user"))

const initialState = {
  user: user ? user : null,
  isLoading: false,
}

export const register = createAsyncThunk(
  "auth/register",
  async (user, thunkAPI) => {
    try {
      return await authService.register(user)
    } catch (error) {
      return thunkAPI.rejectWithValue(extractErrorMessage(error))
    }
  }
)

export const login = createAsyncThunk("auth/login", async (user, thunkAPI) => {
  try {
    return await authService.login(user)
  } catch (error) {
    return thunkAPI.rejectWithValue(extractErrorMessage(error))
  }
})

export const logout = createAction("auth/logout", () => {
  authService.logout()
  //Return empty object we don't need, but prepare function requires
  return {}
})

export const authSlice = createSlice({
  name: "auth",
  initialState,
  reducers: {
    logout: (state) => {
      state.user = null
    },
  },
  extraReducers: (builder) => {
    builder
      // Register
      .addCase(register.pending, (state) => {
        state.isLoading = true
      })
      .addCase(register.fulfilled, (state, action) => {
        state.user = action.payload
        state.isLoading = false
      })
      .addCase(register.rejected, (state) => {
        state.isLoading = false
      })
      // Login
      .addCase(login.fulfilled, (state, action) => {
        state.user = action.payload
        state.isLoading = false
      })
      .addCase(login.pending, (state) => {
        state.isLoading = true
      })
      .addCase(login.rejected, (state) => {
        state.isLoading = false
      })
  },
})

export default authSlice.reducer
