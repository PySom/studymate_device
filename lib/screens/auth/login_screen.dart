import 'package:flutter/material.dart';
import 'package:studymate_app/helper_widgets/alt_auth_action.dart';
import 'package:studymate_app/helper_widgets/loading_button.dart';
import 'package:studymate_app/helpers/ui_helpers.dart';
import 'package:studymate_app/responsive/orientation_layout.dart';
import 'package:studymate_app/responsive/screen_layout_type.dart';
import 'package:studymate_app/screens/auth/register_screen.dart';
import 'package:studymate_app/screens/home/home_page.dart';
import 'package:studymate_app/utils/constants.dart';

import 'auth_layout_desktop.dart';

class Login extends StatelessWidget {
  static const String id = 'login_screen';
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutType(
      desktop: OrientationLayout(
        landscape: AuthLayoutDesktop(
          svgAsset: 'auth_image.png',
          displayForm: LoginScreen(),
        ),
      ),
      mobile: OrientationLayout(
        portrait: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LoginScreen(),
            ),
          ),
        ),
        landscape: AuthLayoutDesktop(
          svgAsset: 'auth_image.png',
          displayForm: LoginScreen(),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email;
  String _password;
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Log in to',
          style: kAuthBoldText.copyWith(fontSize: scalableSize(context) * 28.0),
        ),
        SizedBox(
          height: 15.0,
        ),
        Form(
          key: _formKey,
          child: LoginForm(
            onEmailChange: (value) {
              setState(() {
                _email = value;
              });
            },
            onPasswordChange: (value) {
              setState(() {
                _password = value;
              });
            },
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          width: double.infinity,
          child: LoadingButton(
            text: 'Login',
            style: kAppCourseBoxInactive.copyWith(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
            isLoading: _loading,
            action: () async {
              if (_formKey.currentState.validate()) {
                setState(() {
                  _loading = true;
                });
                Navigator.of(context).pushNamedAndRemoveUntil(
                    HomePage.id, (Route<dynamic> route) => false);
//                await Auth.authProvider(context)
//                    .loginUser(_email, _password)
//                    .then((_) => setState(() {
//                          _loading = false;
//                        }))
//                    .catchError((error) {
//                  setState(() {
//                    _loading = false;
//                  });
//                  throw Exception(error);
//                });
//                Navigator.of(context).pushNamedAndRemoveUntil(
//                    HomePage.id, (Route<dynamic> route) => false);
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 14.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  //Navigator.of(context).pushNamed(ResetScreen.id);
                },
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                    color: kAppBlueFade,
                    fontSize: 10,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              AltAuthAction(
                defaultStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),
                leadingText: 'Don\'t have an account? ',
                actionText: 'Sign Up',
                actionStyle: TextStyle(
                  color: kAppBlueFade,
                  fontSize: 10,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(Register.id);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  final Function onEmailChange;
  final Function onPasswordChange;
  LoginForm({this.onEmailChange, this.onPasswordChange});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 34,
                child: AppSwitch(
                  onTap: () {},
                  leftText: 'Student',
                  rightText: 'Parent/Guardian',
                  indexActive: 0,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        TextFormField(
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          style: kInputText,
          decoration: const InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: 'Phone number',
          ),
          onChanged: (value) {
            onEmailChange(value);
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter your phone number';
            }
            return null;
          },
        ),
        SizedBox(
          height: 20.0,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          style: kInputText,
          obscureText: true,
          decoration: const InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: 'Password',
          ),
          onChanged: (value) {
            onPasswordChange(value);
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        ),
      ],
    );
  }
}
