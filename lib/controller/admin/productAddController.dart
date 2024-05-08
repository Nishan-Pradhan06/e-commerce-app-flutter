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

  final _addProductGlobalFormKey = GlobalKey<FormState>();

  bool isAddingProduct = false;
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> _addProduct() async {
    if (_addProductGlobalFormKey.currentState!.validate()) {
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
        print('Errpr While adding product: $error');
        Fluttertoast.showToast(
            msg: 'Failed to add product. Please try again later.');
      } finally {
        isAddingProduct = false;
      }
    }
  }
}
