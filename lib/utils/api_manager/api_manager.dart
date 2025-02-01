import 'package:aurora_movies/utils/shared_preferences_manager/shared_preferences_manager.dart';
import 'package:dio/dio.dart';

class ApiManager {
  final Dio _dio;
  final SharedPreferencesManager _sharedPreferencesManager;
  String? _baseUrl;
  String? _fileSize;

  ApiManager({Dio? dio, required SharedPreferencesManager sharedPreferencesManager})
      : _dio = dio ??
            Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3/', headers: {
              'accept': 'application/json',
              // this is hardcoded here since theres no login and the token is always the same
              'Authorization':
                  'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNWQ3YjBhMTNmOGNlODBmOTBlOWFmMGVhNDA2NGEwOCIsIm5iZiI6MTczNzk3Njc2Mi43Miwic3ViIjoiNjc5NzZiYmEwOWMyNTJlM2FiMjNjZmQ1Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.kPzZAQJ7IsvFHJhwV7JcQX7u13JqcLg0sILfDenLjio',
            })),
        _sharedPreferencesManager = sharedPreferencesManager;

  Future<void> initializeAuthToken() async {
    final token = await _sharedPreferencesManager.getAuthKey();
    if (token != null) {
      setAuthToken(token);
    }
  }

  void setAuthToken(String token) {
    // this is how it should be when the token changes
    // _dio.options.headers['Authorization'] = 'Bearer $token';
    _dio.options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNWQ3YjBhMTNmOGNlODBmOTBlOWFmMGVhNDA2NGEwOCIsIm5iZiI6MTczNzk3Njc2Mi43Miwic3ViIjoiNjc5NzZiYmEwOWMyNTJlM2FiMjNjZmQ1Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.kPzZAQJ7IsvFHJhwV7JcQX7u13JqcLg0sILfDenLjio';
    _dio.options.headers['accept'] = 'application/json';
  }

  Future<void> fetchConfiguration() async {
    try {
      // this wont be needed since the token is hardcoded
      await initializeAuthToken();

      final response = await _dio.get('/configuration');
      if (response.statusCode == 200) {
        _baseUrl = response.data['images']['base_url'];
        // since I dont really know the sizes and Im assuming they go from small to big, ill get an average one
        _fileSize = response.data['images']['poster_sizes'].last;
      } else {
        throw Exception('Failed to load configuration');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load configuration: ${e.message}');
    }
  }

  String getImageUrl(String filePath) {
    if (_baseUrl == null || _fileSize == null) {
      throw Exception('Configuration not loaded');
    }
    return '$_baseUrl$_fileSize$filePath';
  }

  // Method to make a GET request
  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioError catch (e) {
      // Handle DioError here if needed
      throw Exception('Failed to load data: ${e.message}');
    }
  }

  // Method to make a GET request with pagination
  Future<Response> getPaginatedData({
    required String endpoint,
    required int page,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: {
          ...?queryParameters,
          'page': page,
        },
      );
      return response;
    } on DioError catch (e) {
      // Handle DioError here if needed
      throw Exception('Failed to load data: ${e.message}');
    }
  }
}
