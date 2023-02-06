import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

class HostingerScreen extends StatefulWidget {
  String url;
  HostingerScreen({required this.url});

  @override
  State<HostingerScreen> createState() => _HostingerScreenState();
}

class _HostingerScreenState extends State<HostingerScreen> {
  @override
  void initState() {
    ExternalLinkOpener(widget.url.toString());
    Get.back();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
  void ExternalLinkOpener(String url){
    launch(url);
  }
}
