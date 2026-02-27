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