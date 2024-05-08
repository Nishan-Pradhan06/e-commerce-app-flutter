import 'package:e_commercee/controller/admin/productAddController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custonButton.dart';

class AddProductsPage extends StatelessWidget {
  AddProductsPage({Key? key}) : super(key: key);
  final AddProductController _addProduct = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200, // Change app bar color
        elevation: 4, // Add elevation for depth
        title: Text("Add New Product"),
      ),
      body: GetBuilder<AddProductController>(
          init: _addProduct,
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: _addProduct.addProductGlobalFormKey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                  shrinkWrap: true,
                  children: [
                    Text(
                      "Product Information",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    GetBuilder<AddProductController>(
                        init: AddProductController(),
                        builder: (AddProductController controller) {
                          return TextFormField(
                            decoration: InputDecoration(
                              labelText: "Product Name",
                            ),
                            validator: (value) {
                              return controller.validateIsProductName(value);
                            },
                          );
                        }),
                    SizedBox(height: 20),
                    GetBuilder<AddProductController>(
                        init: AddProductController(),
                        builder: (AddProductController controller) {
                          return TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Price",
                            ),
                            validator: (value) {
                              return controller.validatePrice(value);
                            },
                          );
                        }),
                    SizedBox(height: 20),
                    GetBuilder<AddProductController>(
                        init: AddProductController(),
                        builder: (AddProductController controller) {
                          return TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Discount",
                              ),
                              validator: (value) {
                                return null;
                              });
                        }),
                    SizedBox(height: 20),
                    TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Product Description",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Stock",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter stock';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid integer for stock';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Brand Name",
                      ),
                      validator: (value) {
                        // Add brand name validation logic here if needed
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Product Image",
                        suffixIcon: Icon(Icons.image),
                      ),
                    ),
                    SizedBox(height: 40),
                    CustomElevatedButton(
                      onPressed: _addProduct.isAddingProduct
                          ? null
                          : _addProduct.AddProduct,
                      isLoading: _addProduct.isAddingProduct,
                      buttonText: 'Add Product',
                      buttonColor: _addProduct.isAddingProduct
                          ? Color.fromARGB(255, 50, 83, 59)
                          : const Color(0xff1c903c),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
