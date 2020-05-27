import 'package:chatme/exceptions/signup_exception.dart';
import 'package:chatme/providers/auth_screens_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/userauth.dart';

class SignUp extends StatefulWidget {
  final Size size;

  SignUp(this.size);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  var isloading = false;
  final form = GlobalKey<FormState>();
  final passfocus = FocusNode();
  final emailfocus = FocusNode();
  final passconffocus = FocusNode();
  final mobilenumfocus = FocusNode();
  final passwordconfcontroller = TextEditingController();
  Map signupmap = {
    'email': '',
    'password': '',
    'passwordconf': '',
    'name': '',
    'mobilephone': '',
  };

  void showerrordialog(String massage) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('sorry an error occured'),
              content: Text(massage),
              actions: <Widget>[
                FlatButton(
                  child: Text('ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  Future<void> signUp() async {
    if (form.currentState.validate()) {
      form.currentState.save();
      setState(() {
        isloading = true;
      });
      try {
        await Provider.of<User>(context, listen: false).signup(
            name: signupmap['name'],
            email: signupmap['email'],
            phone: signupmap['mobilephone'],
            pass: signupmap['password'],
            passconf: signupmap['passwordconf']);
      } on SignUpException catch (error) {
        showerrordialog(error.toString());
      } catch (error) {
        var err = 'sorry we cant authontocate you now please try again later';
        showerrordialog(err);
      }
      setState(() {
        isloading = false;
      });
      Provider.of<AuthScreenProvider>(context, listen: false).switchmode();
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
                      image: AssetImage('assets/sig.jpg'), fit: BoxFit.cover)),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromRGBO(0, 0, 140, .3),
                Color.fromRGBO(0, 0, 255, .5)
              ])),
            ),
            Positioned(
              top: 50,
              child: Container(
                width: widget.size.width,
                height: widget.size.height,
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Text('Sign Up',
                          style: GoogleFonts.pacifico(
                            color: Colors.white,
                            fontSize: 50,
                          )),
                    ),
                    Flexible(
                      flex: 4,
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
                                        labelText: 'Name',
                                        labelStyle:
                                            TextStyle(color: Colors.white)),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (value) {
                                      FocusScope.of(context)
                                          .requestFocus(emailfocus);
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'please enter your name';
                                      } else if (value.length < 5) {
                                        return 'invalid name';
                                      }
                                    },
                                    onSaved: (value) {
                                      signupmap['name'] = value;
                                    },
                                  ),
                                  TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    focusNode: emailfocus,
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
                                      signupmap['email'] = value;
                                    },
                                  ),
                                  TextFormField( style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(passconffocus);
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'please enter your password';
                                      } else if (value.length < 10) {
                                        return 'this is not valid password';
                                      }
                                    },
                                    onSaved: (value) {
                                      signupmap['password'] = value;
                                    },
                                    focusNode: passfocus,
                                    controller: passwordconfcontroller,
                                  ),
                                  TextFormField( style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: 'Password conf',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(mobilenumfocus);
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'please confirm enter your password';
                                      } else if (value.length < 10) {
                                        return 'this is not valid password';
                                      } else if (value !=
                                          passwordconfcontroller.text) {
                                        return 'password not matched ';
                                      }
                                    },
                                    onSaved: (value) {
                                      signupmap['passwordconf'] = value;
                                    },
                                    focusNode: passconffocus,
                                  ),
                                  TextFormField( style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        labelText: 'phone number',
                                        labelStyle:
                                            TextStyle(color: Colors.white)),
                                    textInputAction: TextInputAction.done,
                                    focusNode: mobilenumfocus,
                                    onFieldSubmitted: (_) {},
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'plase enter phone number';
                                      } else if (value.length < 11 ||
                                          value.length > 11) {
                                        return 'invalid phone number';
                                      }
                                    },
                                    onSaved: (value) {
                                      signupmap['mobilephone'] = value;
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: isloading == false
                          ? Container(
                              margin: EdgeInsets.only(top: 15),
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: FlatButton(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 255, 1)),
                                ),
                                onPressed: signUp,
                              ),
                            )
                          : CircularProgressIndicator(),
                    ),
                    Flexible(
                      flex: 1,
                      child: InkWell(
                          hoverColor: Colors.black,
                          onTap: () {
                            authobject.switchmode();
                          },
                          child: Container(
                              margin: EdgeInsets.all(17),
                              child: Text(
                                'Log in ! instead',
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
