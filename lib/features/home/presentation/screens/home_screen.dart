import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/presentation/screens/cartscreen.dart';
import '../bloc/home_bloc.dart';
import '../widgets/trendingslider.dart';
import '../widgets/book_slider.dart';
import '../widgets/image_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;

  @override
  void initState() {
    print("kkkkkkkkkkkkkkkkkkkk");
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print("aaaaaaaaaaaaa");

    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CartScreen(
                      homeBloc: homeBloc,
                    )),
          );
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Item added to cart!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.check_circle,
                    color: Colors.green[200],
                  ),
                ],
              ),
              backgroundColor: Colors.blueGrey[900],
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              action: SnackBarAction(
                label: 'VIEW CART',
                textColor: Colors.greenAccent,
                onPressed: () {
                  // Navigate to the cart screen
                  homeBloc.add(HomeCartButtonNavigateEvent());
                },
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case HomeLoadedSuccessState:
            print("ssssssssssssssssssssss");
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  'Discover',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                actions: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: width * .03),
                    height: height * .05,
                    width: width * .1,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        // Handle search action
                      },
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: width * .03),
                    height: height * .05,
                    width: width * .1,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: const FractionalOffset(
                                  1.0, 0.0), // top right corner
                              child: Transform.translate(
                                offset: const Offset(8,
                                    -8), // fine-tune the position if necessary
                                child: Container(
                                  padding: const EdgeInsets.all(
                                      4), // Increase padding for larger size
                                  decoration: const BoxDecoration(
                                    color: Colors.redAccent,
                                    shape: BoxShape.circle,
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 22, // Increase minimum width
                                    minHeight: 22, // Increase minimum height
                                  ),
                                  child: Text(
                                    "${state.cartItems.length}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16, // Increase font size
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.shopping_cart),
                              onPressed: () {
                                homeBloc.add(HomeCartButtonNavigateEvent());
                              },
                              color: Colors.white,
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.shopping_cart),
                          onPressed: () {
                            homeBloc.add(HomeCartButtonNavigateEvent());
                          },
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * .05, right: width * .05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.03),
                      ImageSlider(
                        currentSlide: currentSlider,
                        onChange: (value) {
                          setState(() {
                            currentSlider = value;
                          });
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      const Text(
                        'Best Seller',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      SizedBox(height: height * 0.01),
                      BookSlider(
                        bookDataModel: successState.books,
                        homeBloc: homeBloc,
                      ),
                      SizedBox(height: height * 0.03),
                      const Text(
                        'Trending',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      SizedBox(height: height * 0.01),
                      const Trendingslider(),
                    ],
                  ),
                ),
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text(
                  "Error",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
