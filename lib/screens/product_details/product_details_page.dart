import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_app/bloc/bloc/cart_bloc.dart';
import 'package:tr_app/data/model/cart_product_model.dart';
import 'package:tr_app/data/model/product_model.dart';
import 'package:tr_app/utils/ui/primary_appbar.dart';

class ProductDetailsPage extends StatelessWidget {
  // const ProductDetailsPage({super.key});
  final ProductModel product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Product Details',
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        width: double.infinity,
        //   color: Colors.amber,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Image(
                  image: NetworkImage(product.image),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                product.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                product.content,
                style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<CartBloc>()
                      .add(AddToCartEvent(CartProduct(product, 1)));

                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Product added to cart')));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
