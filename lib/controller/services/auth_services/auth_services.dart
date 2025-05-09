import 'dart:developer';

import 'package:taush/controller/provier/auth_provider/auth_provider.dart';
import 'package:taush/view/auth_screen/otp_screen.dart';
import 'package:taush/view/auth_screen/signInLogic.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth show FirebaseAuth;
import 'package:firebase_auth/firebase_auth.dart'
    show
        User,
        PhoneAuthCredential,
        PhoneAuthProvider,
        AuthCredential,
        FirebaseAuthException;
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AuthServices {
  static bool checkAuthentication() {
    fb_auth.FirebaseAuth auth = fb_auth.FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  static receiveOTP(
      {required BuildContext context, required String mobileNo}) async {
    fb_auth.FirebaseAuth auth = fb_auth.FirebaseAuth.instance;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: mobileNo,
        verificationCompleted: (PhoneAuthCredential credential) {
          log(credential.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.toString());
        },
        codeSent: (String verificationID, int? resendToken) {
          context
              .read<AuthProvider>()
              .upDateverificationId(verID: verificationID);
          context.read<AuthProvider>().upDatePhoneNum(
                num: mobileNo,
              );
          Navigator.push(
            context,
            PageTransition(
              child: OTPScreen(mobileNumber: mobileNo),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
      );
    } catch (e) {
      log(e.toString());
    }
  }

  static verifyOTP({required BuildContext context, required String otp}) async {
    fb_auth.FirebaseAuth auth = fb_auth.FirebaseAuth.instance;
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: context.read<AuthProvider>().verificationId,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      Navigator.push(
          context,
          PageTransition(
            child: const SignInLogic(),
            type: PageTransitionType.rightToLeft,
          ));
    } catch (e) {
      log(e.toString());
    }
  }
}
