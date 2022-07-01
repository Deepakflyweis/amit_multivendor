import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sugandh/config/repository/profile_repository.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/models/user_profile_model.dart';

class ProfileController extends GetxController
    with StateMixin<UserProfileModel> {
  GlobalKey<FormState> profileFormkey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();

  Rx<File> image = File("").obs;

  Rx<String?> imageUrl = (null as String?).obs;

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: Text('Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromCamera() async {
    ImagePicker _picker = ImagePicker();
    XFile? tempImage = await _picker.pickImage(
        source: ImageSource.camera,
        //  imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    if (tempImage != null) {
      image.value = File(tempImage.path);
    }
  }

  _imgFromGallery() async {
    ImagePicker _picker = ImagePicker();
    XFile? tempImage = await _picker.pickImage(
      source: ImageSource.gallery,
      //imageQuality: 50
    );
    if (tempImage != null) {
      image.value = File(tempImage.path);
    }
  }

  callEditProfile() {
    if (profileFormkey.currentState!.validate()) {
      try {
        Client client = Client();
        ProfileRepository repository = ProfileRepository(client: client.init());
        repository.editProfileApi( fullName.text,image.value, email.text);
      } on Exception catch (e) {
        log(" exception $e");
      }
    }
  }

  getProfile() {
    Client client = Client();
    ProfileRepository repository = ProfileRepository(client: client.init());

    try {
      repository.getProfileApi().then((value) {
        change(value, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err));
      });
    } on Exception catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
