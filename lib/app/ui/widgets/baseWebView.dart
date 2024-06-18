import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

// todo：返回按钮控制，title 控制。
class BaseWebView extends StatefulWidget {
  const BaseWebView({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String title;
  final String url;

  @override
  State<BaseWebView> createState() => _BaseWebViewState();
}

class _BaseWebViewState extends State<BaseWebView> {
  late InAppWebViewController _webViewController;
  double _progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            if (await _webViewController.canGoBack()) {
              await _webViewController.goBack();
            } else {
              Get.back();
            }
          },
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            onProgressChanged: (controller, progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
          ),
          if (_progress < 1)
            LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.transparent,
              minHeight: 2,
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}
