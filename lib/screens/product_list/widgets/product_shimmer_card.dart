import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmerCard extends StatelessWidget {
  const ProductShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade300,
        child: ListTile(
          title: Container(
            margin: const EdgeInsets.only(bottom: 10),
            color: Colors.grey,
            width: 100,
            height: 25,
          ),
          leading: Container(
            height: 150,
            width: 75,
            color: Colors.grey,
          ),
          subtitle: Container(
            width: 120,
            height: 50,
            color: Colors.grey,
          ),
        ),
      ),
    ));
  }
}
