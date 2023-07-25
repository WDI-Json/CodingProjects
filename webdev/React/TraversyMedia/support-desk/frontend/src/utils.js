export function extractErrorMessage(error) {
  return error.response?.data?.message || error.message || error.toString()
}

// Function to recursively convert all string values to lowercase
export function objectStringsToLowercase(obj) {
  const newObj = obj

  for (const key in newObj) {
    const value = obj[key]
    if (typeof value === "string") {
      newObj[key] = value.toLowerCase()
    }
  }
  return newObj
}

const utils = {
  extractErrorMessage,
  objectStringsToLowercase,
}

export default utils
