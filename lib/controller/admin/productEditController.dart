import 'package:e_commercee/database/collection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../model/productModel.dart';

class AdminProductEditController extends GetxController {
  final ProductModel productModel;
  final int editIndex;
  AdminProductEditController(
      {required this.productModel, required this.editIndex});
  late final TextEditingController _priceController;
  late final TextEditingController _discountController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _stockController;
  late final TextEditingController _brandNameController;
  late final TextEditingController _productNameController;

  bool isUpdating = false;

  @override
  void onInit() {
    _priceController =
        TextEditingController(text: productModel.price.toString());
    _discountController =
        TextEditingController(text: productModel.discount.toString());
    _descriptionController =
        TextEditingController(text: productModel.description);
    _stockController =
        TextEditingController(text: productModel.stock.toString());
    _brandNameController = TextEditingController(text: productModel.brandName);
    _productNameController =
        TextEditingController(text: productModel.productName);

    super.onInit();
  }

  @override
  void onClose() {
    _discountController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _stockController.dispose();
    _brandNameController.dispose();
    _productNameController.dispose();
    super.onClose();
  }

  void onSubmitted() async {
    if (isUpdating) return;
    isUpdating = true;
    update();

    try {
      final updateProduct = productModel.copyWith(
        brandName: _brandNameController.text,
        description: _descriptionController.text,
        discount: double.parse(_discountController.text),
        price: double.parse(_priceController.text),
        productName: _productNameController.text,
        stock: int.parse(_stockController.text),
      );
      await productsCollection
          .doc(productModel.documentsId)
          .set(updateProduct.toJson());
      Get.back();
      Fluttertoast.showToast(msg: 'Product Edit Sucessfully!');
    } catch (e) {
      print('Error : $e');
      Fluttertoast.showToast(msg: 'Something went wrong!');
    } finally {
      isUpdating = false;
      update();
    }
  }
}
