import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kangmas_app/main.dart';
import 'package:kangmas_app/screens/otp_verification_screen.dart';
import 'package:kangmas_app/screens/sign_in_screen.dart';
import 'package:kangmas_app/utils/constant.dart';
import 'package:kangmas_app/utils/widgets.dart';

import '../custom_widget/space.dart';
import '../utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpFormKey = GlobalKey<FormState>();

  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  bool agreeWithTeams = false;
  bool _securePassword = true;
  bool _secureConfirmPassword = true;

  double screenHeight = 0.0;
  double screenWidth = 0.0;

  bool? checkBoxValue = false;

  @override
  void dispose() {
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pemberitahuan'),
          content: SingleChildScrollView(
            child: ListBody(children: [Text('Mohon setujui ketentuan dan syarat yang berlaku')]),
          ),
          actions: [
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Space(42),
              Center(
                child: Text(
                  "Daftar Akun",
                  style: TextStyle(fontSize: mainTitleTextSize, fontWeight: FontWeight.bold),
                ),
              ),
              Space(60),
              Form(
                key: _signUpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(fontSize: 16),
                      decoration: commonInputDecoration(hintText: "Username"),
                    ),
                    Space(16),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(fontSize: 20),
                      decoration: commonInputDecoration(hintText: "Email"),
                    ),
                    Space(16),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      style: TextStyle(fontSize: 20),
                      decoration: commonInputDecoration(hintText: "Nomor Telepon"),
                    ),
                    Space(16),
                    TextFormField(
                      controller: _passController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _securePassword,
                      style: TextStyle(fontSize: 20),
                      decoration: commonInputDecoration(
                        hintText: "Password",
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: IconButton(
                            icon: Icon(_securePassword ? Icons.visibility_off : Icons.visibility, size: 18),
                            onPressed: () {
                              _securePassword = !_securePassword;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                    Space(16),
                    TextFormField(
                      controller: _confirmPassController,
                      textInputAction: TextInputAction.done,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: _secureConfirmPassword,
                      style: TextStyle(fontSize: 20),
                      decoration: commonInputDecoration(
                        hintText: "Masukkan Ulang Password",
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: IconButton(
                            icon: Icon(_secureConfirmPassword ? Icons.visibility_off : Icons.visibility, size: 18),
                            onPressed: () {
                              _secureConfirmPassword = !_secureConfirmPassword;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                    Space(16),
                    Theme(
                      data: ThemeData(unselectedWidgetColor: appData.isDark ? Colors.white : blackColor),
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        activeColor: Colors.black,
                        title: Text("Saya setuju pada ketentuan dan syarat ini", style: TextStyle(fontWeight: FontWeight.normal)),
                        value: checkBoxValue,
                        dense: true,
                        onChanged: (newValue) {
                          setState(() {
                            checkBoxValue = newValue;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Space(16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16),
                          textStyle: TextStyle(fontSize: 25),
                          shape: StadiumBorder(),
                          backgroundColor: appData.isDark ? Colors.grey.withOpacity(0.2) : Colors.black,
                        ),
                        onPressed: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            if (agreeWithTeams == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OTPVerificationScreen()),
                              );
                            } else {
                              _showAlertDialog();
                            }
                          }
                        },
                        child: Text("Daftar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                      ),
                    ),
                    Space(20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Punya akun?", style: TextStyle(fontSize: 16)),
                          Space(4),
                          Text('Masuk disini', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
