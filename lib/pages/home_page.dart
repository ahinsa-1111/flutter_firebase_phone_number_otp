import 'package:flutter/material.dart';
import 'package:flutter_firebase_phone_number_otp/controllers/auth_service.dart';
import 'package:flutter_firebase_phone_number_otp/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Homepage"),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Great you are now logged in"),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  onPressed: () {
                    AuthService.logout();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text("Logout"))
            ],
          ),
        ));
  }
}
