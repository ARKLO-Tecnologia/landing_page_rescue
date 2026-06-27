import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rescue_pitchtech/features/landing_page/data/datasources/landing_page_local_datasource.dart';
import 'package:rescue_pitchtech/features/landing_page/data/datasources/landing_page_remote_datasource.dart';
import 'package:rescue_pitchtech/features/landing_page/data/dto/contact_request_dto.dart';
import 'package:rescue_pitchtech/features/landing_page/data/repositories/landing_page_repository_impl.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/entities/contact_request.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/entities/landing_content.dart';
import 'package:rescue_pitchtech/shared/errors/exceptions.dart';
import 'package:rescue_pitchtech/shared/errors/failures.dart';
import 'package:mocktail/mocktail.dart';

class _MockLocalDataSource extends Mock implements LandingPageLocalDataSource {}

class _MockRemoteDataSource extends Mock implements LandingPageRemoteDataSource {}

void main() {
  late LandingPageRepositoryImpl repository;
  late _MockLocalDataSource localDataSource;
  late _MockRemoteDataSource remoteDataSource;

  setUpAll(() {
    registerFallbackValue(
      const ContactRequestDto(name: 'fallback', email: 'fallback@test.com'),
    );
    registerFallbackValue(
      const ContactRequest(name: 'fallback', email: 'fallback@test.com'),
    );
  });

  setUp(() {
    localDataSource = _MockLocalDataSource();
    remoteDataSource = _MockRemoteDataSource();
    repository = LandingPageRepositoryImpl(
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });

  const request = ContactRequest(
    name: 'Maria',
    email: 'maria@hospital.com',
  );

  test('getLandingContent retorna conteúdo do datasource local', () async {
    const content = LandingContent(
      contactPhone: '(31) 99374-0789',
      contactEmail: 'rescueapk@gmail.com',
      ctaTitle: 'Título',
      ctaSubtitle: 'Subtítulo',
    );

    when(() => localDataSource.getLandingContent())
        .thenAnswer((_) async => content);

    final result = await repository.getLandingContent();

    expect(result, const Right(content));
    verify(() => localDataSource.getLandingContent()).called(1);
  });

  test('getLandingContent retorna CacheFailure em erro', () async {
    when(() => localDataSource.getLandingContent()).thenThrow(
      const CacheException('falha local'),
    );

    final result = await repository.getLandingContent();

    expect(result, const Left(CacheFailure('falha local')));
  });

  test('submitContactRequest usa API remota com sucesso', () async {
    when(() => remoteDataSource.submitContactRequest(any()))
        .thenAnswer((_) async {});

    final result = await repository.submitContactRequest(request);

    expect(result, const Right(null));
    verify(() => remoteDataSource.submitContactRequest(any())).called(1);
    verifyNever(() => localDataSource.submitContactRequest(any()));
  });

  test('submitContactRequest faz fallback local quando API falhar', () async {
    when(() => remoteDataSource.submitContactRequest(any())).thenThrow(
      const ServerException('offline'),
    );
    when(() => localDataSource.submitContactRequest(any()))
        .thenAnswer((_) async {});

    final result = await repository.submitContactRequest(request);

    expect(result, const Right(null));
    verify(() => localDataSource.submitContactRequest(any())).called(1);
  });

  test('submitContactRequest retorna ServerFailure se remoto e local falharem',
      () async {
    when(() => remoteDataSource.submitContactRequest(any())).thenThrow(
      const ServerException('offline'),
    );
    when(() => localDataSource.submitContactRequest(any())).thenThrow(
      Exception('local fail'),
    );

    final result = await repository.submitContactRequest(request);

    expect(result, const Left(ServerFailure('offline')));
  });
}
