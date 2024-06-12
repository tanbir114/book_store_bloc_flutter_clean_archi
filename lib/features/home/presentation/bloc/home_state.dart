part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<BookDataModel> books;
  final List<CartDataModel> cartItems;
  HomeLoadedSuccessState({
    required this.books,
    required this.cartItems,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}

class HomeCartUpdatedState extends HomeLoadedSuccessState {
  HomeCartUpdatedState({required super.books, required super.cartItems});
}
