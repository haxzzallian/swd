import 'package:flutter/material.dart';
import 'package:swd_app/common/widgets/buttons/app-button.dart';
import 'package:swd_app/common/widgets/common/gradient-text.dart';
import 'package:swd_app/common/widgets/common/height-spacer.dart';
import 'package:swd_app/common/widgets/common/width-spacer.dart';
import 'package:swd_app/common/widgets/inputs/text-input.dart';
import 'package:swd_app/modules/auth/views/otp-verification-screen.dart';
import 'package:swd_app/modules/auth/views/signin.dart';
import 'package:swd_app/theme/text-styles.dart';
import 'package:the_validator/the_validator.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final firstNameFocus = FocusNode();
  final lastNameFocus = FocusNode();
  final phoneNumberFocus = FocusNode();
  final referralFocus = FocusNode();
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
                top: screenHeight * 0.05,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: Color(0xFFB9B9B9),
                                  size: 20,
                                ),
                                Text(
                                  " Back",
                                  style: headerText2Style.copyWith(
                                      fontSize: 16, color: Color(0xFFB9B9B9)),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: GradientText(
                              text: "Sign in instead",
                              style: headerText3Style.copyWith(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      const HeightSpacer(0.02),
                      Text(
                        "Create an account",
                        style: headerText2Style.copyWith(
                            fontSize: 25, color: Color(0xFFB9B9B9)),
                      ),
                      const HeightSpacer(0.02),
                      Row(
                        children: [
                          Container(
                            width: screenWidth *
                                0.42, // Adjust the width as needed
                            child: AppTextInput(
                              controller: _firstNameController,
                              validate: FieldValidator.minLength(3),
                              focusNode: firstNameFocus,
                              label: "First name",
                              hint: "First name",
                            ),
                          ),
                          const WidthSpacer(0.05),
                          Container(
                            width: screenWidth *
                                0.42, // Adjust the width as needed
                            child: AppTextInput(
                              controller: _lastNameController,
                              validate: FieldValidator.minLength(3),
                              focusNode: lastNameFocus,
                              label: "Last name",
                              hint: "Last name",
                            ),
                          ),
                        ],
                      ),
                      const HeightSpacer(0.01),
                      AppTextInput(
                        controller: _phoneNumberController,
                        validate: FieldValidator.number(),
                        focusNode: phoneNumberFocus,
                        label: "Phone number",
                        hint: "Enter phone number",
                      ),
                      const HeightSpacer(0.01),
                      AppTextInput(
                        textInputType: TextInputType.emailAddress,
                        controller: _emailController,
                        validate: FieldValidator.email(),
                        focusNode: emailFocus,
                        label: "Email address",
                        hint: "Enter Email address",
                      ),
                      const HeightSpacer(0.01),
                      AppTextInput(
                        label: 'Create Password',
                        hint: "Enter password",
                        controller: _passwordController,
                        validate: FieldValidator.password(),
                        focusNode: passwordFocus,
                        isPassword: true,
                      ),
                      const HeightSpacer(0.01),
                      AppTextInput(
                        controller: _referralCodeController,
                        validate: FieldValidator.minLength(1),
                        focusNode: referralFocus,
                        label: "Referral Code (Optional)",
                        hint: "Enter Referral Code",
                      ),
                      const HeightSpacer(0.03),
                      Container(
                        height: screenHeight * 0.07,
                        child: AppButton(
                            enabled: true,
                            text: 'Next',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OtpVerificationScreen(
                                              email: _emailController.text,
                                            )));
                              }
                            }),
                      ),
                      const HeightSpacer(0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: screenHeight * 0.005,
                            width: screenWidth * 0.45,
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                          Container(
                            height: screenHeight * 0.005,
                            width: screenWidth * 0.45,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 87, 80, 80)),
                          ),
                        ],
                      ),
                      const HeightSpacer(0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Account information",
                            style: headerText2Style.copyWith(
                                fontSize: 14, color: Color(0xFFB9B9B9)),
                          ),
                        ],
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
