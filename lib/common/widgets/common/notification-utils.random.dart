import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:swd_app/theme/color.dart';

class NotificationUtil {
  static toast(String msg, {bool isError = false}) {
    showSimpleNotification(Text(msg),
        background: isError ? Colors.red : AppColor.bodyTextColor);
  }
}
