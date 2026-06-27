import 'package:equatable/equatable.dart';

/// Solicitação de demonstração enviada pelo formulário de contato.
class ContactRequest extends Equatable {
  const ContactRequest({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  @override
  List<Object?> get props => [name, email];
}
