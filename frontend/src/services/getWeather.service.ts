import http from "../http-common";
import IWeatherForecastData from "../models/IWeatherForecastData";

export class GetWeatherService {

 public async getWeatherForecast(): Promise<IWeatherForecastData> {
    return await http.get("/WeatherForecast");
    }
}