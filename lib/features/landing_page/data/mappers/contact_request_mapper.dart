import 'package:rescue_pitchtech/features/landing_page/data/dto/contact_request_dto.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/entities/contact_request.dart';

/// Converte entidade de domínio para DTO de API.
class ContactRequestMapper {
  const ContactRequestMapper();

  ContactRequestDto toDto(ContactRequest request) {
    return ContactRequestDto(name: request.name, email: request.email);
  }
}
