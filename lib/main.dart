import 'package:flutter/material.dart';
import 'package:webview_scrape_poc/webview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: (Scaffold(
          appBar: AppBar(
            title: const Text("Car Compare"),
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.oil_barrel)),
              Tab(icon: Icon(Icons.car_rental)),
            ]),
          ),
          body: TabBarView(children: [
            Text("lasdf"),
            WebviewClass(),
          ]))),
    );
  }
}
