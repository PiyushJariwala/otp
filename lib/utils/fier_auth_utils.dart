import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireHelper {
  FirebaseAuth auth = FirebaseAuth.instance;

  void verifiedPhone(String phoneNumber, BuildContext context) {
    auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        final result = await auth.signInWithCredential(credential);
        final user = result.user;

        if (user != null) {
          Navigator.pushReplacementNamed(context, 'sucsses');
        } else {
          print("error");
        }
      },
      verificationFailed: (FirebaseAuthException exception) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${exception.message}"),backgroundColor: Colors.red,));
      },
      codeSent: (String verificationId, [int? forceResendingToken]) {
        final dilogekey = GlobalKey<FormState>();
        TextEditingController otp = TextEditingController();

        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Enter your OTP"),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: dilogekey,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                  child: TextFormField(
                    controller: otp,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return "Please Enter OTP";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "OTP",
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
            ),
            actions: [
              OutlinedButton(
                onPressed: () async {
                  final smsotp = otp.text.trim();
                  AuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: verificationId, smsCode: smsotp);
                  final result = await auth.signInWithCredential(credential);
                  final user = result.user;
                  Navigator.pop(context);
                  if (user != null) {
                    Navigator.pushReplacementNamed(context, 'sucsses');
                  } else {
                    print("Error");
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        null;
      },
    );
  }
}
