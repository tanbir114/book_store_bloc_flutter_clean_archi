part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final BookDataModel clickedBook;
  HomeProductWishlistButtonClickedEvent({
    required this.clickedBook,
  });
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final CartDataModel clickedBook;
  HomeProductCartButtonClickedEvent({
    required this.clickedBook,
  });
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}

class CartUpdatedEvent extends HomeEvent {}
