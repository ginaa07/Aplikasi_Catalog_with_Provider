import 'package:flutter/material.dart';
import 'package:aplikasicatalog/main.dart';
import 'features/cart/data/repositories/cart_repository_impl.dart';
import 'features/cart/presentation/providers/cart_provider.dart';
import 'package:provider/provider.dart';


// Mengatur semua dependency di satu tempat
Widget buildApp() {
  final cartRepository = CartRepositoryImpl();
  
  return ChangeNotifierProvider(
    create: (context) => CartProvider(repository: cartRepository),
    child: const MyApp(),
  );
}
