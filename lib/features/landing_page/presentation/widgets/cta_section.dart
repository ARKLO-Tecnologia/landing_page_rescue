import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class CTASection extends StatelessWidget {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      width: double.infinity,
      child: Column(
        children: [
          // 1. DIVIDER SUPERIOR
          const Divider(color: Colors.white10, height: 1),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TÍTULO E SUBTÍTULO
                    const Text(
                      'Pronto para elevar a gestão da sua emergência?',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Agende uma demonstração e veja a rastreabilidade total em ação.',
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    const SizedBox(height: 48),

                    // ÁREA DE CONTEÚDO (COLUNA DUPLA)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // INFO DE CONTATO (Lado Esquerdo)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              _ContactItem(
                                icon: Icons.phone_outlined,
                                text: '(11) 9999-9999',
                              ),
                              SizedBox(height: 16),
                              _ContactItem(
                                icon: Icons.email_outlined,
                                text: 'contato@rescue.com.br',
                              ),
                            ],
                          ),
                        ),
                        // FORMULÁRIO (Lado Direito)
                        Expanded(
                          child: _buildFormCard(),
                        ),
                      ],
                    ),

                    const SizedBox(height: 64),

                    // 2. SEÇÃO DE DOWNLOAD DAS LOJAS
                    const Text(
                      'Baixe nosso aplicativo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: const [
                        _StoreButton(
                          icon: Icons.apple,
                          label: 'Download on',
                          store: 'App Store',
                        ),
                        SizedBox(width: 16),
                        _StoreButton(
                          icon: Icons.play_arrow_rounded,
                          label: 'Get it on',
                          store: 'Google Play',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 3. DIVIDER INFERIOR
          const Divider(color: Colors.white10, height: 1),
        ],
      ),
    );
  }

  Widget _buildFormCard() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2938), // Card levemente elevado
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          _buildField('Seu Nome'),
          const SizedBox(height: 16),
          _buildField('E-mail Corporativo'),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF111D29),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Solicitar Demonstração', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white60, fontSize: 14),
        filled: true,
        fillColor: Colors.black.withOpacity(0.2),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      ),
    );
  }
}

// Widget auxiliar para os botões das lojas
class _StoreButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String store;

  const _StoreButton({required this.icon, required this.label, required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black, // Botões pretos conforme imagem
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 9)),
              Text(store, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const _ContactItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(width: 12),
        Text(text, style: const TextStyle(color: Colors.white70, fontSize: 16)),
      ],
    );
  }
}