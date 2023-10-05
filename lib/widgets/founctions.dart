import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Fonction{
  Fonction();
  void goUrl({required String url})async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrlString(url,
          mode: LaunchMode.externalApplication,
          webViewConfiguration:const WebViewConfiguration(
            enableJavaScript: true,
          )
      );
    }
  }
}