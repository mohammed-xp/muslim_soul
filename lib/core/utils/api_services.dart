import 'package:dio/dio.dart';

class ApiServices {
  ApiServices(this.dio);

  final Dio dio;
  // https://alquran.cloud/api
  final String _baseAlquranCloudUrl = 'http://api.alquran.cloud/v1/';

  // https://quranenc.com/ar/home#transes
  final String _baseQuranencUrl = 'https://quranenc.com/api/v1/translation/';

  // https://quranicaudio.com/api/qaris
  final String _baseQuranicAudioUrl = 'https://quranicaudio.com/api/';

  Future<Map<String, dynamic>> getFromQuranCloud({
    required String endPoint,
  }) async {
    var response = await dio.get('$_baseAlquranCloudUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> getFromQuranenc({
    required String endPoint,
  }) async {
    var response = await dio.get('$_baseQuranencUrl$endPoint');
    return response.data;
  }

  Future<dynamic> getFromQuranicAudio({
    required String endPoint,
  }) async {
    var response = await dio.get('$_baseQuranicAudioUrl$endPoint');
    return response.data;
  }
}
