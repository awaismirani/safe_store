import 'package:flutter/material.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({Key? key}) : super(key: key);

  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('UserName or Email',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(12),
                ),
                hintText: 'User Name or email',
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Password',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(12),
                ),
                hintText: 'Password',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
