import 'dart:async';
import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:safe_store/screens/screen_welcome_page.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/my_controllers.dart';

class ScreenAdminComplex extends StatefulWidget {
  String title;
  String initialUrl;
  ScreenAdminComplex({required this.title,required this.initialUrl,});

  @override
  _ScreenAdminComplexState createState() => _ScreenAdminComplexState();
}
List<String> list = <String>['All Post', 'Add New Post',];
List<String> list1 = <String>[
  'Countries',
  'Add New Countries',
  'Ads',
  'Add new Ad',
  'Category',
  'Currency',
  'User Contacts',
];
late WebViewController _webViewController2;
class _ScreenAdminComplexState extends State<ScreenAdminComplex> {

  bool bac=false;
  bool far=false;
  var controller1 = Get.put(MyControllers());
  final List<String> currentUrl = [
    'https://safestore.tech/wp-admin/index.php',
    'https://safestore.tech/wp-admin/admin.php?page=googlesitekit-dashboard',
    // 'https://safestore.tech/wp-admin/post-new.php',
    // 'https://safestore.tech/wp-admin/edit.php',
    // 'https://safestore.tech/wp-admin/edit.php?post_type=shop_order',
    // 'https://safestore.tech/wp-admin/options-general.php?page=post-views-counter',
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
  String dropdownValue = list.first;
  String dropdownValue1 = list1.first;
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
                      onTap: () async {
                        Get.off(ScreenAdminDashboard());
                        // await _webViewController2.loadUrl("https://safestore.tech/ad/iphone-13-gorilla-glass-128-gb-dual-sim/");
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: ListTile(
                      title: Text('DashBoard'),
                      trailing: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                          child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,)),
                      onTap: () async {
                        await _webViewController2.loadUrl(currentUrl[0]);
                        Navigator.pop(context);
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
                      title: Text('Google Kit'),
                      onTap: () async {
                        await  _webViewController2.loadUrl(currentUrl[1]);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 14.0),
                  //   child: ListTile(
                  //     trailing: Container(
                  //         decoration: BoxDecoration(
                  //           color: Colors.grey.withOpacity(.3),
                  //           borderRadius: BorderRadius.circular(12),
                  //         ),
                  //         padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                  //         child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,)),
                  //     title: Text('IT Manager'),
                  //     onTap: () async {
                  //       await _webViewController2.loadUrl("https://safestore.tech");
                  //       Navigator.pop(context);
                  //     },
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 14.0),
                  //   child: ListTile(
                  //     trailing: Container(
                  //         decoration: BoxDecoration(
                  //           color: Colors.grey.withOpacity(.3),
                  //           borderRadius: BorderRadius.circular(12),
                  //         ),
                  //         padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                  //         child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,)),
                  //     title: Text('Accounts Manager'),
                  //     onTap: () async {
                  //       await  _webViewController2.loadUrl("https://safestore.tech");
                  //       Navigator.pop(context);
                  //     },
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 14.0),
                  //   child: ListTile(
                  //     trailing: Container(
                  //         decoration: BoxDecoration(
                  //           color: Colors.grey.withOpacity(.3),
                  //           borderRadius: BorderRadius.circular(12),
                  //         ),
                  //         padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                  //         child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,)),
                  //     title: Text('popup'),
                  //     onTap: () async {
                  //       await DropdownButton<String>(
                  //         value: dropdownValue,
                  //         icon: const Icon(Icons.arrow_downward),
                  //         elevation: 16,
                  //         style: const TextStyle(color: Colors.deepPurple),
                  //         underline: Container(
                  //           height: 2,
                  //           color: Colors.deepPurpleAccent,
                  //         ),
                  //         onChanged: (String? value) {
                  //           // This is called when the user selects an item.
                  //           setState(() {
                  //             dropdownValue = value!;
                  //           });
                  //         },
                  //         items: list.map<DropdownMenuItem<String>>((String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(value),
                  //           );
                  //         }).toList(),
                  //       );
                  //       // Navigator.pop(context);
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                
                padding: EdgeInsets.symmetric(vertical: 3,horizontal: 20),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                icon: Icon(Icons.arrow_drop_down),
                elevation: 16,
                style: TextStyle(color: Colors.black),
                underline: Container(
                height: 0,
                ),
                onChanged: (String? value) {
                setState(() async {
                dropdownValue = value!;
                if (dropdownValue=='All Post') {
                 await _webViewController2.loadUrl('https://safestore.tech/wp-admin/edit.php');
                }
                else if (dropdownValue=='Add New Post') {
                  await _webViewController2.loadUrl('https://safestore.tech/wp-admin/post-new.php');
                }
                Get.back();
                });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
                );
                }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 3,horizontal: 20),
                child: DropdownButton<String>(
                  isExpanded: true,

                  value: dropdownValue1,
                icon: Icon(Icons.arrow_drop_down),
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                height: 0,
                color: Colors.black,
                ),
                onChanged: (String? value) {
                setState(() async {
                dropdownValue1 = value!;
                if (dropdownValue1=='Countries') {
                 await _webViewController2.loadUrl('https://safestore.tech/wp-admin/edit.php?post_type=_sb_country');
                }
                else if (dropdownValue1=='Add New Countries') {
                  await _webViewController2.loadUrl('https://safestore.tech/wp-admin/post-new.php?post_type=_sb_country');
                }
                else if (dropdownValue1=='Ads') {
                  await _webViewController2.loadUrl('https://safestore.tech/wp-admin/edit.php?post_type=ad_post');
                }
                else if (dropdownValue1=='Add new Ad') {
                  await _webViewController2.loadUrl('https://safestore.tech/wp-admin/post-new.php?post_type=ad_post');
                }
                else if (dropdownValue1=='Category') {
                  await _webViewController2.loadUrl('https://safestore.tech/wp-admin/edit-tags.php?taxonomy=ad_cats&post_type=ad_post');
                }
                else if (dropdownValue1=='Currency') {
                  await _webViewController2.loadUrl('https://safestore.tech/wp-admin/edit-tags.php?taxonomy=ad_currency&post_type=ad_post');
                }
                else if (dropdownValue1=='User Contacts') {
                  await _webViewController2.loadUrl('https://safestore.tech/wp-admin/admin.php?page=wpcf7');
                }
                Get.back();
                });
                },
                items: list1.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
                );
                }).toList(),
                ),
              ),
            ),
                  SizedBox(height: 20,),
                ],
              ),
            );
          },)
      ),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text('Safe Store'),

        actions: [
          IconButton(onPressed: () async {
            setState(() {
              isLoading=true;
              _webViewController2.reload();
            });
          }, icon: Icon(Icons.refresh),),
          IconButton(onPressed: () async {
            if (await _webViewController2.canGoBack()) {
              _webViewController2.goBack();
            }
          }, icon: Icon(Icons.arrow_back,color: (bac==false)?Colors.grey:Colors.black,),),
          IconButton(onPressed: () async {
            if (await _webViewController2.canGoForward()) {
              _webViewController2.goForward();
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
                    if (await _webViewController2.canGoBack()) {
                      await _webViewController2.goBack();
                      return false;
                    }
                    return true;
                  },
                  child: WebView(
                    gestureNavigationEnabled: true,
                    zoomEnabled: false,
                    navigationDelegate: (request) async {
                      bool nav = false;
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
                          await launch(request.url);
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
                      _webViewController2 = controller;
                    },
                    javascriptChannels: <JavascriptChannel>[
                      JavascriptChannel(
                          name: "passwordChannel",
                          onMessageReceived: (JavascriptMessage message) {
                            // Do something with the message received
                          }
                      ),
                    ].toSet(),
                    onPageStarted: (String url) async {
                      setState(() {
                        isLoading = true;
                        refresh= false;

                      });
                    },
                    onPageFinished: (String url) async {
                      setState(() async {
                        if (await _webViewController2.canGoBack()) {
                          setState(() {
                            bac=true;
                          });
                        }  else{
                          bac=false;
                        }
                        if (await _webViewController2.canGoForward()) {
                          setState(() {
                            far=true;
                          });
                        }  else{
                          far=false;
                        }
                        isLoading = false;
                      });
                    },
                    onProgress: (value) {
                      setState(() {
                        var progress = value;
                        if (progress == 80) {
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
    );
  }
}

