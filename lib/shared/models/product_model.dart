import 'dart:convert';

class ProductModel {
  final String name;
  final double price;
  final String? image;

  ProductModel({required this.name, required this.price, this.image});

  ProductModel copyWith({
    String? name,
    double? price,
    String? image,
  }) {
    return ProductModel(
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'],
      price: map['price'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductModel(name: $name, price: $price, imagem: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.name == name &&
        other.price == price &&
        other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ image.hashCode;
}
