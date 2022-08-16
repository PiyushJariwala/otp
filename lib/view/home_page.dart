import 'package:flutter/material.dart';
import 'package:otp/utils/fier_auth_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController phonenumber = TextEditingController();
  final finalkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: finalkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login with Phone Number",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: phonenumber,
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return "Please enter valid number";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Phone Number",
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            OutlinedButton(
              onPressed: () {
                if(finalkey.currentState!.validate()){
                  FireHelper().verifiedPhone("+91"+"${phonenumber.text.trim()}", context);
                }
              },
              child: Text(
                "Login",
              ),
            ),
          ],
        ),
      ),
    );
  }

}
