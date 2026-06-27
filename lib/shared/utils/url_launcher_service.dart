import 'package:url_launcher/url_launcher.dart';

abstract final class UrlLauncherService {
  static Future<bool> open(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;

    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static Future<bool> openPhone(String phone) {
    final digits = phone.replaceAll(RegExp(r'[^\d+]'), '');
    return open('tel:$digits');
  }

  static Future<bool> openEmail(String email) => open('mailto:$email');
}
