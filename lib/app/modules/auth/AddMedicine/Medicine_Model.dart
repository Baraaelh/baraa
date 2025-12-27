class MedicineModel {
  final String id;
  final String name;
  double price;
  int quantity; 
  final String image;
  final String description;

  MedicineModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.description,
  });
MedicineModel copy() {
    return MedicineModel(
      id: id,
      name: name,
      price: price,
      quantity: quantity,
      image: image,
      description: description,
    );
  }
  // 1. دالة التحويل لـ Map (عشان الحفظ في قاعدة البيانات)
  // بنستخدمها لما نبعت البيانات للسيرفر (Post/Put)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'image': image,
      'description': description,
    };
  }
factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] ?? 1, 
      image: json['image'],
      description: json['description'],
    );
  }
  // 2. دالة القراءة من Map (عشان تجيب البيانات من قاعدة البيانات)
  // بنستخدمها لما البيانات ترجع من السيرفر ونحولها لموديل عشان نعرضها
  factory MedicineModel.fromMap(Map<String, dynamic> map) {
    return MedicineModel(
      // استخدام ?? '' عشان لو الحقل فاضي ما يضرب التطبيق (Null Safety)
      id: map['id']?.toString() ?? '', 
      name: map['name'] ?? '',
      // التحويل لـ double ضروري لأن أحياناً السيرفر بيبعت الرقم صحيح (int)
      price: (map['price'] is int) 
          ? (map['price'] as int).toDouble() 
          : (map['price'] ?? 0.0),
      quantity: map['quantity']?.toInt() ?? 0,
      image: map['image'] ?? '',
      description: map['description'] ?? '',
    );
  }
}