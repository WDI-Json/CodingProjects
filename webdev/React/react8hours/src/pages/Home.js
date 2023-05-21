import { isError, useQuery } from "@tanstack/react-query"
import Axios from "axios";

export const Home = () => {
    const {
        data: catData,
        isLoading,
        isError,
        refetch
    } = useQuery(["cat"], () => {
        return Axios.get("https://catfact.ninja/fact").then((res) => res.data)
    });

    if (isError) {
        return <h1>ERROR NO CAT FOR U</h1>
    }

    if (isLoading) {
        return <h1>LOADING CATFACT</h1>
    }
    return (
        <h1>
            This is homepage.
            <p>{catData?.fact}</p>
            <button onClick={refetch}>UPDATE DATA</button>
        </h1>
    )
}