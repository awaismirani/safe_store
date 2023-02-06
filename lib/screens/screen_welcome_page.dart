import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safe_store/screens/screen_account_manager.dart';
import 'package:safe_store/screens/screen_admin_complex.dart';
import 'package:safe_store/screens/screen_admin_simple.dart';
import 'package:safe_store/screens/screen_administrator.dart';
import 'package:safe_store/screens/screen_it_manager.dart';
import 'package:safe_store/screens/screen_login.dart';
import 'package:url_launcher/url_launcher.dart';

import 'hostinger_screen.dart';

class ScreenAdminDashboard extends StatefulWidget {
  ScreenAdminDashboard({Key? key}) : super(key: key);

  @override
  _ScreenAdminDashboardState createState() => _ScreenAdminDashboardState();
}

class _ScreenAdminDashboardState extends State<ScreenAdminDashboard> {
  var images = [
    "assets/images/admin_simple.png",
    "assets/images/admin_complex.png",
    "assets/images/acoount_manager.png",
    "assets/images/it_manager.png",
    "assets/images/it.png",
    "assets/images/admin_simple.png",
  ];
  var texts = [
    "Admin Simple",
    "Admin Complex",
    "My Portfolio",
    "Administrator",
    "IT Manager",
    "Web Hosting",
  ];
  List<dynamic> screens = [
    // ScreenLogin(),
    ScreenAdminSimple(title: "Admin Simple", initialUrl: 'https://safestore.tech/wp-admin',),
    ScreenAdminComplex(title:"Admin Complex", initialUrl: 'https://safestore.tech/wp-admin',),
    HostingerScreen(url:'https://hostinger.com'),
    ScreenAdministrator(title:"Administrator", initialUrl: 'https://safestore.tech/wp-admin',),
    ScreenItmanager(title:"IT Manager", initialUrl: 'https://safestore.tech/wp-admin',),
    HostingerScreen(url:'https://hostinger.com'),
  // launch('https://hostinger.com'),
    // ScreenAdminSelectLanguage(),
    // ScreenAdminViewUser(),
    // ScreenAdminBlockUser(),
    // AccountStatus(),
    // ScreenAdminRecipeList(),
  ];

  @override
  Widget build(BuildContext context) {
    var isPortrate = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: Stack(
          children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
        ),
        Container(
          height: 30.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(100, 30)),
              gradient: LinearGradient(
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                  colors: [
                Color(0xff16ba63),
            Color(0xff017cfd),

          ])),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'WELCOME TO',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '\nADMIN APP',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ]
                      )),
                      SizedBox(
                          // height: 100,
                          // width: 100,
                          child: Image.asset("assets/images/splash.png")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 20.h,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 5),
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isPortrate ? 2 : 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CustomContainer(
                    image: images[index],
                    text: texts[index],
                    onTap: () {
                      Get.to(screens[index]);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class CustomContainer extends StatelessWidget {
  String image, text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height:Get.height,
        // width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: appBoxShadow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  CustomContainer({
    required this.image,
    required this.text,
    this.onTap,
  });
}
