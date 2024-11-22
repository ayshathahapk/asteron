import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../Core/CommenWidgets/custom_image_view.dart';
import '../../../Core/app_export.dart';

class SumbolGraph extends ConsumerStatefulWidget {
  const SumbolGraph({super.key});

  @override
  ConsumerState createState() => _SumbolGraphState();
}

class _SumbolGraphState extends ConsumerState<SumbolGraph> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeWebViewController();
  }

  Future<void> _initializeWebViewController() async {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      );

    String fileContent = await rootBundle.loadString('assets/chart.html');
    _controller.loadHtmlString(fileContent);
  }

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.mainBlue,
        body: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.arrow_left,
                    color: CupertinoColors.systemYellow,
                  )),
            ),
            space(),
            Align(
              alignment: Alignment.topCenter,
              child: CustomImageView(
                imagePath: ImageConstants.logo,
                width: 150.h,
              ),
            ),
            space(),
            Builder(
              builder: (context) {
                if (_isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: SizeUtils.height * 0.65,
                      child:
                          Center(child: WebViewWidget(controller: _controller)),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
