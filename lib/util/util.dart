import 'package:url_launcher/url_launcher.dart';

class Util {
  static Future<void> launchCurrentUrl({required String currentUrl}) async {
    final Uri _url = Uri.parse(currentUrl);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
