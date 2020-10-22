import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studymate_app/helper_widgets/custom_dialog.dart';
import 'package:studymate_app/helper_widgets/loading_button.dart';
import 'package:studymate_app/screens/auth/auth_layout_desktop.dart';
import 'package:studymate_app/screens/auth/register_screen.dart';
import 'package:studymate_app/screens/home/home_desktop_landscape.dart';
import 'package:studymate_app/screens/home/home_page.dart';
import 'package:studymate_app/screens/profile_layout.dart';
import 'package:studymate_app/utils/constants.dart';

class ChooseProfileDesktop extends StatefulWidget {
  @override
  _ChooseProfileDesktopState createState() => _ChooseProfileDesktopState();
}

class _ChooseProfileDesktopState extends State<ChooseProfileDesktop> {
  bool _loading = false;
  bool _isVisible = true;
  bool _canEdit = false;
  _createNewProfile(BuildContext context) {
    _popDialogOpen(
      withChild: AuthDialogLayout(
        header: 'Add new profile',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NewProfileForm(
              onEmailChange: () {},
              onPasswordChange: () {},
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: LoadingButton(
                text: 'Create Account',
                style: kAppCourseBoxInactive.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
                isLoading: _loading,
                action: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  _deleteProfile(BuildContext context) {
    Navigator.of(context).pop();
    _popDialogOpen(
      withChild: AuthDialogWrapper(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Delete Profile',
              style: kAppHeaderText.copyWith(color: kAppBlue),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Are you sure you want to \ndelete this profile?',
              textAlign: TextAlign.center,
              style: kAppCourseBoxInactive.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            LoadingButton(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              text: 'Cancel',
              style: kAppCourseBoxInactive.copyWith(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
              isLoading: _loading,
              action: () {},
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Delete Profile',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }

  _editProfile(BuildContext context) {
    _popDialogOpen(
      withChild: AuthDialogLayout(
        header: 'Edit profile',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EditProfileForm(
              onEmailChange: () {},
              onPasswordChange: () {},
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: LoadingButton(
                text: 'Done',
                style: kAppCourseBoxInactive.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
                isLoading: _loading,
                action: () {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => _deleteProfile(context),
              child: Text(
                'Delete Profile',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }

  _popDialogOpen({Widget withChild}) {
    setState(() {
      _isVisible = false;
    });
    showDialog(
      barrierColor: Color(0xFF096AC2).withOpacity(0.47),
      context: context,
      builder: (_) => CustomDialog(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 4,
              vertical: MediaQuery.of(context).size.width / 20),
          child: withChild),
    ).then((_) => {
          setState(() {
            _isVisible = true;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return ProfileLayout(
      topLeft: _isVisible
          ? GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(HomePage.id);
              },
              child: Row(
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                        width: 0.5,
                      ),
                      borderRadius: kAppCircle,
                    ),
                    child: Icon(
                      Icons.clear,
                      size: 8,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Close application',
                    style: kAppCourseBoxInactive.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Who is Learning?',
            style: kAppHeaderText.copyWith(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 30,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileAvatar(
                onTap: () {},
                isEditable: false,
                color: Colors.green,
                child: Column(
                  children: [
                    Text(
                      'Chisom',
                      style: kProfileAvatar,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Host',
                      style: kProfileAvatar.copyWith(
                          fontWeight: FontWeight.w300, fontSize: 7),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ProfileAvatar(
                isEditable: _canEdit,
                onEditTap: () => _editProfile(context),
                onTap: () {},
                color: Colors.deepOrange,
                child: Text(
                  'Joseph',
                  style: kProfileAvatar,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ProfileAvatar(
                isEditable: _canEdit,
                onEditTap: () => _editProfile(context),
                onTap: () {},
                color: Colors.deepPurpleAccent,
                child: Text(
                  'Mercy',
                  style: kProfileAvatar,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ProfileAvatar(
                onTap: () => _createNewProfile(context),
                color: Colors.white,
                icon: Icon(
                  Icons.add,
                  size: 60,
                  color: kProgressBar,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          _canEdit
              ? AppButton(
                  onTap: () {
                    setState(() {
                      _canEdit = false;
                    });
                  },
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  color: Colors.white,
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 10,
                      color: kAppBlueFade,
                    ),
                  ),
                )
              : AppOutlineButton(
                  width: 1,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  onTap: () {
                    setState(() {
                      _canEdit = true;
                    });
                  },
                  child: Text(
                    'Manage Profile',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;
  final Function onEditTap;
  final bool isEditable;
  final Icon icon;

  const ProfileAvatar(
      {this.color,
      this.child,
      this.icon,
      this.onTap,
      this.onEditTap,
      this.isEditable = false});
  @override
  Widget build(BuildContext context) {
    print('can edit now $isEditable');
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: color,
                child: icon ??
                    Icon(
                      Icons.face,
                      size: 40,
                    ),
              ),
              SizedBox(
                height: 15,
              ),
              child ?? Container(),
            ],
          ),
        ),
        if (isEditable)
          EditIcon(
            onTap: onEditTap,
          )
      ],
    );
  }
}

class NewProfileForm extends StatelessWidget {
  final Function onEmailChange;
  final Function onPasswordChange;
  NewProfileForm({this.onEmailChange, this.onPasswordChange});
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
      ],
    );
  }
}

class EditProfileForm extends StatelessWidget {
  final Function onEmailChange;
  final Function onPasswordChange;
  EditProfileForm({this.onEmailChange, this.onPasswordChange});
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
      ],
    );
  }
}

class EditIcon extends StatelessWidget {
  final Function onTap;

  const EditIcon({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 10,
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 8,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.edit,
            color: kAppBlueFade,
            size: 7,
          ),
        ),
      ),
    );
  }
}
