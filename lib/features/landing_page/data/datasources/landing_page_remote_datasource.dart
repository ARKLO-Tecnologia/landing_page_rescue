import 'package:dio/dio.dart';

import 'package:rescue_pitchtech/features/landing_page/data/dto/contact_request_dto.dart';
import 'package:rescue_pitchtech/shared/config/environment.dart';
import 'package:rescue_pitchtech/shared/errors/exceptions.dart';

abstract class LandingPageRemoteDataSource {
  Future<void> submitContactRequest(ContactRequestDto request);
}

class LandingPageRemoteDataSourceImpl implements LandingPageRemoteDataSource {
  LandingPageRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> submitContactRequest(ContactRequestDto request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '${Environment.baseUrl}${Environment.contactEndpoint}',
        data: request.toJson(),
      );

      final status = response.statusCode ?? 0;
      if (status != 200 && status != 201 && status != 204) {
        throw ServerException('Erro ao enviar solicitação (${response.statusCode})');
      }
    } on DioException catch (error) {
      final message = error.response?.statusMessage ?? error.message;
      throw ServerException(message ?? 'Erro de conexão com o servidor');
    }
  }
}
