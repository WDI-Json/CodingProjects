import { initializeApp } from "firebase/app"
// import { getAnalytics } from "firebase/analytics"
import { getFirestore } from "firebase/firestore"

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDiMU92tBVoqrIGKTC0vykKAD897bdu57c",
  authDomain: "traversy-react-course.firebaseapp.com",
  projectId: "traversy-react-course",
  storageBucket: "traversy-react-course.appspot.com",
  messagingSenderId: "604869989718",
  appId: "1:604869989718:web:fc144788db265e539b32f7",
  measurementId: "G-L61NGBPY53",
}

// Initialize Firebase
export const db = getFirestore()
// const analytics = getAnalytics(app)
