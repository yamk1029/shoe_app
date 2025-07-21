import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EsewaPaymentPage extends StatefulWidget {
  const EsewaPaymentPage({super.key});

  @override
  State<EsewaPaymentPage> createState() => _EsewaPaymentPageState();
}

class _EsewaPaymentPageState extends State<EsewaPaymentPage> {
  late final WebViewController _controller;

  // 🟡 Test data (valid for test environment)
  final String amount = '1800';
  final String productId = 'shoes001';
  final String merchantCode = 'EPAYTEST'; // Use real merchant code in production

  // ✅ Use test server URLs when using EPAYTEST
  final String successUrl = 'https://esewa.com.np/mobile/epay/success';
  final String failureUrl = 'https://esewa.com.np/mobile/epay/fail';

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            if (request.url.contains("success")) {
              _showResult("✅ Payment Successful!");
              return NavigationDecision.prevent;
            } else if (request.url.contains("fail")) {
              _showResult("❌ Payment Failed!");
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(_buildPaymentUrl()));
  }

String _buildPaymentUrl() {
  return 'https://esewa.com.np/epay/main'
      '?amt=$amount'
      '&psc=0'
      '&pdc=0'
      '&txAmt=0'
      '&tAmt=$amount'
      '&pid=$productId'
      '&scd=$merchantCode'
      '&su=$successUrl'
      '&fu=$failureUrl';
}
  void _showResult(String msg) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(msg),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
            child: const Text("Back to Home"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pay with eSewa")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
