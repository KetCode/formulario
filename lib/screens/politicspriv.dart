import 'package:flutter/material.dart';

class PolPriv extends StatelessWidget {
  const PolPriv({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Big text maker produces beautiful huge text which can be posted on Facebook, Google+ or other social networks. The text which BTM produces is actually ASCII art and that's why it will work on any website. You can even use it on your blog or website. Big Text Maker is free to use, you don't need to download any toolbars or anything, it won't ask you for registration or your email address, just simply use it. If you like it please tell your friends, we want everybody to know about BTM and Font General!"),
          ],
        ),
      ),
    );
  }
}
