import 'package:project/app/modules/auth/AddMedicine/Medicine_Model.dart';

 
class CartItemModel {
  final MedicineModel medicine;
  int quantity;

  CartItemModel({
    required this.medicine,
    this.quantity = 1,
  });

  /// السعر الكلي لهذا الدواء (السعر × الكمية)
  double get totalPrice => medicine.price * quantity;

  /// زيادة الكمية
  void increase() {
    quantity++;
  }

  /// إنقاص الكمية (مع حماية من النزول تحت 1)
  void decrease() {
    if (quantity > 1) {
      quantity--;
    }
  }

  /// للتحويل إلى JSON (مستقبلاً للتخزين أو API)
  Map<String, dynamic> toJson() {
    return {
      'medicine': medicine.toJson(),
      'quantity': quantity,
    };
  }

  /// الإنشاء من JSON
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      medicine: MedicineModel.fromJson(json['medicine']),
      quantity: json['quantity'] ?? 1,
    );
  }
}
