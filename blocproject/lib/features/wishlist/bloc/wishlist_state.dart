part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}





@immutable


abstract class WishlistActionState extends WishlistState {}



class WishlistSuccessState extends WishlistState {
  final List<productDataModel> wishlistItems;

  WishlistSuccessState({required this.wishlistItems});

 
}
