import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymobWebView extends StatefulWidget {
  final String url;
  const PaymobWebView({super.key, required this.url});

  @override
  State<PaymobWebView> createState() => _PaymobWebViewState();
}

class _PaymobWebViewState extends State<PaymobWebView> {
  late final WebViewController _controller;
  int _loadingPercentage = 0;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) => setState(() => _loadingPercentage = progress),
          onPageStarted: (url) => setState(() => _loadingPercentage = 0),
          onPageFinished: (url) {
            setState(() => _loadingPercentage = 100);
            _checkUrlStatus(url);
          },
          onWebResourceError: (error) => setState(() => _isError = true),
          onNavigationRequest: (request) {
            // إضافة حماية لعدم الخروج من نطاق بوابة الدفع
            if (request.url.contains('paymob') || request.url.contains('accept') || request.url.contains('estsheer')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  void _checkUrlStatus(String url) {
    if (url.contains('success=true') || url.contains('approved')) {
      _finishPayment(true);
    } else if (url.contains('success=false') || url.contains('declined')) {
      _finishPayment(false);
    }
  }

  void _finishPayment(bool isSuccess) {
    if (mounted) Navigator.pop(context, isSuccess);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          // الـ WebView الأساسي
          WebViewWidget(controller: _controller),

          // شاشة التحميل المتطورة
          if (_loadingPercentage < 100 && !_isError) _buildLoadingScreen(),

          // شاشة الخطأ في حالة فشل التحميل
          if (_isError) _buildErrorScreen(),

          // خط التقدم الرفيع في أعلى الصفحة (زي المتصفحات الحديثة)
          if (_loadingPercentage > 0 && _loadingPercentage < 100)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(
                value: _loadingPercentage / 100.0,
                backgroundColor: Colors.transparent,
                color: const Color(0xFF2196F3),
                minHeight: 3.h,
              ),
            ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.close_rounded, color: Colors.grey[800], size: 24.sp),
        onPressed: () => _finishPayment(false),
      ),
      title: Column(
        children: [
          Text(
            "بوابة الدفع الآمنة",
            style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.lock, color: Colors.green, size: 12.sp),
              SizedBox(width: 4.w),
              Text("تشفير SSL 256-bit", style: TextStyle(color: Colors.green, fontSize: 10.sp)),
            ],
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.h),
        child: Container(color: Colors.grey[200], height: 1.h),
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ممكن هنا تحط Lottie Animation لو حابب
          const CircularProgressIndicator.adaptive(),
          SizedBox(height: 24.h),
          Text(
            "جاري الاتصال بالبنك...",
            style: TextStyle(fontSize: 15.sp, color: Colors.black87, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8.h),
          Text(
            "يرجى عدم إغلاق الصفحة أو الضغط على زر الرجوع",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorScreen() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline_rounded, color: Colors.red[400], size: 60.sp),
            SizedBox(height: 16.h),
            Text("عفواً، حدث خطأ في الاتصال", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                setState(() => _isError = false);
                _controller.reload();
              },
              child: const Text("إعادة المحاولة"),
            )
          ],
        ),
      ),
    );
  }
}

