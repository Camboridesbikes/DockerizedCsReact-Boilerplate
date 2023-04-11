import React from 'react';
import './App.css';

import IWeatherForecastData from './models/IWeatherForecastData';
import http from "./http-common";



function App() {

  const [forecast, setForecast] = React.useState<IWeatherForecastData[]>([]);
  const [isLoading, setIsLoading] = React.useState<boolean>(false);
  const [error, setError] = React.useState<string>('');

  React.useEffect(() => {

    
    const getWeather = async () => {
      setIsLoading(true);
      try {
        const response = await http.get("http://localhost:5264/WeatherForecast");
        setForecast(response.data);
      } catch (error : any) {
        setError(error.message);
      }finally {
        setIsLoading(false);
      }
    }
    getWeather();
  }, []);


  if(isLoading) {
    return <div>Loading...</div>
  }

  if(error) {
    return <div>{error}</div>
  }

  return (
    <div >
      <h1>Hello world</h1>
      {forecast.map((item, index) => {

        return (
          <div key={index}>
            <p>{item.date}</p>
            <p>{item.temperatureC}</p>
            <p>{item.temperatureF}</p>
            <p>{item.summary}</p>
          </div>
        )
      }
      )}
    </div>
  );
}

export default App;
