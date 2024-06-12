import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_shop_ui/features/home/domain/entity/home_product_data.dart';
import 'package:book_shop_ui/models/bookmodel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../cart/data/cart_items.dart';
import '../../../cart/domain/entity/cart_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<CartUpdatedEvent>(cartUpdatedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(HomeLoadedSuccessState(
        books: books
            .map((e) => BookDataModel(
                  id: e['id'],
                  imageUrl: e['imageUrl'],
                  title: e['title'],
                  author: e['author'],
                  description: e['description'],
                  rating: e['rating'],
                  price: e['price'],
                ))
            .toList(),
        cartItems: cartItems.toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist Product Clicked');
    // wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Product clicked');
    if (cartItems.any((item) => item.id == event.clickedBook.id)) {
      final existingBook =
          cartItems.firstWhere((item) => item.id == event.clickedBook.id);
      existingBook.quantity++;
    } else {
      cartItems.add(event.clickedBook);
      emit(HomeLoadedSuccessState(
          books: books
              .map((e) => BookDataModel(
                    id: e['id'],
                    imageUrl: e['imageUrl'],
                    title: e['title'],
                    author: e['author'],
                    description: e['description'],
                    rating: e['rating'],
                    price: e['price'],
                  ))
              .toList(),
          cartItems: cartItems.toList()));
    }
    emit(HomeLoadedSuccessState(
        books: books
            .map((e) => BookDataModel(
                  id: e['id'],
                  imageUrl: e['imageUrl'],
                  title: e['title'],
                  author: e['author'],
                  description: e['description'],
                  rating: e['rating'],
                  price: e['price'],
                ))
            .toList(),
        cartItems: cartItems.toList()));
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Wishlist Navigate clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart Navigate clicked');
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> cartUpdatedEvent(
      CartUpdatedEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadedSuccessState(
        books: books
            .map((e) => BookDataModel(
                  id: e['id'],
                  imageUrl: e['imageUrl'],
                  title: e['title'],
                  author: e['author'],
                  description: e['description'],
                  rating: e['rating'],
                  price: e['price'],
                ))
            .toList(),
        cartItems: cartItems.toList()));
  }
}
