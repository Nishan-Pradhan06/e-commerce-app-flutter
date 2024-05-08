
import 'package:flutter/material.dart';

class AddProductsPage extends StatelessWidget {
  const AddProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200, // Change app bar color
        elevation: 4, // Add elevation for depth
        title: Text("Add New Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Product Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Price",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Discount",
                ),
                validator: (value) {
                  // Add discount validation logic here if needed
                  return null;
                },
              ),
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
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submit button action
                  },
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
