import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studymate_app/helper_widgets/custom_dialog.dart';
import 'package:studymate_app/helper_widgets/loading_button.dart';
import 'package:studymate_app/screens/auth/auth_layout_desktop.dart';
import 'package:studymate_app/screens/auth/register_screen.dart';
import 'package:studymate_app/screens/choose_profile/choose_profile_desktop.dart';
import 'package:studymate_app/utils/constants.dart';

import '../layout.dart';

class ProfileDesktop extends StatelessWidget {
  _openEditProfile(BuildContext context) {
    showDialog(
      barrierColor: Color(0xFF096AC2).withOpacity(0.47),
      context: context,
      builder: (_) => CustomDialog(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 4,
            vertical: MediaQuery.of(context).size.width / 20),
        child: AuthDialogLayout(
          header: 'Add new profile',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EditMainProfileForm(
                onEmailChange: () {},
                onPasswordChange: () {},
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: LoadingButton(
                  text: 'Submit',
                  style: kAppCourseBoxInactive.copyWith(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                  isLoading: false,
                  action: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Personal Profile',
                        style: kAppHeaderText.copyWith(fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () => _openEditProfile(context),
                        child: Text(
                          'Edit Profile',
                          style: kAppCourseBoxInactive.copyWith(
                            color: kAppBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: kBorderUnFocused,
                        width: 0.1,
                      ),
                      borderRadius: kAppBorderRadiusMini,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ProfileDetail(
                                header: 'Full name',
                                body: 'Chisom Blessing',
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: ProfileDetail(
                                header: 'Date of Birth',
                                body: '21st January, 2020',
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ProfileDetail(
                                header: 'Phone number',
                                body: '07066647684',
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: ProfileDetail(
                                header: 'Location',
                                body: 'Lagos, Nigeria',
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: kBorderUnFocused,
                        width: 0.1,
                      ),
                      borderRadius: kAppBorderRadiusMini,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Achievements',
                          style: kAppHeaderText.copyWith(fontSize: 10),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: BadgeContainer(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: BadgeContainer(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: BadgeContainer(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: BadgeContainer(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: BadgeContainer(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Possible Badges',
              style: kAppHeaderText.copyWith(fontSize: 12),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: StreakBadge(),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: StreakBadge(),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: StreakBadge(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: StreakBadge(),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: StreakBadge(),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: StreakBadge(),
                ),
              ],
            ),
            SizedBox(
              height: 38,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final String header;
  final String body;
  ProfileDetail({this.body, this.header});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: kAppCourseBoxInactive,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          body,
          style: kAppHeaderText.copyWith(fontSize: 10),
        ),
      ],
    );
  }
}

class BadgeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: kBadgeColor,
        border: Border.all(
          color: kProgressBar,
          width: 0.1,
        ),
        borderRadius: kAppBorderRadiusMini,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Icon(
              Icons.security,
              size: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Text(
              '0',
              style: kAppCourseBoxInactive,
            ),
          )
        ],
      ),
    );
  }
}

class StreakBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: kBorderUnFocused,
          width: 0.1,
        ),
        borderRadius: kAppBorderRadiusSemi,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.security,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nice Streak',
                  style: kAppHeaderText.copyWith(fontSize: 12),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Text(
                  'Answer 10 questions correctly in a row within any Level to score this badge!',
                  style: kAppCourseBoxInactive,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EditMainProfileForm extends StatelessWidget {
  final Function onEmailChange;
  final Function onPasswordChange;
  EditMainProfileForm({this.onEmailChange, this.onPasswordChange});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
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
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: TextFormField(
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
            ),
          ],
        ),
      ],
    );
  }
}
