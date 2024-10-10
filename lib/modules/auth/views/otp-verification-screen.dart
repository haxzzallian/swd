// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:swd_app/modules/auth/views/signin.dart';
import 'package:the_validator/the_validator.dart';

import 'package:swd_app/common/widgets/buttons/app-button.dart';
import 'package:swd_app/common/widgets/common/gradient-text.dart';
import 'package:swd_app/common/widgets/common/height-spacer.dart';
import 'package:swd_app/common/widgets/common/width-spacer.dart';
import 'package:swd_app/common/widgets/inputs/text-input.dart';
import 'package:swd_app/theme/text-styles.dart';

class OtpVerificationScreen extends StatefulWidget {
  String? email;
  OtpVerificationScreen({
    Key? key,
    this.email,
  }) : super(key: key);
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otp1Controller = TextEditingController();
  final TextEditingController _otp2Controller = TextEditingController();
  final TextEditingController _otp3Controller = TextEditingController();
  final TextEditingController _otp4Controller = TextEditingController();
  final TextEditingController _otp5Controller = TextEditingController();
  final TextEditingController _otp6Controller = TextEditingController();

  // FocusNodes for each OTP box
  final FocusNode _otp1Focus = FocusNode();
  final FocusNode _otp2Focus = FocusNode();
  final FocusNode _otp3Focus = FocusNode();
  final FocusNode _otp4Focus = FocusNode();
  final FocusNode _otp5Focus = FocusNode();
  final FocusNode _otp6Focus = FocusNode();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _otp1Controller.dispose();
    _otp2Controller.dispose();
    _otp3Controller.dispose();
    _otp4Controller.dispose();
    _otp5Controller.dispose();
    _otp6Controller.dispose();

    _otp1Focus.dispose();
    _otp2Focus.dispose();
    _otp3Focus.dispose();
    _otp4Focus.dispose();
    _otp5Focus.dispose();
    _otp6Focus.dispose();

    super.dispose();
  }

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
                          Row(
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
                        ],
                      ),
                      const HeightSpacer(0.06),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Verify your email",
                            style: headerText2Style.copyWith(
                                fontSize: 25, color: Color(0xFFB9B9B9)),
                          ),
                        ],
                      ),
                      const HeightSpacer(0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Please enter the otp sent to",
                            style: headerText2Style.copyWith(
                                fontSize: 14, color: Color(0xFFB9B9B9)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.email}",
                            style: headerText2Style.copyWith(
                                fontSize: 14, color: Color(0xFFFFFFFF)),
                          ),
                        ],
                      ),
                      HeightSpacer(0.02),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // First 3 OTP boxes
                            _otpBox(_otp1Controller, _otp1Focus, _otp2Focus,
                                screenHeight * 0.08, screenWidth * 0.12),
                            const SizedBox(width: 8), // Spacing between boxes
                            _otpBox(_otp2Controller, _otp2Focus, _otp3Focus,
                                screenHeight * 0.08, screenWidth * 0.12),
                            const SizedBox(width: 8),
                            _otpBox(_otp3Controller, _otp3Focus, _otp4Focus,
                                screenHeight * 0.08, screenWidth * 0.12),

                            // Minus sign separator
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                '-',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30, // Adjust as per design
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            // Last 3 OTP boxes
                            _otpBox(_otp4Controller, _otp4Focus, _otp5Focus,
                                screenHeight * 0.08, screenWidth * 0.12),
                            const SizedBox(width: 8),
                            _otpBox(_otp5Controller, _otp5Focus, _otp6Focus,
                                screenHeight * 0.08, screenWidth * 0.12),
                            const SizedBox(width: 8),
                            _otpBox(_otp6Controller, _otp6Focus, null,
                                screenHeight * 0.08, screenWidth * 0.12),
                          ],
                        ),
                      ),
                      const HeightSpacer(0.4),
                      Container(
                        height: screenHeight * 0.07,
                        child: AppButton(
                            enabled: true,
                            text: 'Verify email',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
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
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                        ],
                      ),
                      const HeightSpacer(0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Email verification",
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

  Widget _otpBox(TextEditingController controller, FocusNode currentFocus,
      FocusNode? nextFocus, double height, double width) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          focusNode: currentFocus,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
          ),
          onChanged: (value) {
            if (value.length == 1 && nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else if (value.isEmpty && currentFocus != null) {
              currentFocus.unfocus();
            }
          },
        ),
      ),
    );
  }
}
