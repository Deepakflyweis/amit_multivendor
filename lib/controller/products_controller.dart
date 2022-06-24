
import 'package:get/get.dart';
import 'package:sugandh/config/repository/products_repo.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/models/products_model.dart';

class ProductsController extends GetxController with StateMixin<ProductsModel>{

  getAllProducts(){
    try {
      Client _client = Client();
      ProductsRepository prodRepo =
        ProductsRepository(client: _client.init());
      prodRepo.getAllProductsApi().then((value) {        
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
    getAllProducts();
    super.onInit();
   
  }
}