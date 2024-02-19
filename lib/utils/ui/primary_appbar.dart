import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_app/bloc/cart/cart_bloc.dart';
import 'package:tr_app/screens/cart/cart_page.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      actions: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadedState) {
              return state.cart.cartProducts.isEmpty
                  ? const SizedBox()
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: Text(
                        state.cart.cartProducts.length.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
            } else {
              return const SizedBox();
            }
          },
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartPage()));
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          ),
        )
      ],
      backgroundColor: Colors.black,
    );
  }
}
