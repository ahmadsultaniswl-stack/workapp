class FirebaseImage {
  String? id;
  String url;
  String name;
  DateTime uploadedAt;

  FirebaseImage({
    this.id,
    required this.url,
    required this.name,
    required this.uploadedAt,
  });

  factory FirebaseImage.fromMap(Map<String, dynamic> map, String id) {
    return FirebaseImage(
      id: id,
      url: map['url'] ?? '',
      name: map['name'] ?? '',
      uploadedAt: DateTime.parse(map['uploadedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'name': name,
      'uploadedAt': uploadedAt.toIso8601String(),
    };
  }
}
