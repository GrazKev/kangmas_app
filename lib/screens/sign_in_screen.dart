// import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kangmas_app/screens/dashboard_screen.dart';
import 'package:kangmas_app/screens/otp_verification_screen.dart';
import 'package:kangmas_app/screens/sign_up_screen.dart';
import 'package:kangmas_app/utils/constant.dart';
import 'package:kangmas_app/utils/widgets.dart';

import '../custom_widget/space.dart';
import '../main.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}


class _SignInScreenState extends State<SignInScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  bool _securePassword = true;

  // Country? _selectedCountry;

  @override
  void initState() {
    // initCountry();
    super.initState();
  }

  // void initCountry() async {
  //   final country = await getDefaultCountry(context);
  //   _selectedCountry = country;
  //   setState(() {});
  // }

  bool checkPhoneNumber(String phoneNumber) {
    String regexPattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    var regExp = RegExp(regexPattern);

    if (phoneNumber.isEmpty) {
      return false;
    } else if (regExp.hasMatch(phoneNumber)) {
      return true;
    }
    return false;
  }

  // void _showCountryPicker() async {
  //   final country = await showCountryPickerSheet(context);
  //   if (country != null) {
  //     setState(() {
  //       _selectedCountry = country;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarIconBrightness: appData.isDark ? Brightness.light : Brightness.dark),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Space(60),
                  Text("Selamat Datang di KangMas!", style: TextStyle(fontSize: secondTitleTextSize, fontWeight: FontWeight.bold)),
                  Space(8),
                  Text("Mohon masuk ke akun anda", style: TextStyle(fontSize: 14, color: subTitle)),
                  Space(16),
                  Image.asset(splash_logo, width: 100, height: 100, fit: BoxFit.cover),
                ],
              ),
              Space(70),
              Form(
                key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(fontSize: 16),
                      decoration: commonInputDecoration(hintText: "Email"),
                    ),
                    Space(16),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _securePassword,
                      textInputAction: TextInputAction.next,
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
                  ],
                ),
                // child: TextFormField(
                //   keyboardType: TextInputType.phone,
                //   style: TextStyle(fontSize: 16),
                //   inputFormatters: [LengthLimitingTextInputFormatter(10)],
                //   decoration: commonInputDecoration(
                //     hintText: "Enter mobile number",
                //     prefixIcon: Padding(
                //       padding: EdgeInsets.all(16),
                //       child: GestureDetector(
                //         // onTap: () => _showCountryPicker(),
                //         child: Text(
                //           // _selectedCountry == null ? "+91" : _selectedCountry!.callingCode,
                //           'Kevin',
                //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ),
              Space(16),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    textStyle: TextStyle(fontSize: 16),
                    shape: StadiumBorder(),
                    backgroundColor: appData.isDark ? Colors.grey.withOpacity(0.2) : Colors.black,
                  ),
                  onPressed: () {
                    if (_loginFormKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        // MaterialPageRoute(builder: (context) => OTPVerificationScreen()),
                        MaterialPageRoute(builder: (context) => DashBoardScreen()),
                      );
                    }
                  },
                  child: Text("Masuk", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                ),
              ),
              Space(32),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16.0),
              //   child: Row(
              //     children: [
              //       Expanded(child: Divider(thickness: 1.2, color: Colors.grey.withOpacity(0.2))),
              //       Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              //         child: Text("Or Login With", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              //       ),
              //       Expanded(child: Divider(thickness: 1.2, color: Colors.grey.withOpacity(0.2))),
              //     ],
              //   ),
              // ),
              // Space(32),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset(icGoogle, scale: 24, color: appData.isDark ? blackColor : blackColor),
              //     Space(40),
              //     Image.asset(icInstagram, scale: 24, color: appData.isDark ? blackColor : blackColor),
              //   ],
              // ),
              Space(32),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Tidak punya akun?", style: TextStyle(fontSize: 16)),
                    Space(4),
                    Text('Daftar disini', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
