import 'package:aplikasicatalog/core/routes/app_router.dart';
import 'package:aplikasicatalog/features/cart/presentation/widgets/add_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:aplikasicatalog/features/cart/domain/entities/product.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  static final List<Product> _products = [
    Product(id: '1', name: 'Nasi Goreng', price: 15000),
    Product(id: '2', name: 'Sate Ayam', price: 20000),
    Product(id: '3', name: 'Es Teh', price: 5000),
    Product(id: '4', name: 'Es Jeruk', price: 7000),
    Product(id: '5', name: 'Steak', price: 200000),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Makanan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, AppRouter.cart),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_products[index].name),
          subtitle: Text('Rp ${_products[index].price}'),
          trailing: AddButtonWidget(product: _products[index]),
        ),
      ),
    );
  }
}
