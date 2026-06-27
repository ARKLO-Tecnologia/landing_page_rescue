import 'package:dartz/dartz.dart';

import 'package:rescue_pitchtech/features/landing_page/data/datasources/landing_page_local_datasource.dart';
import 'package:rescue_pitchtech/features/landing_page/data/datasources/landing_page_remote_datasource.dart';
import 'package:rescue_pitchtech/features/landing_page/data/mappers/contact_request_mapper.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/entities/contact_request.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/entities/landing_content.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/repositories/landing_page_repository.dart';
import 'package:rescue_pitchtech/shared/errors/exceptions.dart';
import 'package:rescue_pitchtech/shared/errors/failures.dart';

class LandingPageRepositoryImpl implements LandingPageRepository {
  LandingPageRepositoryImpl({
    required LandingPageLocalDataSource localDataSource,
    required LandingPageRemoteDataSource remoteDataSource,
    ContactRequestMapper contactRequestMapper = const ContactRequestMapper(),
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource,
        _contactRequestMapper = contactRequestMapper;

  final LandingPageLocalDataSource _localDataSource;
  final LandingPageRemoteDataSource _remoteDataSource;
  final ContactRequestMapper _contactRequestMapper;

  @override
  Future<Either<Failure, LandingContent>> getLandingContent() async {
    try {
      final content = await _localDataSource.getLandingContent();
      return Right(content);
    } on CacheException catch (error) {
      return Left(CacheFailure(error.message ?? 'Erro ao carregar conteúdo'));
    } catch (_) {
      return const Left(CacheFailure('Erro ao carregar conteúdo da landing'));
    }
  }

  @override
  Future<Either<Failure, void>> submitContactRequest(
    ContactRequest request,
  ) async {
    final dto = _contactRequestMapper.toDto(request);

    try {
      await _remoteDataSource.submitContactRequest(dto);
      return const Right(null);
    } on ServerException catch (error) {
      try {
        await _localDataSource.submitContactRequest(request);
        return const Right(null);
      } catch (_) {
        return Left(
          ServerFailure(error.message ?? 'Erro ao enviar solicitação'),
        );
      }
    } catch (_) {
      return const Left(ServerFailure('Erro ao enviar solicitação'));
    }
  }
}
