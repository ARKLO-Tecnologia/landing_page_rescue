import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/entities/contact_request.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/entities/landing_content.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/repositories/landing_page_repository.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/viewmodels/landing_page_view_model.dart';
import 'package:rescue_pitchtech/shared/errors/failures.dart';
import 'package:mocktail/mocktail.dart';

class _MockLandingPageRepository extends Mock implements LandingPageRepository {}

void main() {
  late _MockLandingPageRepository repository;
  late LandingPageViewModel viewModel;

  setUpAll(() {
    registerFallbackValue(
      const ContactRequest(name: 'fallback', email: 'fallback@test.com'),
    );
  });

  setUp(() {
    repository = _MockLandingPageRepository();
    viewModel = LandingPageViewModel(repository);
  });

  tearDown(() {
    viewModel.dispose();
  });

  test('init carrega conteúdo com sucesso', () async {
    const content = LandingContent(
      contactPhone: '(31) 99374-0789',
      contactEmail: 'rescueapk@gmail.com',
      ctaTitle: 'CTA',
      ctaSubtitle: 'Sub',
    );

    when(() => repository.getLandingContent()).thenAnswer(
      (_) async => const Right(content),
    );

    await viewModel.init();

    expect(viewModel.isLoading, isFalse);
    expect(viewModel.content, content);
    expect(viewModel.contentError, isNull);
  });

  test('init propaga erro de conteúdo', () async {
    when(() => repository.getLandingContent()).thenAnswer(
      (_) async => const Left(CacheFailure('Erro ao carregar')),
    );

    await viewModel.init();

    expect(viewModel.contentError, 'Erro ao carregar');
    expect(viewModel.hasContent, isFalse);
  });

  test('retorna erro de validação quando nome estiver vazio', () async {
    viewModel
      ..setContactName('')
      ..setContactEmail('valido@empresa.com');

    await viewModel.submitDemoRequest();

    expect(viewModel.formError, 'Informe seu nome');
    verifyNever(() => repository.submitContactRequest(any()));
  });

  test('retorna erro de validação quando e-mail for inválido', () async {
    viewModel
      ..setContactName('Maria')
      ..setContactEmail('email-invalido');

    await viewModel.submitDemoRequest();

    expect(viewModel.formError, 'Informe um e-mail corporativo válido');
    verifyNever(() => repository.submitContactRequest(any()));
  });

  test('envia solicitação quando dados forem válidos', () async {
    when(() => repository.submitContactRequest(any())).thenAnswer(
      (_) async => const Right(null),
    );

    viewModel
      ..setContactName('Maria')
      ..setContactEmail('maria@empresa.com');

    await viewModel.submitDemoRequest();

    expect(viewModel.submitSuccess, isTrue);
    expect(viewModel.formError, isNull);
    expect(viewModel.formResetKey, 1);
    verify(
      () => repository.submitContactRequest(
        const ContactRequest(name: 'Maria', email: 'maria@empresa.com'),
      ),
    ).called(1);
  });

  test('propaga erro do repositório', () async {
    when(() => repository.submitContactRequest(any())).thenAnswer(
      (_) async => const Left(ServerFailure('Erro no servidor')),
    );

    viewModel
      ..setContactName('Maria')
      ..setContactEmail('maria@empresa.com');

    await viewModel.submitDemoRequest();

    expect(viewModel.formError, 'Erro no servidor');
    expect(viewModel.submitSuccess, isFalse);
  });
}
