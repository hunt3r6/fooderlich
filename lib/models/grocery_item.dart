// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/painting.dart';

enum Importance { low, medium, high }

class GroceryItem {
  final String id;
  final String name;
  final Importance importance;
  final Color color;
  final int quantity;
  final DateTime date;
  final bool isCompate;

  GroceryItem({
    required this.id,
    required this.name,
    required this.importance,
    required this.color,
    required this.quantity,
    required this.date,
    required this.isCompate,
  });

  GroceryItem copyWith({
    String? id,
    String? name,
    Importance? importance,
    Color? color,
    int? quantity,
    DateTime? date,
    bool? isCompate,
  }) {
    return GroceryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      importance: importance ?? this.importance,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
      date: date ?? this.date,
      isCompate: isCompate ?? this.isCompate,
    );
  }
}
