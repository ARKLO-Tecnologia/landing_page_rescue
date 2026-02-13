import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF0B2340);
  static const Color primary = Color(0xFF98C4E6);
  static const Color accent = Color(0xFF38BDF8);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFCBD5F5);

  // --- Novas Cores Adicionadas para Seções de Alerta e Cards ---

  // Cores de Erro (Desfechos Clínicos)
  static const Color error = Color(0xFFD92D20); // Vermelho da imagem
  static const Color errorLight = Color(0xFFFEF3F2); // Fundo rosa pálido

  // Cores de Aviso (Insegurança Jurídica)
  static const Color warning = Color(0xFFF79009); // Laranja da imagem
  static const Color warningLight = Color(0xFFFFFAEB); // Fundo creme

  // Cores de Sucesso (NEWS2 Normal / Estabilidade)
  static const Color success = Color(0xFF12B76A);
  static const Color successLight = Color(0xFFECFDF3);

  // Variações de Superfície
  static const Color surfaceWhite = Colors.white;
  static const Color surfaceGrey = Color(0xFFF9FAFB);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.accent,
        error: AppColors.error,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: const TextTheme(
        // Título Principal (Hero e Seções)
        displayMedium: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        // Títulos de Seção (O Problema)
        headlineMedium: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        // Texto de Cards
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.background,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: AppColors.textSecondary,
          height: 1.5,
        ),
      ),
      useMaterial3: true,
    );
  }
}