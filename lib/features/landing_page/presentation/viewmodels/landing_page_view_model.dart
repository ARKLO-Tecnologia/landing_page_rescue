import 'package:rescue_pitchtech/features/landing_page/presentation/contracts/landing_contact_form_host.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/contracts/landing_page_screen_state.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/entities/contact_request.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/entities/landing_content.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/repositories/landing_page_repository.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/viewmodels/landing_page_state.dart';
import 'package:rescue_pitchtech/shared/errors/failures.dart';
import 'package:rescue_pitchtech/shared/mvvm/view_model.dart';
import 'package:rescue_pitchtech/shared/utils/email_validator.dart';

class LandingPageViewModel extends ViewModel
    implements LandingPageScreenState, LandingContactFormHost {
  LandingPageViewModel(this._repository);

  final LandingPageRepository _repository;

  LandingPageState _state = const LandingPageState();

  LandingPageState get state => _state;

  @override
  bool get isLoading => _state.isLoading;
  @override
  LandingContent? get content => _state.content;
  @override
  String? get contentError => _state.contentError;
  @override
  String? get formError => _state.formError;
  String get contactName => _state.contactName;
  String get contactEmail => _state.contactEmail;
  @override
  bool get isSubmitting => _state.isSubmitting;
  @override
  bool get submitSuccess => _state.submitSuccess;
  @override
  int get formResetKey => _state.formResetKey;
  @override
  bool get hasContent => _state.hasContent;

  Future<void> init() async {
    _emit(_state.copyWith(isLoading: true, clearContentError: true));

    final result = await _repository.getLandingContent();

    result.fold(
      (failure) => _emit(
        _state.copyWith(
          isLoading: false,
          contentError: failure.message,
        ),
      ),
      (data) => _emit(
        _state.copyWith(
          isLoading: false,
          content: data,
        ),
      ),
    );
  }

  @override
  void setContactName(String value) {
    _emit(
      _state.copyWith(
        contactName: value,
        submitSuccess: false,
        clearFormError: true,
      ),
    );
  }

  @override
  void setContactEmail(String value) {
    _emit(
      _state.copyWith(
        contactEmail: value,
        submitSuccess: false,
        clearFormError: true,
      ),
    );
  }

  @override
  Future<void> submitDemoRequest() async {
    final validationError = _validateContactRequest();
    if (validationError != null) {
      _emit(
        _state.copyWith(
          formError: validationError,
          submitSuccess: false,
        ),
      );
      return;
    }

    _emit(
      _state.copyWith(
        isSubmitting: true,
        submitSuccess: false,
        clearFormError: true,
      ),
    );

    final result = await _repository.submitContactRequest(
      ContactRequest(name: contactName, email: contactEmail),
    );

    result.fold(
      (failure) => _emit(
        _state.copyWith(
          isSubmitting: false,
          formError: failure.message,
        ),
      ),
      (_) => _emit(
        _state.copyWith(
          isSubmitting: false,
          submitSuccess: true,
          contactName: '',
          contactEmail: '',
          formResetKey: _state.formResetKey + 1,
        ),
      ),
    );
  }

  String? _validateContactRequest() {
    if (contactName.trim().isEmpty) {
      return const ValidationFailure('Informe seu nome').message;
    }

    if (!EmailValidator.isValid(contactEmail)) {
      return const ValidationFailure('Informe um e-mail corporativo válido')
          .message;
    }

    return null;
  }

  void _emit(LandingPageState newState) {
    _state = newState;
    setState();
  }
}
