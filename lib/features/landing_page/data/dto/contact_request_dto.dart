class ContactRequestDto {
  const ContactRequestDto({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  factory ContactRequestDto.fromJson(Map<String, dynamic> json) {
    return ContactRequestDto(
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}
