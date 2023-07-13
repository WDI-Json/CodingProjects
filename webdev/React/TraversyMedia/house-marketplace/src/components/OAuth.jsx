import { useLocation, useNavigate } from "react-router-dom"
import { getAuth, signInWithPopup, GoogleAuthProvider } from "firebase/auth"
import { doc, setDoc, getDoc, serverTimestamp } from "firebase/firestore"
import { db } from "../firebase.config"
import { toast } from "react-toastify"
import googleIcon from "../assets/svg/googleIcon.svg"

function OAuth() {
  const navigate = useNavigate()
  const location = useLocation()

  const onGoogleClick = async () => {
    try {
      const auth = getAuth()
      const provider = new GoogleAuthProvider()
      const result = await signInWithPopup(auth, provider)
      const user = result.user

      // Check for user in DB
      const docref = doc(db, "users", user.uid)
      const docSnap = await getDoc(docref)
      // Add if when not present
      if (!docSnap.exists()) {
        await setDoc(doc(db, "users", user.uid), {
          firstName: user.displayName,
          lastName: user.displayName,
          email: user.email,
          createdAt: serverTimestamp(),
        })
      }
      navigate("/")
    } catch (error) {
      toast.error("Could not authorize with Google")
    }
  }
  return (
    <div className="socialLogin">
      <p>
        Sign {location.pathname === "/sign-up" ? "up" : "in"}
        with
      </p>
      <button className="socialIconDiv" onClick={onGoogleClick}>
        <img className="socialIconImg" src={googleIcon} alt="google auth" />
      </button>
    </div>
  )
}

export default OAuth
