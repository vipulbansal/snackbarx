/*Imagine you are developing a Flutter app for a weather forecast service.
The app needs to create a Weather object that can be initialized with either a city name and
\temperature or with a city name, temperature, and additional weather details (e.g., humidity,
wind speed). How would you design the Weather class using constructors, and how would you handle
situations where some details might be missing or optional? */
class Weather {
 String? city;
 double? temperature;
 double? humidity;// Nullable property
 double? windSpeed;

 Weather(this.city, this.temperature, this.humidity,
     this.windSpeed);

 Weather.name({required this.temperature, required this.city,this.windSpeed, this.humidity}); // Nullable property

 factory  Weather.fact({double? temperature, String? city,double? windSpeed, double? humidity}){

   if(temperature!=null && city!=null){
     return Weather.name(temperature: temperature, city: city,humidity: humidity,windSpeed: windSpeed);
   }
   else{
     return Weather(city,temperature,humidity,windSpeed);
   }
 }
}

Future<int> calculate() async{

  int result= await delay();
  print(result);
  return 6 * 7;
}


Future<int> delay()async{
  await Future.delayed(Duration(seconds: 1));
  return 1;
}
