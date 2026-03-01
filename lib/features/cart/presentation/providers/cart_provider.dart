import 'package:flutter/material.dart';
import 'package:aplikasicatalog/features/cart/domain/repositories/cart_repository.dart';

class CartProvider extends ChangeNotifier {
final CartRepository _repository;

// Dependency Injection melalui constructor
CartProvider({required CartRepository repository}) : _repository = repository;