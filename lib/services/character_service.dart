import 'package:dio/dio.dart';
import '../models/character.dart';
import '../utils/AppException.dart';

// API isteği ve hata yönetimi

class CharacterService {
  final Dio _dio = Dio();

  Future<List<Character>> fetchCharacters() async {
    try {
      final response = await _dio.get(
        'https://hp-api.onrender.com/api/characters',
      );
      return (response.data as List).map((e) => Character.fromJson(e)).toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw AppException(
          'Sunucuya bağlanılamadı. Lütfen internet bağlantınızı kontrol edin.',
        );
      } else if (e.type == DioExceptionType.badResponse) {
        throw AppException('Sunucudan beklenmeyen bir cevap alındı.');
      } else {
        throw AppException('Bir hata oluştu. Lütfen tekrar deneyin.');
      }
    } catch (e) {
      throw AppException('Bilinmeyen bir hata oluştu. Lütfen tekrar deneyin.');
    }
  }
}
