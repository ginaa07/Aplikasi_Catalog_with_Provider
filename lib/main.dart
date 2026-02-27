import 'package:flutter/material.dart';

void main() {
  runApp(
    //Membungkus aplikasi dengan ChangeNotifierProvider 
    ChangeNotifierProvider(
      create: (context) => CartModel(), //Membuat instance CounterProvider
      child: const MyApp(), 
    ),
  );
}


//1. State model 
class CartModel extends ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items; 
  void addItem(String itemName) {
    _items.add(itemName); 
    notifyListeners(); 
  }

  void removeAll() {
    _items.clear(); 
    notifyListeners(); 
  }
}

//2. UI Layer
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyCatalog(),
        '/cart': (context) => const MyCart(),
      },
    );
  }
}

//Halaman Catalog
class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      'Nasi Goreng',
      'Mie Goreng',
      'Sate Ayam',
      'Es Teh Manis',
      'Ayam Bakar',
      'Kopi Hitam',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Makanan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'); 
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
            trailing: AddButton(item: products[index]),
          );
        }
      ),
    );
  }
}

//Widget Tombol untuk menambahkan item (Menggunakan Provider)
class AddButton extends StatelessWidget {
  final String item;

  const AddButton({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final iscart =context.select<CartModel, bool>((cart) => cart.items.contains(item));

    return TextButton(
      onPressed: iscart 
      ? null : () {
        context.read<CartModel>().add(item); 
      },
      child: iscart ? const Icon(Icons.check, color: Colors.green) : const Text('Tambah'),
    );
  }
}