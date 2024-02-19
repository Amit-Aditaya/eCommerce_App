import 'package:http/http.dart';
import 'package:tr_app/data/model/product/product_model.dart';

class ProductRepository {
  Future<List<ProductModel>> getProductLst() async {
    final response = await get(Uri.parse('https://jsonplaceholder.org/posts'));

    if (response.statusCode == 200) {
      final productList = productModelFromJson(response.body);
      return productList;
    } else {
      throw Exception('Error Fetching Product');
    }
  }
}
