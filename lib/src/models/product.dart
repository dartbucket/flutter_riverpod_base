// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final int id;
  final String title;
  final String description;
  const Product({
    required this.id,
    required this.title,
    required this.description,
  });

  Product copyWith({
    int? id,
    String? title,
    String? description,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  // TODO: standard is toJson();.
  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'id': id,
      'title': title,
    };
  }

  // TODO: standard is fromJson();.
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  // TODO: consider using the library  json_serializable.
  String toJson() => json.encode(toMap());

  // TODO: consider using the library  json_serializable.
  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Product(id: $id, title: $title, description: $description)';

  // TODO: consider using freezed or equatable.
  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description;
  }

  // TODO: consider using freezed or equatable.
  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode;
}
