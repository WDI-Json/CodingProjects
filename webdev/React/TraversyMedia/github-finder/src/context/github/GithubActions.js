const GITHUB_URL = process.env.REACT_APP_GITHUB_URL
// eslint-disable-next-line
const GITHUB_TOKEN = "add later"

export const searchUsers = async (text) => {
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
  return items
}

export const getUserRepos = async (login) => {
  const params = new URLSearchParams({
    sort: "created",
    per_page: 10,
  })
  const response = await fetch(
    `${GITHUB_URL}/users/${login}/repos?${params}`
    //* you did not use a token
    //     , {
    //         headers: {
    //         Authorization: `token ${GITHUB_TOKEN}`
    //     }
    //   }
  )

  return await response.json()
}

export const getUser = async (login) => {
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
    return await response.json()
  }
}
