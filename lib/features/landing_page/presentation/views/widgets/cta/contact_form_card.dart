import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/contracts/landing_contact_form_host.dart';
import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';

class ContactFormCard extends StatelessWidget {
  const ContactFormCard({super.key, required this.formHost});

  final LandingContactFormHost formHost;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: formHost,
      builder: (context, _) {
        return Container(
          key: ValueKey(formHost.formResetKey),
          width: double.infinity,
          padding: EdgeInsets.all(
            context.responsiveValue(phone: 20, tablet: 24, desktop: 32),
          ),
          decoration: BoxDecoration(
            color: AppColors.formCardBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
          ),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(color: Colors.white),
                textInputAction: TextInputAction.next,
                onChanged: formHost.setContactName,
                decoration: _fieldDecoration('Seu Nome'),
              ),
              const SizedBox(height: 16),
              TextField(
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                onSubmitted: (_) => formHost.submitDemoRequest(),
                onChanged: formHost.setContactEmail,
                decoration: _fieldDecoration('E-mail Corporativo'),
              ),
              if (formHost.formError != null) ...[
                const SizedBox(height: 12),
                Text(
                  formHost.formError!,
                  style: const TextStyle(color: AppColors.error, fontSize: 13),
                ),
              ],
              if (formHost.submitSuccess) ...[
                const SizedBox(height: 12),
                const Text(
                  'Solicitação enviada com sucesso!',
                  style: TextStyle(color: AppColors.success, fontSize: 13),
                ),
              ],
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: formHost.isSubmitting
                      ? null
                      : formHost.submitDemoRequest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.formButtonForeground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: formHost.isSubmitting
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text(
                          'Solicitar Demonstração',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  InputDecoration _fieldDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white60, fontSize: 14),
      filled: true,
      fillColor: Colors.black.withValues(alpha: 0.2),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }
}
