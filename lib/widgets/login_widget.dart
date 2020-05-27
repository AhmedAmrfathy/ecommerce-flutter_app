import 'package:chatme/providers/auth_screens_provider.dart';
import 'package:chatme/providers/userauth.dart';
import 'package:chatme/screens/homepage_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  final Size size;

  Login(this.size);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final form = GlobalKey<FormState>();
  final passfocus = FocusNode();
  var isloading = false;
  Map loginmap = {
    'email': '',
    'password': '',
  };

  Future<void> login() async {
    if (form.currentState.validate()) {
      form.currentState.save();
      setState(() {
        isloading = true;
      });
      try {
        await Provider.of<User>(context, listen: false)
            .login(email: loginmap['email'], password: loginmap['password']);
        setState(() {
          isloading = false;
          Navigator.of(context).pushReplacementNamed(HomePageScreen.route);
        });
      } catch (error) {
        print(error.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authobject = Provider.of<AuthScreenProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Container(
        width: widget.size.width,
        height: widget.size.height,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/login.jpg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromRGBO(0, 0, 140, .3),
                Color.fromRGBO(0, 0, 255, .5)
              ])),
            ),
            Positioned(
              top: 150,
              child: Container(
                width: widget.size.width,
                height: widget.size.height,
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Text('Log in',
                          style: GoogleFonts.pacifico(
                            color: Colors.white,
                            fontSize: 50,
                          )),
                    ),
                    Flexible(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Form(
                            key: form,
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(passfocus);
                                    },
                                    validator: (value) {
                                      if (!value.contains('@')) {
                                        return 'this is not valid email';
                                      } else if (value.length < 15) {
                                        return 'this is not valid email';
                                      } else if (value.isEmpty) {
                                        return 'please enter your email address';
                                      } else if (value.contains('+') ||
                                          value.contains('*')) {
                                        return 'not valid character';
                                      }
                                    },
                                    onSaved: (value) {
                                      loginmap['email'] = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                    ),
                                    textInputAction: TextInputAction.done,
                                    onFieldSubmitted: (_) {},
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'please enter your password';
                                      } else if (value.length < 10) {
                                        return 'this is not valid password';
                                      }
                                    },
                                    onSaved: (value) {
                                      loginmap['password'] = value;
                                    },
                                    focusNode: passfocus,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: isloading
                          ? CircularProgressIndicator()
                          : Container(
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: FlatButton(
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 255, 1)),
                                ),
                                onPressed: login,
                              ),
                            ),
                    ),
                    Flexible(
                      flex: 2,
                      child: InkWell(
                          hoverColor: Colors.black,
                          onTap: () {
                            authobject.switchmode();
                          },
                          child: Container(
                              margin: EdgeInsets.all(17),
                              child: Text(
                                'Sign Up ! instead',
                                style: TextStyle(color: Colors.white),
                              ))),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
