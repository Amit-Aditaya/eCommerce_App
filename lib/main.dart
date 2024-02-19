// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tr_app/bloc/bloc/cart_bloc.dart';
import 'package:tr_app/data/model/cart_product_model.dart';
import 'package:tr_app/data/model/cartmodel.dart';
import 'package:tr_app/data/model/product_model.dart';
import 'package:tr_app/screens/product_list/product_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(CartProductAdapter());
  Hive.registerAdapter(ProductModelAdapter());

  await Hive.openBox<CartModel>('cartBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc()..add(InitialCartEvent()),
      child: MaterialApp(
          title: 'Flutter Shopping App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const ProductListPage()),
    );
  }
}
