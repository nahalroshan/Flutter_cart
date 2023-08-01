import 'package:blocproject/features/cart/bloc/cart_bloc.dart';
import 'package:blocproject/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter_bloc_tutorial/features/cart/bloc/cart_bloc.dart';
//import 'package:flutter_bloc_tutorial/features/home/bloc/home_bloc.dart';
//import 'package:flutter_bloc_tutorial/features/home/models/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final productDataModel ProductDataModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.ProductDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Text(ProductDataModel.category),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + ProductDataModel.price.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // homeBloc.add(HomeProductWishlistButtonClickedEvent(
                        //     clickedProduct: productDataModel));
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                       cartBloc.add(CartRemoveFromCart(
                            ProductDataModel: ProductDataModel));
                      },
                      icon: Icon(Icons.shopping_bag)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}