import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/screens/screen_webview_cache.dart';
import 'package:safe_store/screens/screen_admin_simple.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.to(MyWebView(url: 'https://microprogramers.org',));
            }, child: Text("data")),
            ElevatedButton(onPressed: (){
              // Get.to(WebviewExampleScreen(title: 'webview',));
            }, child: Text("data"))
          ],
        ),
      ),
    );
  }
}
