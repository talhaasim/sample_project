import 'package:exchange_rate_app/res/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ToastUtils {

  static showToast(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: blackColor, gravity: ToastGravity.BOTTOM,);
  }

  static showSnackbar(String title, String message) {
    Get.snackbar(title, message);
  }
}