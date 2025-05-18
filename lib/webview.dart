import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen>  {
  late InAppWebViewController webViewController;
  String predictionText = "Prediction: Waiting...";
  bool landmarksEnabled = false;

  @override
  void initState() {
    super.initState();
    requestCameraPermission();
  }

  Future<void> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }

  void startPrediction() {
    webViewController.evaluateJavascript(
      source: "document.getElementById('start').click();"
    );
  }

  void stopPrediction() {
    webViewController.evaluateJavascript(
      source: "document.getElementById('stop').click();"
    );
  }

  void toggleLandmarks(bool enabled) {
    final value = enabled ? 'true' : 'false';
    webViewController.evaluateJavascript(
      source: "document.getElementById('toggle-landmarks').checked = $value; document.getElementById('toggle-landmarks').dispatchEvent(new Event('change'));"
    );
  }


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text("Camera")),
    body: Column(
      children: [
        // WebView Area
        Expanded(
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri("https://b985-103-200-33-5.ngrok-free.app/"),
            ),
            initialSettings: InAppWebViewSettings(
              javaScriptEnabled: true,
              mediaPlaybackRequiresUserGesture: false,
              useHybridComposition: true,
              javaScriptCanOpenWindowsAutomatically: true,
              allowsInlineMediaPlayback: true,
            ),
            onWebViewCreated: (controller) {
              webViewController = controller;

              webViewController.addJavaScriptHandler(
                handlerName: 'sendPredictionToFlutter',
                callback: (args) {
                  final data = args.isNotEmpty ? args[0] : null;
                  if (data != null && data is Map) {
                    final pred = data['prediction'] ?? 'Unknown';
                    final conf = (data['confidence'] != null)
                        ? (data['confidence'] * 100).toStringAsFixed(1)
                        : '0';
                    setState(() {
                      predictionText = "Prediction: $pred ($conf%)";
                    });
                  }
                  return null;
                },
              );
            },
            onPermissionRequest: (controller, request) async {
              return PermissionResponse(
                resources: request.resources,
                action: PermissionResponseAction.GRANT,
              );
            },
          ),
        ),

        // Toggle Landmarks
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Show Landmarks"),
              const SizedBox(width: 10),
              Switch(
                value: landmarksEnabled,
                onChanged: (bool value) {
                  setState(() => landmarksEnabled = value);
                  toggleLandmarks(value);
                },
              ),
            ],
          ),
        ),

        // Start/Stop buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: startPrediction,
              child: const Text("Start"),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: stopPrediction,
              child: const Text("Stop"),
            ),
          ],
        ),

        // Prediction display
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.black87,
          width: double.infinity,
          child: Text(
            predictionText,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
}
