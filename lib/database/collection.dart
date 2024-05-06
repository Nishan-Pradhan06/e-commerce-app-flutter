import 'package:cloud_firestore/cloud_firestore.dart';

const String USER_COLLECTION = "users";
const String PRODUCT_COLLECTION = "products";

final userCollection = FirebaseFirestore.instance.collection(USER_COLLECTION);
final productsCollection =
    FirebaseFirestore.instance.collection(PRODUCT_COLLECTION);
