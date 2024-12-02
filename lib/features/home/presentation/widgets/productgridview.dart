import 'package:admingrocerypanel/core/utils/appstyles.dart';
import 'package:admingrocerypanel/features/home/data/model/product_model.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/productwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView(
      {super.key,
      this.crossAxisCount = 4,
      this.childAspectRatio = 1,
      this.allproduct = true});

  final int crossAxisCount;
  final double childAspectRatio;
  final bool allproduct;

  @override
  Widget build(BuildContext context) {
    var firebaseFirestore =
        FirebaseFirestore.instance.collection("products").snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: firebaseFirestore,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          var data = snapshot.data!.docs;

          if (data.isEmpty) {
            return Center(
              child: Text(
                "Your Store Is Empty Now",
                style: AppStyles.style17,
              ),
            );
          }

          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: childAspectRatio,
            ),
            itemBuilder: (context, index) {
              return ProductWidget(
                productModel: ProductModel.fetchdata(data[index]),
              );
            },
          );
        } else {
          return Center(
            child: Text(
              "Your Store Is Empty Now", // Message when no products exist
              style: AppStyles.style17,
            ),
          );
        }
      },
    );
  }
}
