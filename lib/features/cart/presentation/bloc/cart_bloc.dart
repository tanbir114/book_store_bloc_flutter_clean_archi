// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../home/presentation/bloc/home_bloc.dart';
import '../../data/cart_items.dart';
import '../../domain/entity/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final HomeBloc homeBloc;

  CartBloc(
    this.homeBloc,
  ) : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.cartDataModel);
    homeBloc.add(CartUpdatedEvent());
// emit()
    emit(CartSuccessState(cartItems: cartItems));
  }
}
