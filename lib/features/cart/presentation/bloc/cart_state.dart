part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<CartDataModel> cartItems;
  CartSuccessState({
    required this.cartItems,
  });
}
