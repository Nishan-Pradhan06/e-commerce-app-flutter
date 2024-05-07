import 'package:e_commercee/database/collection.dart';
import 'package:e_commercee/model/productModel.dart';
import 'package:get/get.dart';

class AdminProductController extends GetxController {
  bool isLoading = false;

  final List<ProductModel> _products = [];

  List<ProductModel> get productList => [..._products];

  //length of fetched product
  int get productLength => _products.length;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  getProducts() async {
    isLoading = true;
    update();

    final querySnapshot = await productsCollection.get();
    final docs = querySnapshot.docs;

    for (var doc in docs) {
      final product = ProductModel.fromJson(doc.data(), doc.id);
      _products.add(product);
    }
    isLoading = false;
    update();
  }
}
