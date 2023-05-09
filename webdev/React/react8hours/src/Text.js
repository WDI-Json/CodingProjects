import React from "react";
import { useState, useEffect } from "react";

export const Text = (props) => {
    const [text, setText] = useState("");

    useEffect(() => {
        console.log("Component mounted")
        return () => {
            console.log("Component unmounted")
        }
    }, [])
    return (
        <div>
            <input
                onChange={(event) => {
                    setText(event.target.value);
                }} />

            <h1> {text} </h1>
        </div>
    )
} 