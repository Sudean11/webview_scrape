import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewClass extends StatelessWidget {
  WebviewClass({super.key});

  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://book.olacabs.com/'));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return (WebViewWidget(
      controller: controller,
    ));
  }
}
