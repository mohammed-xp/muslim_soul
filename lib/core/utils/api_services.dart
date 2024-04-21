import 'package:dio/dio.dart';

class ApiServices {
  ApiServices(this.dio);

  final Dio dio;

  final String _baseUrl = 'http://api.alquran.cloud/v1/';

  Future<Map<String, dynamic>> getAyaOfDay({
    required String endPoint,
  }) async {
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
