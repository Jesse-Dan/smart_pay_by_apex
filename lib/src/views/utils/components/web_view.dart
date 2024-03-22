// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:go_navigator/go/go.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebView extends StatefulWidget {
  static const String routeName = '/app.web.view.';

  final String url;
  final String title;

  const AppWebView({Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..clearCache()
      ..clearLocalStorage()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  void dispose() {
    super.dispose();
    controller.clearCache();
    controller.clearCache();
    controller.setJavaScriptMode(JavaScriptMode.disabled);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          NavigationControls(controller: controller),
          // Menu(controller: controller),
        ],
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Go(context).backWithData(true);
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: WebViewStack(controller: controller),
      ),
    );
  }
}

class WebViewStack extends StatefulWidget {
  WebViewStack({required this.controller, super.key}); // MODIFY

  WebViewController controller;

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
        onNavigationRequest: (navigation) {
          final host = Uri.parse(navigation.url).host;
          if (!host.contains('paystack.com')) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Blocking navigation to $host',
                ),
              ),
            );
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(
          controller: widget.controller,
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls({required this.controller, super.key});

  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // IconButton(
        //   icon: const Icon(Icons.arrow_back_ios),
        //   onPressed: () async {
        //     final messenger = ScaffoldMessenger.of(context);
        //     if (await controller.canGoBack()) {
        //       await controller.goBack();
        //     } else {
        //       messenger.showSnackBar(
        //         const SnackBar(content: Text('No back history item')),
        //       );
        //       return;
        //     }
        //   },
        // ),
        // IconButton(
        //   icon: const Icon(Icons.arrow_forward_ios),
        //   onPressed: () async {
        //     final messenger = ScaffoldMessenger.of(context);
        //     if (await controller.canGoForward()) {
        //       await controller.goForward();
        //     } else {
        //       messenger.showSnackBar(
        //         const SnackBar(content: Text('No forward history item')),
        //       );
        //       return;
        //     }
        //   },
        // ),
        IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () {
            controller.reload();
          },
        ),
      ],
    );
  }
}

enum _MenuOptions {
  navigationDelegate,
  userAgent,
  javascriptChannel,
}

class Menu extends StatefulWidget {
  const Menu({required this.controller, super.key});

  final WebViewController controller;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_MenuOptions>(
      onSelected: (value) async {
        switch (value) {
          case _MenuOptions.navigationDelegate:
            await widget.controller
                .loadRequest(Uri.parse('https://youtube.com'));
            break;
          case _MenuOptions.userAgent:
            final userAgent = await widget.controller
                .runJavaScriptReturningResult('navigator.userAgent');
            if (!mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('$userAgent'),
            ));
            break;
          case _MenuOptions.javascriptChannel:
            await widget.controller.runJavaScript('''
                var req = new XMLHttpRequest();
                req.open('GET', "https://www.flutter.dev");
                req.onload = function() {
                  if (req.status == 200) {
                    SnackBar.postMessage(req.responseText);
                  } else {
                    SnackBar.postMessage("Error: " + req.status);
                  }
                }
                req.send();
                
              ''');
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem<_MenuOptions>(
          value: _MenuOptions.navigationDelegate,
          child: Text('Navigate to YouTube'),
        ),
        const PopupMenuItem<_MenuOptions>(
          value: _MenuOptions.userAgent,
          child: Text('Show user-agent'),
        ),
        const PopupMenuItem<_MenuOptions>(
          value: _MenuOptions.javascriptChannel,
          child: Text('Lookup IP Address'),
        ),
      ],
    );
  }
}
