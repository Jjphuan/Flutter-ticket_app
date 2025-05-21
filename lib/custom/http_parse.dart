import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpParse {
  final dio = Dio();

  Future<Response> get(String api,[Map<String, dynamic>? queryParameter]) async{
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('locale');
    Response response =  await dio.get(
      api,
      queryParameters: queryParameter,
      options: Options(
          headers: {
            "Accept-Language": langCode
          },
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
      )
    );

    return response;
  }
}