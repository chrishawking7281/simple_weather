import 'package:dio/dio.dart';

class WeatherRemoteDataSource {
  //dio
  Future<Map<String, dynamic>?> getWeatherData({
    required String city,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'http://api.weatherapi.com/v1/current.json?key=d6439f2e2f8a4b8eb1d160542230901&q=$city&aqi=no');
      return response.data; //zczytujemy z restapi
    } on DioError catch (error) {
      throw Exception(error.response?.data['error']['message'] ?? 'Unknow error');
    }
  }
}
