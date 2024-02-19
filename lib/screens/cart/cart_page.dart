import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_app/bloc/bloc/cart_bloc.dart';
import 'package:tr_app/data/model/cart_product_model.dart';
import 'package:tr_app/utils/ui/primary_appbar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CartBloc>();
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Cart'),
      body: bloc.cart.cartProducts.isEmpty
          ? const Center(
              child: Text('Cart is Emplty'),
            )
          : ListView.builder(
              itemCount: bloc.cart.cartProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        bloc.cart.cartProducts[index].product.image),
                  ),
                  title: Text(bloc.cart.cartProducts[index].product.title),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('qty: ${bloc.cart.cartProducts[index].qty}'),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                              onTap: () {
                                bloc.add(RemoveFromCartEvent(CartProduct(
                                    bloc.cart.cartProducts[index].product, 1)));
                                setState(() {});
                              },
                              child: const Icon(Icons.remove)),
                          InkWell(
                              onTap: () {
                                bloc.add(AddToCartEvent(CartProduct(
                                    bloc.cart.cartProducts[index].product, 1)));
                                setState(() {});
                              },
                              child: const Icon(Icons.add)),
                        ],
                      )
                    ],
                  ),
                );
              }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: const Text(
          'Buy',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
