import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sugandh/config/local/env.dart';
import 'package:sugandh/config/repository/checkout_repo.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/core/utils/common_loader.dart';
import 'package:sugandh/views/buttom_nav_bar/dash_bord.dart';
import 'package:sugandh/views/cart_screen/cart_page.dart';

class PaymentGatewayController extends GetxController {
  late Razorpay _razorpay;

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    Client client = Client();
    CheckOutEndPointProvider provider =
        CheckOutEndPointProvider(client: client.init());
    try {
      provider.checkOutApi().then((value) {
        callRazorPay(
            double.parse(value["amount"].toString()), value["orderId"]);
      }, onError: (err) {
        CommonLoader.showErrorDialog();
      });
    } on Exception catch (e) {
      CommonLoader.showErrorDialog();
    }
  }

  void callRazorPay(double total, String orderId) async {
    var options = {
      'key': razorPayKey,
      'amount': total,
      'orderId': orderId,
      'name': 'MultiVendor',
      'description': 'Payment For Product',
      /* 'external': {
        'wallets': ['paytm']
      } */
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.offAll(() => MyDashBoard());
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!, timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.to(() => CartPage());
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!, timeInSecForIosWeb: 4);
  }
}
