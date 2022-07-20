import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:sugandh/widgets/constant.dart';

class NoticeFication extends StatelessWidget {
  const NoticeFication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Notification",
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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(
                      radius: (20),
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "lib/assets/asset/Mask.png",
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                SizedBox(
                  width: 2.h,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.79,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Loreum ipsum dolor ",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          const Text("8:35 pm")
                        ],
                      ),
                      Expanded(
                        child: const Text(
                            "Loreum ipsum dolor sit amet, consuter\nsadipcing eliter sed dam nonumy eirmod",
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Divider(
              height: 2,
              color: Colors.black,
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(
                      radius: (20),
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "lib/assets/asset/Mask.png",
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                SizedBox(
                  width: 2.h,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Loreum ipsum dolor sit amit",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                         Spacer(),
                          const Text("8:35 pm")
                        ],
                      ),
                      const Text(
                          "Loreum ipsum dolor sit amet, consuter\nsadipcing eliter sed dam nonumy eirmod"),
                    ],
                  ),
                )
              ],
            ),
            const Divider(
              height: 2,
              color: Colors.black,
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(
                      radius: (20),
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "lib/assets/asset/Mask.png",
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                SizedBox(
                  width: 2.h,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Loreum ipsum dolor sit amit",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                           Spacer(),
                          const Text("8:35 pm")
                        ],
                      ),
                      const Text(
                          "Loreum ipsum dolor sit amet, consuter\nsadipcing eliter sed dam nonumy eirmod"),
                    ],
                  ),
                )
              ],
            ),
            const Divider(
              height: 2,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
