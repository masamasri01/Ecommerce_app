import 'package:flutter/material.dart';
import 'package:project3/Auth/Auth_provider.dart';
import 'package:provider/provider.dart';

class SplachScreen extends StatelessWidget {
  navigationFun(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Provider.of<AuthProvider>(context, listen: false).checkUser();
  }

  @override
  Widget build(BuildContext context) {
    navigationFun(context);
    // TODO: implement build
    return Scaffold(
      body: Center(child: FlutterLogo()),
    );
  }
}
