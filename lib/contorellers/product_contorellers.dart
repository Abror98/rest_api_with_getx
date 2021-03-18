
import 'package:get/get.dart';
import 'package:rest_api_with_getx/service/networkservice.dart';


class ProductContoreller extends GetxController{
  var productList = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
     isLoading(true);
     try {
       var products = await NetworkService.fetchProductList();
       if (products != null) {
         productList.value = products;
       }
     }finally {
       isLoading(false);
     }
  }
}