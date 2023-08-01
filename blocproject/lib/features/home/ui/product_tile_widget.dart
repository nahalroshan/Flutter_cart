import 'package:blocproject/features/home/bloc/home_bloc.dart';
import 'package:blocproject/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class ProductTileWidget extends StatelessWidget {
  final productDataModel ProductDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.ProductDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(ProductDataModel.imageUrl))),
          ),
          const SizedBox(height: 20),
          Text(ProductDataModel.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(ProductDataModel.category,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + ProductDataModel.price.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishlistButtonClickedEvent(
                            clickedProduct: ProductDataModel));
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartButtonClickedEvent(
                            clickedProduct: ProductDataModel));
                      },
                      icon: Icon(Icons.shopping_cart_outlined)),
                ],
              )
            ],
          ),
        ]));
  }
}
