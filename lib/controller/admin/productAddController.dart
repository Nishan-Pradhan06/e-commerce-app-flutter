import 'dart:io';

import 'package:e_commercee/database/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _brandNameController = TextEditingController();

  final addProductGlobalFormKey = GlobalKey<FormState>();

  bool isAddingProduct = false;
  File? _image;

//validating the product name is empty or not
  String? validateIsProductName(String? value) {
    if (value == null || value.isEmpty)
      return "Please enter product name";
    else
      return null;
  }

//validating price should be a number and greater than zero
  String? validatePrice(String? value) {
    if (value == null || value.isEmpty)
      return 'Please enter price.';
    else if (double.tryParse(value) == null)
      return 'Please enter a valid price';
    else
      return null;
  }

//validating discount
  String? validateDiscount(String? value) {
    if (double.tryParse(value!) == null)
      return 'Please enter a valid discount';
    else
      return null;
  }

  //validating description
  String? validateDescription(String? value) {
    if (value == null || value.isEmpty)
      return 'Please enter a description';
    else if (value.length < 10)
      return 'Description must contain at least  10 characters.';
    else
      return null;
  }

  //validating stock
  String? validateStock(String? value) {
    if (value == null || value.isEmpty)
      return 'Please enter a Stock';
    else if (int.tryParse(value) == null)
      return 'Please enter a valid integer for stock';
    else
      return null;
  }

  //validating brandname
  String? validateBrandName(String? value) {
    if (value == null || value.isEmpty)
      return 'Please enter a brand name';
    else
      return null;
  }

  //validating brandname
  String? validateImage(String? value) {
    if (value == null || value.isEmpty)
      return 'Please enter a image';
    else
      return null;
  }

  Future<void> GetImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> AddProduct() async {
    if (addProductGlobalFormKey.currentState!.validate()) {
      isAddingProduct = true;
      try {
        final Reference ref = FirebaseStorage.instance
            .ref()
            .child('product_images')
            .child(_image!.path.split('/').last);
        ref.putFile(_image!);
        final String imageUrl = await ref.getDownloadURL();

        await productsCollection.add({
          'productName': _productNameController.text,
          'price': double.parse(_priceController.text),
          'discount': double.parse(_discountController.text),
          'description': _descriptionController.text,
          'stock': int.parse(_stockController.text),
          'brandName': _brandNameController.text,
          'imageUrl': imageUrl,
        });
        Fluttertoast.showToast(msg: 'Product added Sucessfuly!');
      } catch (error) {
        print('Error While adding product: $error');
        Fluttertoast.showToast(
            msg: 'Failed to add product. Please try again later.');
      } finally {
        isAddingProduct = false;
      }
    }
  }
}
