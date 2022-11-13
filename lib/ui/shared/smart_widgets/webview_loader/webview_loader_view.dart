import 'dart:async';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'webview_loader_viewmodel.dart';

/// The widget will display a webview in flutter.
class WebViewLoader extends StatelessWidget {
  ///
  WebViewLoader({super.key, required this.url});

  /// Http Url to view.
  final String url;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  final UniqueKey _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WebViewLoaderViewModel>.reactive(
      viewModelBuilder: WebViewLoaderViewModel.new,
      onModelReady: (model) {
        if (Platform.isAndroid) WebView.platform = AndroidWebView();
      },
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            WebView(
              key: _key,
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: _controller.complete,
              onPageStarted: model.onPageStarted,
              onPageFinished: model.onPageFinished,
            ),
            if (model.isBusy)
              LoadingIndicator(color: Theme.of(context).colorScheme.primary)
          ],
        ),
      ),
    );
  }
}

/// This is displays a loading indicator when the page is loading
class LoadingIndicator extends StatelessWidget {
  /// Default constructor takes in only color to
  /// set the [CircularProgressIndicator]
  const LoadingIndicator({
    super.key,
    required this.color,
  });

  /// The color to get the [CircularProgressIndicator]
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation(color),
      ),
    );
  }
}
