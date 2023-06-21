import 'package:http/http.dart' as http;
import 'package:productsapi/models/product_model.dart';

class ApiService {
  static var client = http.Client();

  static Future<List<ElfProducts>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=e.l.f.'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return elfProductsFromJson(jsonString);
    } else {
      return null;
    }
  }
}
