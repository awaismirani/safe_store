import 'dart:convert';
import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/my_controllers.dart';

class MyWebView extends StatefulWidget {
  final String url;

  MyWebView({required this.url});

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
InAppWebViewController? webViewController;
PullToRefreshController? refController;
var controller1 = Get.put(MyControllers());
final List<String> currentUrl = [
  'https://safestore.tech',
  'https://safestore.tech',
  'https://safestore.tech',
  'https://safestore.tech',
];
  @override
  void initState() {
    refController=PullToRefreshController(
      onRefresh: (){
        webViewController!.reload();
      },
      options: PullToRefreshOptions(
        color: Colors.black,
        backgroundColor: Colors.yellow,

      ),
    );
    super.initState();
  }

bool isLoading = false;
Color bacColor=Colors.black;

bool refresh=false;
var myUrl='';
bool bac=false;
bool far=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
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
                  title: Text('Owner Complex'),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,)),
                  onTap: () {
                    webViewController!.loadUrl(urlRequest: URLRequest(url: Uri(path:"http://microprogramers.org")));
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
                  title: Text('Owner Simple'),
                  onTap: () {
                    webViewController!.loadUrl(urlRequest: URLRequest(url: Uri(path:"http://microprogramers.org")));
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
                  title: Text('IT Manager'),
                  onTap: () {
                    webViewController!.loadUrl(urlRequest: URLRequest(url: Uri(path:"http://microprogramers.org")));
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
                  title: Text('Accounts Manager'),
                  onTap: () {
                    webViewController!.loadUrl(urlRequest: URLRequest(url: Uri(path:"http://microprogramers.org")));
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
                  title: Text('Administrator'),
                  onTap: () {
                    webViewController!.loadUrl(urlRequest: URLRequest(url: Uri(path:"http://microprogramers.org")));
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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
      appBar: AppBar(title: Text('InAppWebview'),
        actions: [
          IconButton(onPressed: () async {
            setState(() {
              isLoading=true;
              webViewController!.reload();
            });
          }, icon: Icon(Icons.refresh),),
          IconButton(onPressed: () async {
            if (await webViewController!.canGoBack()) {
              setState(() {
                webViewController!.goBack();
              });
            }
          }, icon: Icon(Icons.arrow_back,color: (bac==false)?Colors.grey:Colors.black,),),
          IconButton(onPressed: () async {
            if (await webViewController!.canGoForward()) {
              setState(() {
                webViewController!.goForward();
              });
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
                    if (await webViewController!.canGoBack()) {
                      webViewController!.goBack();
                      return false;
                    }
                    return true;
                  },
                  child:  InAppWebView(
                    // initialOptions: InAppWebViewGroupOptions(
                    //   android: AndroidInAppWebViewOptions(
                    //     cacheMode: AndroidCacheMode.LOAD_CACHE_ELSE_NETWORK,
                    //       appCachePath:'/path/to/custom/cache',
                    //     // databaseEnabled = true,
                    //   ),
                    // ),
                    // onNavigationRequest: (NavigationRequest request) {
                    //   if (!request.url.startsWith("https://www.example.com")) {
                    //     _controller.stopLoading();
                    //     return;
                    //   }
                    // },
                    initialOptions: InAppWebViewGroupOptions(

                      crossPlatform: InAppWebViewOptions(
                        javaScriptEnabled: true,

                        // clearCache: false,
                        cacheEnabled: true,
                        mediaPlaybackRequiresUserGesture: false,
                        javaScriptCanOpenWindowsAutomatically: true,
                      ),
                    ),
                    // initialOptions: InAppWebViewGroupOptions(
                    //   crossPlatform: InAppWebViewOptions(
                    //     cacheEnabled: true,
                    //     // useShouldOverrideUrlLoading: true
                    //   ),
                    // ),
                    // shouldOverrideUrlLoading: (controller, request) async {
                    //   var url = request.url;
                    //   var uri = Uri.parse(url);
                    //
                    //   if (!["http", "https", "file",
                    //     "chrome", "data", "javascript",
                    //     "about"].contains(uri.scheme)) {
                    //     if (await canLaunch(url)) {
                    //       // Launch the App
                    //       await launch(
                    //         url,
                    //       );
                    //       // and cancel the request
                    //       return ShouldOverrideUrlLoadingAction.CANCEL;
                    //     }
                    //   }
                    //
                    //   return ShouldOverrideUrlLoadingAction.ALLOW;
                    // },
                    shouldOverrideUrlLoading: (controller, navigationAction) async {
                      final uri = navigationAction.request.url!;
                      print("uri = " + uri.toString());
                      bool nav = false;
                      if (uri.toString().contains('http://microprogramers.org')) {
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
                          await launch(uri.toString());
                          SystemNavigator.pop();
                        }
                      }
                      // return nav ? ShouldOverrideUrlLoadingAction.ALLOW : NavigationDecision.prevent;
                      if (uri.toString().contains('http://microprogramers.org')) {
                        return NavigationActionPolicy.ALLOW;
                      }
                      return NavigationActionPolicy.CANCEL;
                    },
                    initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
                    onWebViewCreated: (InAppWebViewController controller){
                      webViewController=controller;
                      var url=controller.getUrl();
                      print('Url Requested'+url.toString());
                      // controller.android.startSafeBrowsing(t);
                      // webViewController!.loadUrl(urlRequest: URLRequest(url: Uri(path:url.toString())));
                    },
                    // onUpdateVisitedHistory: ,
                    onLoadStart: (controller, url) async {
                      Uri uRl=Uri.parse(url.toString());
                      String URl=uRl.toString();
                      // if (!(URl.contains('microprogramers.org'))) {
                      //   controller.stopLoading();
                      //   bool confirm = await showDialog(
                      //     context: context,
                      //     builder: (context) =>
                      //         AlertDialog(
                      //           title: Text('Are you sure?'),
                      //           content: Text(
                      //               'Do you want to exit the app and open the link in a browser?'),
                      //           actions: <Widget>[
                      //             TextButton(
                      //               onPressed: () =>
                      //                   Navigator.of(context).pop(false),
                      //               child: Text('No'),
                      //             ),
                      //             TextButton(
                      //               onPressed: () =>
                      //                   Navigator.of(context).pop(true),
                      //               child: Text('Yes'),
                      //             ),
                      //           ],
                      //         ),
                      //   );
                      //   if (confirm) {
                      //     await launch(url.toString());
                      //     SystemNavigator.pop();
                      //   }
                      // }
                      // else {
                      //   // webViewController!.stopLoading();
                      //   // webViewController!.loadUrl(urlRequest: URLRequest(url: Uri(path:url.toString())));
                      // }
                      setState(() {
                        // isLoading = true;
                        refresh=false;

                      });
                    },
                    onLoadStop: (controller, url) async {
                      setState(() async {
                        refController!.endRefreshing();
                        if (await webViewController!.canGoBack()) {
                          setState(() {
                            bac=true;
                          });
                        }
                        else{
                          bac=false;
                        }
                        if (await webViewController!.canGoForward()) {
                          setState(() {
                            far=true;
                          });
                        }
                        else{
                          far=false;
                        }
                        isLoading = false;
                      });
                    },
                    pullToRefreshController: refController,
                    onProgressChanged: (controller,value) {
                      setState(() {
                        var progress = value;
                        if (progress <= 90){
                        setState(() {
                        isLoading = true;
                        });
                        }
                        else  {
                          setState(() {
                            isLoading = false;
                          });
                        }

                      });
                    },
                  ),
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
                      child: Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width-40,
                              color: Colors.white,
                            ),
                            SizedBox(height: 100,),
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width-40,
                              color: Colors.white,
                            ),
                            SizedBox(height: 20,),
                            Container(
                              height: 100,
                              width: 100,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        // ListView.builder(
                        //   itemBuilder: (_, __) =>
                        //       Padding(
                        //         padding: const EdgeInsets.only(bottom: 8.0),
                        //         child: Row(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: <Widget>[
                        //             Container(
                        //               width: 48.0,
                        //               height: 48.0,
                        //               color: Colors.white,
                        //             ),
                        //             const Padding(
                        //               padding: EdgeInsets.symmetric(
                        //                   horizontal: 8.0),
                        //             ),
                        //             Expanded(
                        //               child: Column(
                        //                 crossAxisAlignment: CrossAxisAlignment
                        //                     .start,
                        //                 children: <Widget>[
                        //                   Container(
                        //                     width: double.infinity,
                        //                     height: 8.0,
                        //                     color: Colors.white,
                        //                   ),
                        //                   const Padding(
                        //                     padding: EdgeInsets.symmetric(
                        //                         vertical: 2.0),
                        //                   ),
                        //                   Container(
                        //                     width: double.infinity,
                        //                     height: 8.0,
                        //                     color: Colors.white,
                        //                   ),
                        //                   const Padding(
                        //                     padding: EdgeInsets.symmetric(
                        //                         vertical: 2.0),
                        //                   ),
                        //                   Container(
                        //                     width: 40.0,
                        //                     height: 8.0,
                        //                     color: Colors.white,
                        //                   ),
                        //                 ],
                        //               ),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //   itemCount: 13,
                        // ),
                      ),
                    ),
                  ),
                ),
              ]
          ),
        );
      }),

      // body: FutureBuilder<String>(
      //   future: fetchWebPage(),
      //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      //     if (snapshot.hasData) {
      //       return WebView(
      //         initialUrl: Uri.dataFromString(snapshot.data!, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString(),
      //       );
      //     } else if (snapshot.hasError) {
      //       return Center(
      //         child: Text("Error: ${snapshot.error}"),
      //       );
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
    );
  }
}