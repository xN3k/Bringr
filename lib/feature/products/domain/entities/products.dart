// ignore_for_file: public_member_api_docs, sort_constructors_first

class Products {
  final String id;
  final String title;
  final String description;
  final double price;
  final List<String> ingredients;

  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.ingredients,
  });
}
