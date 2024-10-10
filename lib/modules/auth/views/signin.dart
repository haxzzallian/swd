import 'package:flutter/material.dart';
import 'package:swd_app/common/widgets/buttons/app-button.dart';
import 'package:swd_app/common/widgets/common/gradient-text.dart';
import 'package:swd_app/common/widgets/common/height-spacer.dart';
import 'package:swd_app/common/widgets/inputs/text-input.dart';
import 'package:swd_app/modules/auth/views/bottom-nav.dart';
import 'package:swd_app/modules/auth/views/signup.dart';
import 'package:swd_app/theme/text-styles.dart';
import 'package:the_validator/the_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          color: Color(0xFF141414),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset("assets/images/gradient.png"),
              ),
              Positioned(
                top: screenHeight * 0.15,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth * 0.3,
                        height: screenHeight * 0.15,
                        decoration: BoxDecoration(
                          color: Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const HeightSpacer(0.02),
                      Container(
                          width: screenWidth * 0.6,
                          height: screenHeight * 0.04,
                          child: Image.asset("assets/images/welcomeBack.png")),
                      const HeightSpacer(0.07),
                      AppTextInput(
                        textInputType: TextInputType.emailAddress,
                        controller: _emailController,
                        validate: FieldValidator.email(),
                        focusNode: emailFocus,
                        label: "Email address",
                        hint: "Enter Email address",
                      ),
                      const HeightSpacer(0.02),
                      AppTextInput(
                        label: 'Password',
                        hint: "Enter password",
                        controller: _passwordController,
                        validate: FieldValidator.password(),
                        focusNode: passwordFocus,
                        isPassword: true,
                      ),
                      const HeightSpacer(0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: headerText2Style.copyWith(
                                fontSize: 14, color: Color(0xFFB9B9B9)),
                          ),
                        ],
                      ),
                      const HeightSpacer(0.03),
                      Container(
                        height: screenHeight * 0.07,
                        child: AppButton(
                            enabled: true,
                            text: 'Sign in',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BottomNavBar()));
                              }
                            }),
                      ),
                      const HeightSpacer(0.03),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "I don't have an account? ",
                              style: headerText3Style.copyWith(
                                  color: Color(0xFFB9B9B9), fontSize: 14),
                            ),
                            GradientText(
                              text: "Create account",
                              style: headerText3Style.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
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
