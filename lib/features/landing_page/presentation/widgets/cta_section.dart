import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class CTASection extends StatelessWidget {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1024;

    return Container(
      color: AppColors.background,
      width: double.infinity,
      child: Column(
        children: [
          const Divider(color: Colors.white10, height: 1),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 24,
                vertical: isMobile ? 60 : 80
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                  children: [
                    // TÍTULO
                    Text(
                      'Pronto para elevar a gestão da sua emergência?',
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      style: TextStyle(
                        fontSize: isMobile ? 28 : 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Agende uma demonstração e veja a rastreabilidade total em ação.',
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      style: const TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    const SizedBox(height: 48),

                    // ÁREA DE CONTEÚDO (Flexível para empilhar no mobile)
                    Flex(
                      direction: isMobile ? Axis.vertical : Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // INFO DE CONTATO
                        Expanded(
                          flex: isMobile ? 0 : 1,
                          child: Column(
                            crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                            children: [
                              const _ContactItem(
                                icon: Icons.phone_outlined,
                                text: '(31) 99374-0789',
                              ),
                              const SizedBox(height: 16),
                              const _ContactItem(
                                icon: Icons.email_outlined,
                                text: 'rescueapk@gmail.com',
                              ),
                              if (isMobile) const SizedBox(height: 40),
                            ],
                          ),
                        ),
                        if (!isMobile) const SizedBox(width: 64),
                        // FORMULÁRIO
                        Expanded(
                          flex: isMobile ? 0 : 1,
                          child: _buildFormCard(isMobile),
                        ),
                      ],
                    ),

                    const SizedBox(height: 64),

                    // SEÇÃO DE DOWNLOAD
                    const Text(
                      'Baixe nosso aplicativo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Wrap garante que os botões de loja não quebrem a tela no mobile
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                      children: const [
                        _StoreButton(
                          icon: Icons.apple,
                          label: 'Download on',
                          store: 'App Store',
                        ),
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

          const Divider(color: Colors.white10, height: 1),
        ],
      ),
    );
  }

  Widget _buildFormCard(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 24 : 32),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2938),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        children: [
          _buildField('Seu Nome'),
          const SizedBox(height: 16),
          _buildField('E-mail Corporativo'),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 54, // Botão levemente maior para melhor touch no mobile
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF111D29),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 0,
              ),
              child: const Text('Solicitar Demonstração', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(String label) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white60, fontSize: 14),
        filled: true,
        fillColor: Colors.black.withValues(alpha: 0.2),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}

class _StoreButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String store;

  const _StoreButton({required this.icon, required this.label, required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160, // Largura fixa ajuda a manter o padrão visual lado a lado
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: const TextStyle(color: Colors.white, fontSize: 8)),
                Text(store, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
              ],
            ),
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(width: 12),
        Text(text, style: const TextStyle(color: Colors.white70, fontSize: 16)),
      ],
    );
  }
}