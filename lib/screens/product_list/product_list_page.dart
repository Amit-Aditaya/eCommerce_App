// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_app/bloc/bloc/cart_bloc.dart';
import 'package:tr_app/bloc/product_list/product_list_bloc.dart';
import 'package:tr_app/screens/product_list/widgets/product_card.dart';
import 'package:tr_app/screens/product_list/widgets/product_shimmer_card.dart';
import 'package:tr_app/utils/hive_boxes/boxes.dart';
import 'package:tr_app/utils/lifecycle/app_lifecycle.dart';
import 'package:tr_app/utils/ui/primary_appbar.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(LifecycleEventHandler(
        resumeCallBack: () {},
        detachedCallBack: () async {
          final box = Boxes.getCart();
          await box.clear();
          box.add(context.read<CartBloc>().cart);
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductListBloc()..add(GetProductListEvent()),
        ),
      ],
      child: Scaffold(
        appBar: const PrimaryAppBar(
          title: 'Product List',
        ),
        body: BlocBuilder<ProductListBloc, ProductListState>(
          builder: (context, state) {
            if (state is ProductListLoadedState) {
              return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: state.products[index]);
                  });
            } else if (state is ProductListLoadingState) {
              return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ProductShimmerCard();
                  });
            } else {
              // [Todo] make better
              return const Text('error');
            }
          },
        ),
      ),
    );
  }
}
