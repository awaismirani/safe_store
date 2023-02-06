import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:safe_store/screens/home.dart';
import 'package:safe_store/screens/screen_webview_cache.dart';
import 'package:safe_store/screens/screen_welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return GetMaterialApp(
        title: 'Safe Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ScreenAdminDashboard(),
        // home:  MyWebView(url: 'https://microprogramers.org',),
      );
    },);
  }
}
