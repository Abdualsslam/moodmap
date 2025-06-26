class FavoriteQuote {
  final String text;
  final DateTime addedAt;

  FavoriteQuote({required this.text, required this.addedAt});

  // تحويل الكائن إلى خريطة للحفظ
  Map<String, dynamic> toMap() {
    return {'text': text, 'addedAt': addedAt.toIso8601String()};
  }

  // إنشاء الكائن من خريطة
  factory FavoriteQuote.fromMap(Map<String, dynamic> map) {
    return FavoriteQuote(text: map['text'] as String, addedAt: DateTime.parse(map['addedAt'] as String));
  }

  // يمكنك إضافة مقارنة == إذا احتجت
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is FavoriteQuote && runtimeType == other.runtimeType && text == other.text;

  @override
  int get hashCode => text.hashCode;
}
