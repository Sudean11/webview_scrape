// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_scrape_poc/bloc/cabs_bloc.dart';

import 'package:webview_scrape_poc/controllers/cab_data_controller.dart';

class WebviewClass extends StatelessWidget {
  final cabDataController = Get.find<CabDataController>();

  // ignore: non_constant_identifier_names

  final CabsBloc cabsBloc = CabsBloc();

  @override
  Widget build(BuildContext context) {
    cabsBloc.add(StartScrape());
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..addJavaScriptChannel(
        "Print",
        onMessageReceived: (JavaScriptMessage message) {
          cabDataController.setOlaValue(message.message.toString().trim());
          cabsBloc.add(OlaDataScraped(message.message.toString().trim()));
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

    final uberController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..addJavaScriptChannel(
        "Uber",
        onMessageReceived: (JavaScriptMessage message) {
          cabDataController.setUberValue(message.message.toString().trim());
          cabsBloc.add(UberDataScraped(message.message.toString().trim()));
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
          "https://m.uber.com/looking?drop%5B0%5D=%7B%22latitude%22%3A13.0353557%2C%22longitude%22%3A77.59878739999999%2C%22addressLine1%22%3A%22Hebbal%22%2C%22addressLine2%22%3A%22Bengaluru%2C%20Karnataka%22%2C%22id%22%3A%22ChIJRwrYlaIXrjsRWUexKPPLPBo%22%2C%22provider%22%3A%22google_places%22%2C%22index%22%3A0%7D&pickup=%7B%22latitude%22%3A12.9180865%2C%22longitude%22%3A77.6051008%2C%22addressLine1%22%3A%22BTM%201st%20Stage%22%2C%22addressLine2%22%3A%22BTM%20Layout%2C%20Bengaluru%2C%20Karnataka%22%2C%22id%22%3A%22ChIJSzfLnwEVrjsRaXJV_yIv08o%22%2C%22provider%22%3A%22google_places%22%2C%22index%22%3A0%7D&vehicle=2007"));

    uberController
        .setNavigationDelegate(NavigationDelegate(onPageFinished: (String url) {
      uberController.runJavaScript('''getAutoValue = () => {
      console.log('here');
            const getAutoValue = () => {
              return document.querySelector("#wrapper > div._css-dqxzrQ > div > div._css-fCssPB > div._css-bOmAYR > div > span > div > div._css-hWGanL > div > ul > li._css-dRVcpk > div._css-eemxAU > div._css-jhvuGu > div._css-bIstwm > div > p");
            };
            let intervalId;
            intervalId = setInterval(() => {
              const autoValue = getAutoValue();
              if (autoValue) {
                clearInterval(intervalId);
                Uber.postMessage(autoValue.textContent);

              }
            }, 1000);
          };
      getAutoValue();
      ''');
    }));

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
                sleepSync(1000);
                Print.postMessage(autoAmount.textContent);
                clearInterval(intervalId);
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

    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => cabsBloc,
        child: Column(
          children: [
            Row(
              children: [
                BlocBuilder<CabsBloc, CabsState>(
                  builder: (context, state) {
                    if (state is CabScrapeInProcess) {
                      return Text(" state in progress");
                    } else {
                      return Text("Ola Auto Price: ");
                    }
                  },
                ),
                Obx(() => Text(cabDataController.olaAutoValue.value))
              ],
            ),
            Row(
              children: [
                Text("Uber Auto Price: "),
                Obx(() => Text(cabDataController.uberAutoValue.value))
              ],
            ),
            SizedBox(
              height: 500,
              child: WebViewWidget(
                controller: controller,
              ),
            ),
            SizedBox(
              height: 500,
              child: WebViewWidget(
                controller: uberController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
