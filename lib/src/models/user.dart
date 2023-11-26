import 'dart:convert';

/// Sample User class just to demonstrate Authentication.

class User {
  final String id;
  final String name;
  final String email;
  const
  // TODO: add const to your constructor.
  User({
    required this.id,
    required this.name,
    required this.email,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  // TODO: standard is toJson();.
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'id': id,
      'name': name,
    };
  }

  // TODO: standard is fromJson();.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }
  // TODO: consider using the library  json_serializable.
  String toJson() => json.encode(toMap());
  // TODO: consider using the library  json_serializable.
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(id: $id, name: $name, email: $email)';
  // TODO: consider using freezed or equatable.
  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.email == email;
  }

  // TODO: consider using freezed or equatable.
  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;
}
