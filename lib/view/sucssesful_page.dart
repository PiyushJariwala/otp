import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SucssesFullPage extends StatelessWidget {
  const SucssesFullPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Phone Login Sucssesfull",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
            ),

            SizedBox(
              height: 40,
            ),

            ElevatedButton(onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/');
            }, child: Text("sign out")),
          ],
        ),
      ),
    );
  }
}
