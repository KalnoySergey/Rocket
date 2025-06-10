import 'package:dio/dio.dart';
import '../domain/object_model.dart';

class ObjectRepository {
  final Dio _dio = Dio();

  Future<List<ObjectModel>> fetchObjects() async {
    final response = await _dio.get('https://api.restful-api.dev/objects');
    if (response.statusCode == 200 && response.data is List) {
      return (response.data as List).map((json) => ObjectModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load objects');
    }
  }
}
