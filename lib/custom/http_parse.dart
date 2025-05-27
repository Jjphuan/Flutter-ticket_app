import 'package:GoTravel/custom/endpoint.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpParse {
  final dio = Dio();

  Future<Response> get(String api,[Map<String, dynamic>? queryParameter]) async{
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('locale') ?? 'en';
    Response response =  await dio.get(
      "${Endpoint.domain}$api",
      queryParameters: queryParameter,
      options: Options(
          headers: {
            "Accept-Language": langCode,
            "Accept": 'application/json',
          },
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
      )
    );

    print("XXXX $response");
    return response;
  }

  Future<Response> post(String api,[Map<String, dynamic>? body]) async{
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('locale') ?? 'en';
    final token = prefs.getString('token');
    Response response =  await dio.post(
        "${Endpoint.domain}$api",
        data: body,
        options: Options(
          headers: {
            "Accept-Language": langCode,
            "Accept": 'application/json',
            'Authorization': 'Bearer $token'
          },
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        )
    );

    print("XXXX $response");
    return response;
  }

  /* handle Error */
  static String handleErrorMessage(DioException err) {
    String errorMessage = 'Unknown error';

    final data = err.response?.data;
    if (data is Map && data.containsKey('errors')) {
      final errors = data['errors'] as Map<String, dynamic>;
      errorMessage = errors.values.first[0]; // first error message
    } else if (data is Map && data.containsKey('message')) {
      errorMessage = data['message'];
    }

    print("xxxx ErrorMessage: $errorMessage");
    return errorMessage;
  }
}