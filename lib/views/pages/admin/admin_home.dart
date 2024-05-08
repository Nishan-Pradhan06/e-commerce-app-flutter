import 'package:e_commercee/controller/admin/productController.dart';
import 'package:e_commercee/views/pages/admin/add_products.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset(
              'assets/icons/logo.png',
            ),
          ),
        ),
        title: Text("Admin Home"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amberAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Logout"),
                    content: Text("Are you sure you want to log out?"),
                    actions: [
                      ElevatedButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      ElevatedButton(
                        child: Text("Logout"),
                        onPressed: () {
                          // Implement logout functionality
                          Navigator.of(context).pop(); // Close the dialog
                          Navigator.pop(
                              context); // Example: pop back to login page
                          Fluttertoast.showToast(
                            msg:
                                'Logout Sucessfully',
                            gravity: ToastGravity.BOTTOM,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: GetBuilder<AdminProductController>(
        init: AdminProductController(),
        builder: (controller) {
          return controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.productLength,
                  itemBuilder: (context, index) {
                    final product = controller.productList[index];
                    return ListTile(
                      leading: Image.network(product.imageUrl),
                      title: Text(product.productName),
                      subtitle: Text(
                        product.description,
                        maxLines: 2,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              // Implement delete functionality
                            },
                            icon: Icon(Icons.delete),
                          ),
                          IconButton(
                            onPressed: () {
                              // Implement edit functionality
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to AddProduct page
          Get.to(() => AddProductsPage());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
