import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewClass extends StatelessWidget {
  WebviewClass({super.key});

  final MethodChannel _channel = const MethodChannel('my_channel');

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..addJavaScriptChannel(
      'Print',
      onMessageReceived: (JavaScriptMessage message) {
        print(message.message);
      },
    )
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
    ..loadRequest(Uri.parse(
        'https://book.olacabs.com/?pickup_name=Jayanagar%2C%20Bengaluru%20Karnataka%20India&lat=12.9307735&lng=77.5838302&drop_lat=12.9063433&drop_lng=77.5856825&drop_name=J.%20P.%20Nagar%2C%20Bengaluru%20Karnataka%20India'));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    controller
        .setNavigationDelegate(NavigationDelegate(onPageStarted: (String url) {
      controller.runJavaScript("hello world");
    }, onPageFinished: (String url) {
      controller.runJavaScript('''
var cancelClicked = false;
clickCancel = () => {
            const getCancelButton = () => {
              return document
                .querySelector("body > ola-app")
                ?.shadowRoot?.querySelector("#dialog")
                ?.shadowRoot?.querySelector("#cancel");
            };
            let intervalId;
            intervalId = setInterval(() => {
              const cancelButton = getCancelButton();
              if (cancelButton) {
                cancelClicked = true;
                clearInterval(intervalId);
                cancelButton.click();
                clickAuto();
              }
            }, 1000);
          };

clickAuto = () => {
            const getAutoButton = () => {
              return document.querySelector("body > ola-app").shadowRoot.querySelector("iron-pages > ola-home").shadowRoot.querySelector("div.page-container.bg-light > ola-home-local").shadowRoot.querySelector("div > ola-cabs").shadowRoot.querySelector("div.card.car-cont.bg-white.when-NOW > div:nth-child(1) > div.middle > div.text.value.cab-name");
            };
            let intervalId;
            intervalId = setInterval(() => {
              const autoButton = getAutoButton();
              if (autoButton) {
                clearInterval(intervalId);
                autoButton.click();
                getAutoAmount();
              }
            }, 1000);
          };

          getAutoAmount = () => {
            const getAutoAmount = () => {
              return document.querySelector("body > ola-app").shadowRoot.querySelector("#ola-confirm-ride-p2p").shadowRoot.querySelector("#modalContent > ola-confirm-ride-p2p").shadowRoot.querySelector("div.page-container > div.card.bg-white.top-most > div.row-sm.row-sm-fare.fare-est-false > div.middle.text.value > div.price-estimate");
            };
            let intervalId;
            intervalId = setInterval(() => {
              const autoAmount = getAutoAmount();
              if (autoAmount) {
                clearInterval(intervalId);
                // autoAmount.click();
                alert(autoAmount.textContent);
                Print.postMessage(autoAmount.textContent);
              }
            }, 1000);
          };


clickCancel();

function sleepSync(ms) {
  const startTime = new Date().getTime();
  while (new Date().getTime() < startTime + ms);
}
''');
    }));

    _channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'my_method') {
        String autoAmount = call.arguments['autoAmount'];
        // Do something with the autoAmount value
      }
    });

    return (WebViewWidget(
      controller: controller,
    ));
  }
}
