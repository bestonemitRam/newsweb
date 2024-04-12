import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppHelper {
  static String? trainerId;
  static String? fromLanguageCode;
  static String? toLanguageCode;
  static String? isLogin;
  static String? AUTH_TOKEN_VALUE;
  static String? email_VALUE;
  static String? language;
  static String? role;
  static String? image;
  static String dataStorage = "dataStorage";

  static String? firstName;
  static String? lastName;
  //static String? emailAddress;
  static String? phoneNumber;
  static String? userAvatar;
  static bool themelight = true;
  static String? comment;
  static String? commentId;
  static String? logOutButton;
  static String? weight;
  static String? biceps;
  static String? butt;
  static String? waist;
  static String? leg;
  static String? averagenumbersteps;

  Future<void> dialogBuilder(
      BuildContext context, String title, String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
