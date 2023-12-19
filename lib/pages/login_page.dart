import 'package:flutter/material.dart';
import 'package:flutter_firebase_phone_number_otp/controllers/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formkey1 = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Image.asset(
                "images/login.png",
                fit: BoxFit.cover,
              )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi Welcome Back !!!",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Text("    Enter Your Phone Number To Continue"),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixText: "+94",
                    labelText: "Enter Your Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length != 10) return "Invalid Phone Number";
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AuthService.sentOtp(
                          phone: _phoneController.text,
                          errorStep: () => ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  "Erorr in sending OTP",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.red,
                              )),
                          nextStep: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("OTP Verification"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Enter 6 digit OTP"),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Form(
                                      key: _formkey1,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: _otpController,
                                        decoration: InputDecoration(
                                          labelText: "",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(32),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.length != 6)
                                            return "Invalid OTP";
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        if (_formkey1.currentState!
                                            .validate()) {
                                          AuthService.loginWithOtp(
                                              otp: _otpController.text);
                                        }
                                      },
                                      child: Text("Submit"))
                                ],
                              ),
                            );
                          });
                    }
                  },
                  child: Text("Send OTP"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
