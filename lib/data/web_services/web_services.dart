import '../../constants/constants.dart';
import 'package:dio/dio.dart';

class CharactersWebSercives {
  static Dio dio;
  CharactersWebSercives() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(baseOptions);
  }
  // Method GET Data From API
  static Future<List<dynamic>> getData(
    String url,
  ) async {
    try {
      Response response = await dio.get(url);
      print(response.data.toString());
      return response.data;
    } catch (error) {
      // print(error.toString());
      return [];
    }
  }

  // Method GET Qoutes
  static Future<List<dynamic>> getQoutes(
    String url,
    String charName,
  ) async {
    try {
      Response response = await dio.get(
        url,
        queryParameters: {'author': charName},
      );
      return response.data;
    } catch (error) {
      return [];
    }
  }
}
