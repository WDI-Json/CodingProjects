import { createContext, useReducer } from "react"
import githubReducer from "./GithubReducer"

const GithubContext = createContext()

const GITHUB_URL = process.env.REACT_APP_GITHUB_URL
const GITHUB_TOKEN = "add later"

export const GithubProvider = ({ children }) => {
  const initialState = {
    users: [],
    user: {},
    loading: false,
  }

  const [state, dispatch] = useReducer(githubReducer, initialState)

  const searchUsers = async (text) => {
    setLoading()
    const params = new URLSearchParams({
      q: text,
    })
    const response = await fetch(
      `${GITHUB_URL}/search/users?${params}`
      //* you did not use a token
      //     , {
      //         headers: {
      //         Authorization: `token ${GITHUB_TOKEN}`
      //     }
      //   }
    )

    const { items } = await response.json()
    dispatch({
      type: "GET_USERS",
      payload: items,
    })
  }

  const getUser = async (login) => {
    setLoading()

    const response = await fetch(
      `${GITHUB_URL}/users/${login}`
      //* you did not use a token
      //     , {
      //         headers: {
      //         Authorization: `token ${GITHUB_TOKEN}`
      //     }
      //   }
    )

    if (response.status === 404) {
      window.location = "/notfound"
    } else {
      const data = await response.json()
      dispatch({
        type: "GET_USER",
        payload: data,
      })
    }
  }

  const setLoading = () => {
    dispatch({ type: "SET_LOADING" })
  }

  const clearUsers = () => {
    dispatch({
      type: "ClEAR_USERS",
    })
  }
  return (
    <GithubContext.Provider
      value={{
        users: state.users,
        user: state.user,
        loading: state.loading,
        searchUsers,
        clearUsers,
        getUser,
      }}
    >
      {children}
    </GithubContext.Provider>
  )
}

export default GithubContext
