import 'dart:async';
import 'package:custom_utils/custom_utils.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:safe_store/screens/screen_welcome_page.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/my_controllers.dart';

class ScreenAdminSimple extends StatefulWidget {
  String title;
  String initialUrl;
  ScreenAdminSimple({required this.title,required this.initialUrl,});

  @override
  _ScreenAdminSimpleState createState() => _ScreenAdminSimpleState();
}
late WebViewController _webViewController1;
class _ScreenAdminSimpleState extends State<ScreenAdminSimple> {

bool bac=false;
bool far=false;
  var controller1 = Get.put(MyControllers());
  final List<String> currentUrl = [
    'https://safestore.tech/wp-admin/admin.php?page=googlesitekit-dashboard',
    'https://safestore.tech/wp-admin/upload.php',
    'https://safestore.tech/wp-admin/media-new.php',
    'https://safestore.tech/wp-admin/edit.php?post_type=shop_order',
    'https://safestore.tech/wp-admin/options-general.php?page=post-views-counter',
  ];

  // String currentUrl = 'https://microprogramers.org';
  final _key = UniqueKey();

  // late WebViewController controller2;
  bool isLoading = false;
Color bacColor=Colors.black;
  // void _redirectTo(String url) {
  //   setState(() {
  //     controller1.currentUrl[controller1.page.value] = url;
  //   });
  // }
bool refresh=false;
var myUrl='';
  // late WebViewController controller;

Future<SharedPreferences> pref=SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    // var title= controller.getTitle();
    return Scaffold(
      drawer: SafeArea(
        child: StreamBuilder(builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,color: Colors.grey.withOpacity(.3),
                            offset: Offset(0, .2)
                        )]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 10,),
                      Image.asset("assets/images/splash.png"),
                      SizedBox(height: 6,),
                      Text('Admin App',style: TextStyle(
                        color: Colors.black,fontSize: 20,
                      ),),
                      RichText(

                          text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Shikafi Innovation ',
                                ),
                                TextSpan(
                                    text: '& ',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold
                                    )
                                ),TextSpan(
                                  text: 'Technology',
                                ),
                              ])),
                      // Text('Shikafi Innovation & Technology',style: TextStyle(
                      //   color: Colors.black,fontSize: 12,
                      // ),),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ListTile(
                    title: Text('Home'),
                    trailing: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                        child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,)),
                    onTap: () {
                      Get.off(ScreenAdminDashboard());
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ListTile(
                    title: Text('Google Site Kit'),
                    trailing: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                        child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,)),
                    onTap: () async {
                      setState(() async {
                        await _webViewController1.loadUrl(currentUrl[0]);
                        Navigator.pop(context);
                      });

                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ListTile(
                    trailing: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                        child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,)),
                    title: Text('Library'),
                    onTap: () async {
                      setState(() async {
                        await _webViewController1.loadUrl(currentUrl[1]);
                        Navigator.pop(context);
                      });


                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ListTile(
                    trailing: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                        child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,)),
                    title: Text('Add new Image'),
                    onTap: () async {
                      setState(() async {
                        await _webViewController1.loadUrl(currentUrl[2]);
                        Navigator.pop(context);
                      });

                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ListTile(
                    trailing: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                        child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,)),
                    title: Text('Package Orders'),
                    onTap: () async {
                      setState(() async {
                        await _webViewController1.loadUrl(currentUrl[3]);
                        Navigator.pop(context);
                      });

                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ListTile(
                    trailing: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                        child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,)),
                    title: Text('Viewers'),
                    onTap: () async {
                      setState(() async {
                        await _webViewController1.loadUrl(currentUrl[4]);
                        Navigator.pop(context);
                      });

                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ListTile(
                    trailing: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                        child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,)),
                    title: Text('Logout'),
                    onTap: () async {
                      Get.defaultDialog(title:'Alert',
                      content: Text('Do You want to logout?'),
                      confirm: TextButton(onPressed: ()async{
                       await _webViewController1.loadUrl('https://safestore.tech/wp-login.php?action=logout&_wpnonce=46d4b1c639');
                       Get.back();
                      }, child: Text("Yes")),
                      cancel: TextButton(onPressed: (){
                        Get.back();
                      }, child: Text("No")),

                      );
                      // await _webViewController1.loadUrl("https://safestore.tech");
                      // Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          );
        },)
      ),
      // drawer: Drawer(
      //   // Add a ListView to the drawer. This ensures the user can scroll
      //   // through the options in the drawer if there isn't enough vertical
      //   // space to fit everything.
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text('Drawer Header'),
      //       ),
      //       ListTile(
      //         title: const Text('Contact US'),
      //         onTap: () {
      //           _webViewController.loadUrl('https://app.center-best.com');
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Blog'),
      //         onTap: () {
      //          _webViewController.loadUrl('https://app.center-best.com');
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // bottomNavigationBar: StatefulBuilder(builder: (BuildContext context,
      //     void Function(void Function()) setState) {
      //   return FluidNavBar(
      //     animationFactor: .8, // (1)
      //     icons: [ // (2)
      //       FluidNavBarIcon(svgPath: "assets/images/home.svg",
      //           selectedForegroundColor: Colors.blue), // (3)
      //       FluidNavBarIcon(svgPath: "assets/images/appointments.svg",
      //           selectedForegroundColor: Colors.blue), // (3)
      //       FluidNavBarIcon(svgPath: "assets/images/add.svg",
      //           selectedForegroundColor: Colors.blue), // (3)
      //       FluidNavBarIcon(svgPath: "assets/images/profile.svg",
      //           selectedForegroundColor: Colors.blue), // (3)
      //     ],
      //     onChange: (index) {
      //       setState(() {
      //         _webViewController.loadUrl(currentUrl[index]);
      //         controller1.page.value = index;
      //       });
      //     }, // (4)
      //   );
      // },),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        // elevation: 0,
        title: Text('SafeStore'),
        actions: [
          IconButton(onPressed: () async {
            setState(() {
              isLoading=true;
              _webViewController1.reload();
            });
          }, icon: Icon(Icons.refresh),),
            IconButton(onPressed: () async {
              if (await _webViewController1.canGoBack()) {
                  _webViewController1.goBack();
              }
            }, icon: Icon(Icons.arrow_back,color: (bac==false)?Colors.grey:Colors.black,),),
          IconButton(onPressed: () async {
              if (await _webViewController1.canGoForward()) {
                 _webViewController1.goForward();
              }
            }, icon: Icon(Icons.arrow_forward,color: (far==false)?Colors.grey:Colors.black,),),
          ],
      ),
      body: Obx(() {
        return  CustomProgressWidget(
          loading: refresh,
          child: Stack(
              children: [
                WillPopScope(
                  onWillPop: () async {
                    if (await _webViewController1.canGoBack()) {
                      await _webViewController1.goBack();
                      return false;
                    }
                    else{
                      Get.back();
                    }
                    return true;
                  },
                  child: WebView(
                      gestureNavigationEnabled: true,
                      zoomEnabled: false,
                      navigationDelegate: (request) async {
                        bool nav = true;
                        if (request.url.contains(widget.initialUrl.toString())) {
                          setState(() {
                            // controller1.currentUrl[controller1.page.value] =
                            //     request.url;
                            controller1.update();
                            nav = true;
                          });
                        }
                        else {
                          bool confirm = await showDialog(
                            context: context,
                            builder: (context) =>
                                AlertDialog(
                                  title: Text('Are you sure?'),
                                  content: Text(
                                      'Do you want to exit the app and open the link in a browser?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: Text('No'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: Text('Yes'),
                                    ),
                                  ],
                                ),
                          );
                          if (confirm) {
                            await launch(request.url,);
                            SystemNavigator.pop();
                          }
                        }
                        return nav
                            ? NavigationDecision.navigate
                            : NavigationDecision.prevent;
                      },
                      key: _key,
                      // initialUrl: 'https://safestore.tech',
                      initialUrl: widget.initialUrl.toString(),
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (WebViewController controller) async {
                        _webViewController1 = controller;
                      },
                      // javascriptChannels: <JavascriptChannel>[
                      //   JavascriptChannel(
                      //       name: "passwordChannel",
                      //       onMessageReceived: (JavascriptMessage message) {
                      //         // Do something with the message received
                      //       }
                      //   ),
                      // ].toSet(),
                      onPageStarted: (String url) async {
                        setState(() {
                          isLoading = true;
                          refresh= false;
                          // _webViewController1.runJavascript("document.getElementsByTagName('header')[0].style.display='none'");
                        });
                      },
                      onPageFinished: (String url) async {
                        setState(() async {
                          if (await _webViewController1.canGoBack()) {
                          setState(() {
                          bac=true;
                          });
                          }  else{
                          bac=false;
                          }
                          if (await _webViewController1.canGoForward()) {
                          setState(() {
                          far=true;
                          });
                          }  else{
                          far=false;
                          // _webViewController1.runJavascript("document.getElementsByTagName('header')[0].style.display='none'");
                          }
                          isLoading = false;
                        });
                      },
                      onProgress: (value) {
                        setState(() {
                          var progress = value;
                          if (progress == 90) {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        });
                      },
                    ),
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  height: 50,
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Text(widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                   fontSize: 20,
                  )),
                ),
                Visibility(
                  visible: isLoading,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey[100],
                    child: Shimmer.fromColors(
                      baseColor: (controller1.page.value==0)?Colors.black12:(controller1.page.value==1)?Colors.red:(controller1.page.value==2)?Colors.yellow:Colors.white10,
                      highlightColor: (controller1.page.value==0)?Colors.white10:(controller1.page.value==1)?Colors.cyan:(controller1.page.value==2)?Colors.red:Colors.black12,
                      enabled: true,
                      child:
                      // Padding(
                      //   padding: EdgeInsets.only(top: 12.h),
                      //   child:Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         height: 100,
                      //         width: MediaQuery.of(context).size.width-40,
                      //         color: Colors.white,
                      //       ),
                      //       SizedBox(height: 100,),
                      //       Container(
                      //         height: 100,
                      //         width: MediaQuery.of(context).size.width-40,
                      //         color: Colors.white,
                      //       ),
                      //       SizedBox(height: 20,),
                      //       Container(
                      //         height: 100,
                      //         width: 100,
                      //         color: Colors.white,
                      //       ),
                      //     ],
                      //   ),
                        ListView.builder(
                          itemBuilder: (_, __) =>
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 48.0,
                                      height: 48.0,
                                      color: Colors.white,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[
                                          Container(
                                            width: double.infinity,
                                            height: 8.0,
                                            color: Colors.white,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 8.0,
                                            color: Colors.white,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                          ),
                                          Container(
                                            width: 40.0,
                                            height: 8.0,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          itemCount: 13,
                        ),
                      ),
                    ),
                  ),
              ]
          ),
        );
      }),

      // floatingActionButton: FutureBuilder<WebViewController>(
      //   future: _webViewController.future,
      //   builder: (BuildContext context,
      //       AsyncSnapshot<WebViewController> controller) {
      //     if (controller.hasData) {
      //       return FloatingActionButton(
      //         child: Icon(Icons.call_merge_outlined),
      //         onPressed: () async {
      //           String result = await controller.data!
      //               .runJavascriptReturningResult("window.callJavaMethod();");
      //           print(result);
      //         },
      //       );
      //     } else {
      //       return Container();
      //     }
      //   },
      // ),

    );
  }
}
// Future<bool> _onBackButtonPress() async {
//   // Prompt the user before closing the WebView
//   bool canClose = await showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text('Are you sure?'),
//       content: Text('Are you sure you want to close this page?'),
//       actions: <Widget>[
//         TextButton(
//           child: Text('Yes'),
//           onPressed: () => Navigator.pop(context, true),
//         ),
//         TextButton(
//           child: Text('No'),
//           onPressed: () => Navigator.pop(context, false),
//         ),
//       ],
//     ),
//   );
//
//   // Return true if the WebView can be closed, false otherwise
//   return canClose ?? false;
// }
// Future<bool> _onWillPop() async {
//   var value = await _webViewController.canGoBack();
//   if(value) {
//     _webViewController.goBack();
//     return false;
//   }
//   return true;
// }

