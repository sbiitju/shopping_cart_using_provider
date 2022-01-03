import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_using_provider/provider/add_items_notifier.dart';
import 'package:shopping_cart_using_provider/provider/cart_notifier.dart';
import 'package:shopping_cart_using_provider/view/home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AddItemsProvider>(
          create: (context) => AddItemsProvider()),
      ChangeNotifierProvider<CartNotifier>(create: (context) => CartNotifier()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
