export const Planet = (props) => {
    if (props.isGasPlanet) {
        return (
            <div>
                <h1>{props.name}</h1>
                <h1>Gasplanet = {props.isGasPlanet.toString()}</h1>
            </div>
        );
    }
};