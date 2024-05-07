class ProductModel {
  final String productName;
  final double price;
  final String description;
  final String discount;
  final int stock;
  final String brandName;
  final String imageUrl;
  final String? documentsId;

  ProductModel({
    required this.productName,
    required this.price,
    required this.description,
    required this.discount,
    required this.stock,
    required this.brandName,
    required this.imageUrl,
    this.documentsId,
  });

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'price': price,
      'description': description,
      'discount': discount,
      'stock': stock,
      'brandName': brandName,
      'ImageUrl': imageUrl,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json, String documentsId) {
    return ProductModel(
      productName: json['productName'],
      price: json['price'],
      description: json['description'],
      discount: json['discount'],
      stock: json['stock'],
      brandName: json['brandName'],
      imageUrl: json['ImageUrl'],
      documentsId: documentsId,
    );
  }

  ProductModel copyWith({
    String? productName,
    double? price,
    String? description,
    String? discount,
    int? stock,
    String? brandName,
    String? imageUrl,
    String? documentsId,
  }) {
    return new ProductModel(
      productName: productName ?? this.productName,
      price: price ?? this.price,
      description: description ?? this.description,
      discount: discount ?? this.discount,
      stock: stock ?? this.stock,
      brandName: brandName ?? this.brandName,
      imageUrl: imageUrl ?? this.imageUrl,
      documentsId: documentsId ?? this.documentsId,
    );
  }
}
