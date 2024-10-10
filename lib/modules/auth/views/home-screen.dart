import 'package:flutter/material.dart';
import 'package:swd_app/common/widgets/buttons/app-button.dart';
import 'package:swd_app/common/widgets/common/gradient-text.dart';
import 'package:swd_app/common/widgets/common/height-spacer.dart';
import 'package:swd_app/common/widgets/inputs/text-input.dart';
import 'package:swd_app/modules/auth/views/bottom-nav.dart';
import 'package:swd_app/modules/auth/views/signup.dart';
import 'package:swd_app/modules/auth/views/widget/news-cover-item.dart';
import 'package:swd_app/theme/text-styles.dart';
import 'package:the_validator/the_validator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List coverImages = [
    "assets/images/news1.png",
    "assets/images/news1.png",
    "assets/images/news1.png",
    "assets/images/news1.png",
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isBalanceHidden = true;
  double balanceAmount = 50000;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          color: Color(0xFF141414),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: screenHeight * 0.4,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const HeightSpacer(0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: screenHeight * 0.06,
                                width: screenWidth * 0.10,
                                child: Image.asset("assets/images/user.png")),
                            Container(
                                height: screenHeight * 0.08,
                                width: screenWidth * 0.3,
                                child: Image.asset(
                                  "assets/images/welcomeSam.png",
                                  fit: BoxFit.contain,
                                )),
                            Container(
                                height: screenHeight * 0.06,
                                width: screenWidth * 0.10,
                                child: Image.asset(
                                    "assets/images/notification.png")),
                          ],
                        ),
                        Container(
                          height: screenHeight * 0.15,
                          width: screenWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: [
                                  Color(0xFFEFA058),
                                  Color(0xFFEF5858),
                                ],
                                stops: [0.0, 0.4717],
                              )),
                          child: Row(
                            children: [
                              Container(
                                width: screenWidth * 0.45,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "WALLET BALANCE",
                                            style: headerText2Style.copyWith(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      HeightSpacer(0.01),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _isBalanceHidden
                                                ? '******'
                                                : '\$NGN 50,000',
                                            style: headerText2Style.copyWith(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _isBalanceHidden =
                                                    !_isBalanceHidden;
                                              });
                                            },
                                            child: Icon(
                                              _isBalanceHidden
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      HeightSpacer(0.01),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.white54,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Cashback",
                                              style: headerText2Style.copyWith(
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                            GradientText(
                                              text: "NGN341.20",
                                              style: headerText3Style.copyWith(
                                                  fontSize: 11),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: screenWidth * 0.4,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 10),
                                  height: screenHeight * 0.13,
                                  width: screenWidth * 0.38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    color: Colors.white54,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "MONIEPOINT",
                                            style: headerText2Style.copyWith(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      HeightSpacer(0.01),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "8012345672",
                                            style: headerText2Style.copyWith(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.copy,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Deposit fee: N20",
                                            style: headerText2Style.copyWith(
                                                fontSize: 11,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const HeightSpacer(0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildImageTextContainer('assets/images/topUp.png',
                                'Top up', screenHeight, screenWidth),
                            buildImageTextContainer(
                                'assets/images/transfer.png',
                                'Transfer',
                                screenHeight,
                                screenWidth),
                            buildImageTextContainer('assets/images/history.png',
                                'History', screenHeight, screenWidth),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                HeightSpacer(0.02),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Quick Actions",
                              style: headerText2Style.copyWith(
                                  fontSize: 16, color: Color(0xFFB9B9B9)),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildImageTextContainer2('assets/images/data.png',
                              'Data', screenHeight, screenWidth),
                          buildImageTextContainer2('assets/images/airtime.png',
                              'Airtime', screenHeight, screenWidth),
                          buildImageTextContainer2('assets/images/showmas.png',
                              'Showmax', screenHeight, screenWidth),
                          buildImageTextContainer2(
                              'assets/images/giftscard.png',
                              'Giftcards',
                              screenHeight,
                              screenWidth),
                        ],
                      ),
                      HeightSpacer(0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildImageTextContainer2('assets/images/betting.png',
                              'Betting', screenHeight, screenWidth),
                          buildImageTextContainer2(
                              'assets/images/electricity.png',
                              'Electricity',
                              screenHeight,
                              screenWidth),
                          buildImageTextContainer2('assets/images/tvcable.png',
                              'Tv/Cable', screenHeight, screenWidth),
                          buildImageTextContainer2('assets/images/epin.png',
                              'E-pin', screenHeight, screenWidth),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "News & Update",
                              style: headerText2Style.copyWith(
                                  fontSize: 16, color: Color(0xFFB9B9B9)),
                            ),
                            Text(
                              "view all",
                              style: headerText2Style.copyWith(
                                  fontSize: 16, color: Color(0xFFEF5858)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: screenHeight * 0.25,
                        width: screenWidth,
                        child: Row(
                          children: [
                            Container(
                              width: screenWidth * 0.9,
                              child: CarouselSlider.builder(
                                itemCount: coverImages.length,
                                options: CarouselOptions(
                                  aspectRatio: 0.9,
                                  enlargeCenterPage: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enableInfiniteScroll: true,
                                  viewportFraction: 0.9,
                                  pageSnapping: true,
                                ),
                                itemBuilder: (context, index, realIndex) {
                                  final coverImage = coverImages[index];
                                  return InkWell(
                                    onTap: () {},
                                    child:
                                        NewsCoverItem(coverImage: coverImage),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const HeightSpacer(0.02)
              ],
            ),
          )),
    );
  }

  Widget buildImageTextContainer(
      String imagePath, String text, double height, double width) {
    return Container(
      width: width * 0.2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            height: height * 0.03,
            width: width * 0.1,
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: headerText3Style.copyWith(
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildImageTextContainer2(
      String imagePath, String text, double height, double width) {
    return Container(
      width: width * 0.2,
      height: height * 0.1,
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeightSpacer(0.01),
          Image.asset(
            imagePath,
            height: height * 0.03,
            width: width * 0.1,
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style:
                headerText3Style.copyWith(fontSize: 13, color: Colors.white54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
