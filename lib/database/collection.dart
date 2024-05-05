import 'package:cloud_firestore/cloud_firestore.dart';

const String USER_COLLECTION = "users";
const String PRODUCT_COLLECTION = "users";

final userCollection = FirebaseFirestore.instance.collection(USER_COLLECTION);

