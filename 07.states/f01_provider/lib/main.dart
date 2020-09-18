import 'package:f01_provider/model/repository.dart';
import 'package:f01_provider/ui/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ShoppingCart()),
      Provider(create: (context) => ProductRepo())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Products(),
    );
  }
}
