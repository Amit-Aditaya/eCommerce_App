import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_app/bloc/bloc/cart_bloc.dart';
import 'package:tr_app/data/model/cart_product_model.dart';
import 'package:tr_app/data/model/product_model.dart';
import 'package:tr_app/screens/product_details/product_details_page.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -3),
      leading: SizedBox(
          height: 150,
          width: 75,
          child: Image(
            image: NetworkImage(product.image),
          )),
      title: Text(
        product.title,
        maxLines: 1,
        style:
            const TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
      ),
      subtitle: Column(
        children: [
          Text(
            product.content,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey.shade500),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    context
                        .read<CartBloc>()
                        .add(AddToCartEvent(CartProduct(product, 1)));

                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Product added to cart')));
                  },
                  child: const Icon(Icons.add_shopping_cart)),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductDetailsPage(product: product);
                  }));
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      'Details',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
