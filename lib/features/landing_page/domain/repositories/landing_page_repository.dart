import 'package:dartz/dartz.dart';

import 'package:rescue_pitchtech/features/landing_page/domain/entities/contact_request.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/entities/landing_content.dart';
import 'package:rescue_pitchtech/shared/errors/failures.dart';

/// Contrato de acesso a dados da landing (Dependency Inversion — SOLID).
abstract interface class LandingPageRepository {
  Future<Either<Failure, LandingContent>> getLandingContent();

  Future<Either<Failure, void>> submitContactRequest(ContactRequest request);
}
