import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:sugandh/widgets/constant.dart';

import '../../widgets/welcomeButton_widget.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: appthemColor, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 45,
                child: CircleAvatar(
                  backgroundColor: Colors.greenAccent[100],
                  radius: 45,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(
                        'lib/assets/asset/avatar.png'), //NetworkImage
                    radius: 45,
                  ), //CircleAvatar
                ), //CircleAvatar
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Change Profile ",
              style: TextStyle(color: appthemColor, fontSize: 12.sp),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Name",
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Mobile Number",
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            WelcomeButtonWidget(
              btnText: "UPDATE",
            )
          ],
        ),
      ),
    );
  }
}
