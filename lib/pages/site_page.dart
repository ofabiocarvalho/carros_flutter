import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SitePage extends StatefulWidget {
  @override
  _SitePageState createState() => _SitePageState();
}

class _SitePageState extends State<SitePage> {
  WebViewController _controller;
  var _stackIdx = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Site"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _onClickRefresh,
          )
        ],
      ),
      body: _webView(),
    );
  }

  _webView() {
    return IndexedStack(
      index: _stackIdx,
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: "https://flutter.dev",
                onWebViewCreated: (controler) {
                  _controller = controler;
                },
                onPageFinished: onPageFinished,
              ),
            )
          ],
        ),
        Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }

  void _onClickRefresh() {
    _controller.reload();

    setState(() {
      _stackIdx = 1;
    });
  }

  void onPageFinished(String url) {
    setState(() {
      _stackIdx = 0;
    });
  }
}
