import 'package:flutter/material.dart';
import 'package:aplikasicatalog/features/cart/presentation/providers/cart_provider.dart';


// Mengatur semua dependency di satu tempat
Widget buildApp() {
final cartRepository = CartRepositoryImpl();