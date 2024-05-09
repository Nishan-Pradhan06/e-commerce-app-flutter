import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class AdminProductDetails extends StatelessWidget {
  final UniqueKey key;
  const AdminProductDetails({required this.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker.instance;
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text(faker.commerce.productName()),
      ),
      body: ListView(
        children: [
          Image.network(
            faker.image.image(),
            width:MediaQuery.of(context).size.width,
          ),
          Text(faker.commerce.department()),
        ],
      ),
    );
  }
}
