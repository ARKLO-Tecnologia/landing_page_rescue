final class Environment {
  const Environment._();

  // Esta variável permite que você force o layout para testes
  // Ex: Environment.forceLayout = 'phone';
  static String forceLayout = '';

  // Outras configurações que você já tinha (opcional manter agora)
  static const String baseUrl = 'https://api.rescue.com.br';
}