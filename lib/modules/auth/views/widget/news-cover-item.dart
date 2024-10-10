import 'package:flutter/material.dart';
import 'package:swd_app/common/widgets/common/height-spacer.dart';

class NewsCoverItem extends StatefulWidget {
  String? coverImage;

  NewsCoverItem({Key? key, this.coverImage}) : super(key: key);

  @override
  State<NewsCoverItem> createState() => _NewsCoverItemState();
}

class _NewsCoverItemState extends State<NewsCoverItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;
    return Container(
      height: screenHeight * 0.23,
      width: screenWidth * 0.82,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HeightSpacer(0.01),
          Container(
            height: screenHeight * 0.23,
            width: screenWidth * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.coverImage ?? "",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
