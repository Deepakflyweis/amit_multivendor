import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:sugandh/widgets/app_widgets.dart';
import 'package:sugandh/widgets/constant.dart';

class WelcomeButtonWidget extends StatelessWidget {
  String? btnText;
  Callback? ontap;

  WelcomeButtonWidget({Key? key, this.btnText, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.80,
        decoration: BoxDecoration(
            color: appthemColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            "$btnText",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
          color: appthemColor, borderRadius: BorderRadius.circular(20)),
      child: Center(child: buildLoadingIndicator()),
    );
  }
}
