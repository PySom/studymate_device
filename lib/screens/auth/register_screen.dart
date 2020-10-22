import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studymate_app/helper_widgets/alt_auth_action.dart';
import 'package:studymate_app/helper_widgets/loading_button.dart';
import 'package:studymate_app/helpers/ui_helpers.dart';
import 'package:studymate_app/responsive/orientation_layout.dart';
import 'package:studymate_app/responsive/screen_layout_type.dart';
import 'package:studymate_app/screens/auth/login_screen.dart';
import 'package:studymate_app/screens/choose_profile/choose_profile.dart';
import 'package:studymate_app/screens/course/course.dart';
import 'package:studymate_app/screens/home/home_page.dart';
import 'package:studymate_app/screens/my_course/my_course.dart';
import 'package:studymate_app/screens/profile/profile.dart';
import 'package:studymate_app/screens/quiz_page/quiz_page.dart';
import 'package:studymate_app/screens/recent_courses/recent_courses.dart';
import 'package:studymate_app/screens/study_pack/study_pack.dart';
import 'package:studymate_app/screens/test_done/test_done.dart';
import 'package:studymate_app/screens/test_entry/test_entry.dart';
import 'package:studymate_app/screens/video_course/video_course.dart';
import 'package:studymate_app/utils/constants.dart';
import 'auth_layout_desktop.dart';

class Register extends StatelessWidget {
  static const String id = 'register_screen';
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutType(
      desktop: OrientationLayout(
        landscape: AuthLayoutDesktop(
          svgAsset: 'auth_image.png',
          displayForm: RegisterScreen(),
        ),
      ),
      mobile: OrientationLayout(
        portrait: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RegisterScreen(),
            ),
          ),
        ),
        landscape: AuthLayoutDesktop(
          svgAsset: 'auth_image.png',
          displayForm: RegisterScreen(),
        ),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email;
  String _password;
  int _switchIndex = 0;
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Sign up to Studymate',
          style: kAuthBoldText.copyWith(fontSize: scalableSize(context) * 28.0),
        ),
        SizedBox(
          height: 15.0,
        ),
        Form(
          key: _formKey,
          child: RegisterForm(
            switchIndex: _switchIndex,
            onSwitchTap: (index) {
              setState(() {
                _switchIndex = index;
              });
            },
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
            text: 'Create Account',
            style: kAppCourseBoxInactive.copyWith(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
            isLoading: _loading,
            action: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  HomePage.id, (Route<dynamic> route) => false);
              // if (_formKey.currentState.validate()) {
              //   setState(() {
              //     _loading = true;
              //   });
              //  await Auth.authProvider(context)
              //      .loginUser(_email, _password)
              //      .then((_) => setState(() {
              //            _loading = false;
              //          }))
              //      .catchError((error) {
              //    setState(() {
              //      _loading = false;
              //    });
              //    throw Exception(error);
              //  });
              //  Navigator.of(context).pushNamedAndRemoveUntil(
              //      HomePage.id, (Route<dynamic> route) => false);
              // }
            },
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        AltAuthAction(
          defaultStyle: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
          leadingText: 'Creating an account means you are okay with our ',
          actionText: 'Terms of Service & Privacy Policy',
          actionStyle: TextStyle(color: kAppBlueFade, fontSize: 10),
          onTap: () {
            //Navigator.of(context).pushNamed(SignUpScreen.id);
          },
        ),
        SizedBox(
          height: 15.0,
        ),
        AltAuthAction(
          defaultStyle: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
          leadingText: 'Have an account? ',
          actionText: 'Login',
          actionStyle: TextStyle(
            color: kAppBlueFade,
            fontSize: 10,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(Login.id);
          },
        ),
      ],
    );
  }
}

class RegisterForm extends StatelessWidget {
  final Function onEmailChange;
  final Function onPasswordChange;
  final Function onSwitchTap;
  final int switchIndex;
  RegisterForm(
      {this.onEmailChange,
      this.onPasswordChange,
      this.onSwitchTap,
      this.switchIndex});
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
                  onTap: onSwitchTap,
                  leftText: 'Student',
                  rightText: 'Parent/Guardian',
                  indexActive: switchIndex,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: kInputText,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'First Name',
                ),
                onChanged: (value) {
                  onEmailChange(value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: kInputText,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Last Name',
                ),
                onChanged: (value) {
                  onEmailChange(value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Expanded(
              child: StyledDropDown(label: 'Gender'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: StyledDatePicker(
                label: 'Date of Birth',
                onTap: () {},
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
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

class AppSwitch extends StatelessWidget {
  final Function onTap;
  final int indexActive;
  final String leftText;
  final String rightText;
  final Color inActiveTextColor;
  final Color inActiveBgColor;
  final Color activeBgColor;
  final double fontSize;
  AppSwitch(
      {this.onTap,
      this.indexActive,
      this.leftText,
      this.rightText,
      this.inActiveTextColor,
      this.inActiveBgColor,
      this.activeBgColor,
      this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.clip,
      children: [
        UserSwitch(
          key: GlobalKey(),
          text: leftText,
          isActive: indexActive == 0,
          onTap: () => onTap(0),
          activeBgColor: activeBgColor,
          inActiveBgColor: inActiveBgColor,
          inActiveTextColor: inActiveTextColor,
          fontSize: fontSize,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: UserSwitch(
            key: GlobalKey(),
            text: rightText,
            isActive: indexActive == 1,
            onTap: () => onTap(1),
            activeBgColor: activeBgColor,
            inActiveBgColor: inActiveBgColor,
            inActiveTextColor: inActiveTextColor,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}

class UserSwitch extends StatelessWidget {
  final Function onTap;
  final bool isActive;
  final Color inActiveTextColor;
  final Color inActiveBgColor;
  final Color activeBgColor;
  final String text;
  final Key key;
  final double fontSize;

  const UserSwitch(
      {this.onTap,
      this.isActive,
      this.inActiveTextColor,
      this.inActiveBgColor,
      this.activeBgColor,
      this.text,
      this.key,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, sizing) {
        return ButtonTheme(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: kAppBorderRadius,
            side: activeBgColor != null
                ? BorderSide.none
                : BorderSide(
                    color:
                        isActive ? activeBgColor ?? kAccent : kBorderUnFocused,
                    width: 0.3),
          ),
          minWidth: sizing.maxWidth / 1.9,
          child: FlatButton(
            color: isActive
                ? activeBgColor ?? kAccent
                : inActiveBgColor ?? kPrimary,
            onPressed: onTap,
            child: Text(
              text,
              style: TextStyle(
                  color: isActive
                      ? Colors.white
                      : inActiveTextColor ?? Colors.black,
                  fontSize: fontSize ?? 10),
            ),
          ),
        );
      },
    );
  }
}

class StyledDropDown extends StatelessWidget {
  final String label;
  StyledDropDown({this.label});
  @override
  Widget build(BuildContext context) {
    return FloatingLabelContainer(
      label: label,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          dropdownColor: Colors.white,
          onChanged: (value) {},
          elevation: 1,
          icon: Icon(
            Icons.unfold_more,
            color: kBorderUnFocused,
            size: 10.0,
          ),
          isExpanded: false,
          style: kInputText.copyWith(color: Colors.black),
          items: ["Chisom", "Nwisu"]
              .map(
                (name) => DropdownMenuItem(
                  value: name,
                  child: Text(name),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class StyledDatePicker extends StatelessWidget {
  final Function onTap;
  final DateTime dob;
  final String label;
  StyledDatePicker({this.onTap, this.dob, this.label});
  Widget build(BuildContext context) {
    return FloatingLabelContainer(
      label: label,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                dob != null ? '${dob.day} / ${dob.month} / ${dob.year}' : '',
                style: kInputText.copyWith(fontSize: 10.0),
              ),
            ),
            Icon(
              Icons.unfold_more,
              color: kBorderUnFocused,
              size: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingLabelContainer extends StatelessWidget {
  final Widget child;
  final String label;
  FloatingLabelContainer({this.child, this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 35.0,
            padding: EdgeInsets.only(
              right: 13.0,
              left: 27.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: kBorderUnFocused,
                width: 0.3,
              ),
              borderRadius: kAppBorderRadius,
            ),
            child: child,
          ), //m
          Positioned(
            top: -3,
            left: 22.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              color: Colors.white,
              child: Text(
                label,
                style: kFloatingLabelStyle.copyWith(fontSize: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
