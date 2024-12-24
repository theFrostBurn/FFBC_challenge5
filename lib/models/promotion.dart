class Promotion {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final int discountAmount;
  final DateTime validUntil;

  Promotion({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.discountAmount,
    required this.validUntil,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      discountAmount: json['discountAmount'] as int,
      validUntil: DateTime.parse(json['validUntil'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'discountAmount': discountAmount,
      'validUntil': validUntil.toIso8601String(),
    };
  }
}
