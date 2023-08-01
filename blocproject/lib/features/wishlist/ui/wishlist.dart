import 'package:blocproject/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:blocproject/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WishList Items'),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc:wishlistBloc,
        listener: (context, state) {
       
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(
                      ProductDataModel: successState.wishlistItems[index],
                      wishlistBloc: wishlistBloc,
                    );
                  });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
