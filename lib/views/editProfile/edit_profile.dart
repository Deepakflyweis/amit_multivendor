import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:sugandh/controller/profile_controller.dart';
import 'package:sugandh/widgets/constant.dart';

import '../../widgets/welcomeButton_widget.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  ProfileController controller = Get.put(ProfileController());

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.profileFormkey,
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 10.h,
                  child: ClipOval(
                    child: Obx(() => 
                    controller.image.value.path == ""
                        ?  Icon(Icons.image,size: 50,)
                        
                        // Image.network(
                        //      controller.im.value ?? "",
                        //      height: 40,
                        //     errorBuilder: (context, _, __) => const Icon(
                        //       Icons.account_circle_outlined,
                        //       color: Colors.grey,
                        //     ),
                        //   )
                        : Image.file(
                            controller.image.value,
                            // height: 25.h,
                            width: 25.w,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                   ), ), 
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextButton(
                onPressed: () => controller.showPicker(context),
                child: Text(
                  "Change Profile ",
                  style: TextStyle(color: appthemColor, fontSize: 12.sp),
                ),
              ),
              TextFormField(
                controller: controller.fullName,
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
              ),
              // SizedBox(
              //   height: 3.h,
              // ),
              // TextFormField(
              //   controller: controller.mobile,
              //   decoration: const InputDecoration(
              //     hintText: "Mobile no",
              //   ),
              // ),
              SizedBox(
                height: 10.h,
              ),
              WelcomeButtonWidget(
                ontap: () => controller.callEditProfile(),
                btnText: "UPDATE",
              )
            ],
          ),
        ),
      ),
    );
  }
}
