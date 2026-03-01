import 'package:aplikasicatalog/features/cart/domain/entities/product.dart';
import 'package:aplikasicatalog/features/cart/domain/repositories/cart_repository.dart';

// Implementasi konkret dari CartRepository
// Di sini bisa diganti dengan API call, database, dll
class CartRepositoryImpl implements CartRepository {
  // Kita gunakan _items (private) agar data lebih aman sesuai standar OOP
  final List<Product> _items = [];

  @override
List<Product> getCartItems() => List.unmodifiable(_items);
@override
void addItem(Product product) => _items.add(product);
@override