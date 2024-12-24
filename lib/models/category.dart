class Category {
  final String id;
  final String name;
  final String emoji;
  final String description;

  Category({
    required this.id,
    required this.name,
    required this.emoji,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String,
      emoji: json['emoji'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'emoji': emoji,
      'description': description,
    };
  }
}
