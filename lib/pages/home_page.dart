import 'package:flutter/material.dart';

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
              OutlinedButton(onPressed: () {}, child: Text("Logout"))
            ],
          ),
        ));
  }
}
