import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ncard(),
    ));

class ncard extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: WebView(
        initialUrl: 'http://pes.ieeekerala.org/young-professionals/',
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        navigationDelegate: (request) {
          bool isHost = request.url
              .startsWith("http://pes.ieeekerala.org/");
          if (isHost)
            return NavigationDecision.navigate;
          else
            return NavigationDecision.prevent;
        },
      ),
    ));
  }
}
