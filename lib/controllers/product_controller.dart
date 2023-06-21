import 'package:get/get.dart';
import 'package:productsapi/utils/api_service.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = [].obs;
  var isGrid = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
      //print(productList.toList().toList());
    } finally {
      isLoading(false);
    }
  }


}