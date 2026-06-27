import 'package:equatable/equatable.dart';

import 'package:rescue_pitchtech/features/landing_page/domain/entities/landing_content.dart';

/// Estado imutável da tela — Single Responsibility (SOLID).
class LandingPageState extends Equatable {
  const LandingPageState({
    this.isLoading = false,
    this.content,
    this.contentError,
    this.formError,
    this.contactName = '',
    this.contactEmail = '',
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.formResetKey = 0,
  });

  final bool isLoading;
  final LandingContent? content;
  final String? contentError;
  final String? formError;
  final String contactName;
  final String contactEmail;
  final bool isSubmitting;
  final bool submitSuccess;
  final int formResetKey;

  bool get hasContent => content != null;

  LandingPageState copyWith({
    bool? isLoading,
    LandingContent? content,
    String? contentError,
    String? formError,
    String? contactName,
    String? contactEmail,
    bool? isSubmitting,
    bool? submitSuccess,
    int? formResetKey,
    bool clearContentError = false,
    bool clearFormError = false,
    bool clearContent = false,
  }) {
    return LandingPageState(
      isLoading: isLoading ?? this.isLoading,
      content: clearContent ? null : (content ?? this.content),
      contentError:
          clearContentError ? null : (contentError ?? this.contentError),
      formError: clearFormError ? null : (formError ?? this.formError),
      contactName: contactName ?? this.contactName,
      contactEmail: contactEmail ?? this.contactEmail,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      submitSuccess: submitSuccess ?? this.submitSuccess,
      formResetKey: formResetKey ?? this.formResetKey,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        content,
        contentError,
        formError,
        contactName,
        contactEmail,
        isSubmitting,
        submitSuccess,
        formResetKey,
      ];
}
