import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp/view/home_page.dart';
import 'package:otp/view/sucssesful_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return SucssesFullPage();
          }
          else if(snapshot.hasError){
            return CircularProgressIndicator();
          }
          return HomePage();
        }),
        'sucssec':(context)=>SucssesFullPage(),
      },
    ),
  );
}
