import { useGetCat } from "./useGetCat"

export const Cat = () => {
    const { data, isCatLoading, refetchData } = useGetCat()
    if (isCatLoading) {
        return <h1>LOADING CATFACT</h1>
    }
    return (
        <h1>
            <p>{data?.fact}</p>
            <button onClick={refetchData}>UPDATE DATA</button>
        </h1>
    )
}