import 'package:bringr/feature/products/domain/entities/products.dart';

class ProductsModel extends Products {
  ProductsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.ingredients,
  });

  Map<String, dynamic> toDocument() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'ingredients': ingredients,
    };
  }

  factory ProductsModel.fromDocument(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      ingredients: List<String>.from((map['ingredients'] ?? [])),
    );
  }
}
