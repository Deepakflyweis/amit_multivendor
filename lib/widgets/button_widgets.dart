import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      width: 40.w,
      child: const Center(
        child: Text(
          'Continue',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
