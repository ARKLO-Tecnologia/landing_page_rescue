import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/entities/landing_content.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/repositories/landing_page_repository.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/viewmodels/landing_page_view_model.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/pages/landing_page.dart';
import 'package:rescue_pitchtech/injection_container.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rescue_pitchtech/shared/errors/failures.dart';

class _MockLandingPageRepository extends Mock implements LandingPageRepository {}

void main() {
  late _MockLandingPageRepository repository;

  setUp(() async {
    await GetIt.instance.reset();
    repository = _MockLandingPageRepository();

    getIt.registerFactory(
      () => LandingPageViewModel(repository),
    );
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  testWidgets('exibe loading e depois conteúdo principal', (tester) async {
    const content = LandingContent(
      contactPhone: '(31) 99374-0789',
      contactEmail: 'rescueapk@gmail.com',
      ctaTitle: 'Pronto para elevar a gestão da sua emergência?',
      ctaSubtitle: 'Agende uma demonstração.',
    );

    when(() => repository.getLandingContent()).thenAnswer(
      (_) async {
        await Future<void>.delayed(const Duration(milliseconds: 50));
        return const Right(content);
      },
    );

    await tester.pumpWidget(const MaterialApp(home: LandingPage()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.textContaining('Gestão de Emergência'), findsOneWidget);
    expect(find.text('Pronto para elevar a gestão da sua emergência?'),
        findsOneWidget);
  });

  testWidgets('exibe erro com ação de tentar novamente', (tester) async {
    when(() => repository.getLandingContent()).thenAnswer(
      (_) async => const Left(CacheFailure('Falha ao carregar conteúdo')),
    );

    await tester.pumpWidget(const MaterialApp(home: LandingPage()));
    await tester.pumpAndSettle();

    expect(find.text('Falha ao carregar conteúdo'), findsOneWidget);
    expect(find.text('Tentar novamente'), findsOneWidget);

    when(() => repository.getLandingContent()).thenAnswer(
      (_) async => const Right(
        LandingContent(
          contactPhone: '(31) 99374-0789',
          contactEmail: 'rescueapk@gmail.com',
          ctaTitle: 'Conteúdo recuperado',
          ctaSubtitle: 'Subtítulo',
        ),
      ),
    );

    await tester.tap(find.text('Tentar novamente'));
    await tester.pumpAndSettle();

    expect(find.text('Conteúdo recuperado'), findsOneWidget);
  });
}
