import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sugandh/config/repository/address_repo.dart';
import 'package:sugandh/config/server/app_server.dart';

class CheckoutAddressController extends GetxController {
  GlobalKey<FormState> checkAddressform = GlobalKey();

  TextEditingController street = TextEditingController();
  TextEditingController locality = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();

  checkoutAddressApi() {
    var isValidate = checkAddressform.currentState!.validate();
    if (!isValidate) {
      return;
    }
    Client _client = Client();
    CheckoutAddressRepo addressRepo =
        CheckoutAddressRepo(client: _client.init());    
    addressRepo.cartAddressSend(
        street.text, locality.text, pincode.text, city.text, state.text);
     
  }
}
