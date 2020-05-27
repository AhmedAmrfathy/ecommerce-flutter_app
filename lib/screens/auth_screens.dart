import 'package:chatme/widgets/login_widget.dart';
import 'package:chatme/widgets/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_screens_provider.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthScreenProvider>(context);
    final devicesize = MediaQuery.of(context).size;
    return Scaffold(
        body: authprovider.loginmode()
            ? Login(devicesize)
            :SignUp(devicesize));
  }
}
