import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StreamCamera extends StatefulWidget {
  const StreamCamera({super.key});

  @override
  State<StreamCamera> createState() => _StreamCameraState();
}

class _StreamCameraState extends State<StreamCamera> {
  final bool _isLoading = true; // Menyimpan status loading
  String? host;
  @override
  void initState() {
    super.initState();
    _inisialHost();
  }

  _inisialHost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      host = prefs.getString('host');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: host != null
          ? StreamContent(host: host)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class StreamContent extends StatefulWidget {
  final String? host;

  const StreamContent({
    super.key,
    this.host,
  });

  @override
  State<StreamContent> createState() => _StreamContentState();
}

class _StreamContentState extends State<StreamContent> {
  late WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(
          "${widget.host}/video_feed" ?? 'http://10.0.2.2:5000/video_feed'));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: _controller!,
    );
  }
}
