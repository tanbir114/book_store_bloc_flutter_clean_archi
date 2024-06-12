import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:book_shop_ui/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:book_shop_ui/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(153, 207, 118, .85),
              Color.fromRGBO(153, 207, 118, .85),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 30,
              left: 15,
              child: GradientCircle(
                diameter: 110,
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(153, 207, 118, .2),
                    Color.fromRGBO(193, 224, 172, .7)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Positioned(
              top: -70,
              right: -240,
              child: GradientCircle(
                diameter: 400,
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(153, 207, 118, .2),
                    Color.fromRGBO(193, 224, 172, .7)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              left: -200,
              child: GradientCircle(
                diameter: 400,
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(153, 207, 118, .2),
                    Color.fromRGBO(193, 224, 172, .7)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: GradientCircle(
                diameter: 70,
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(153, 207, 118, .2),
                    Color.fromRGBO(193, 224, 172, .7)
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            Center(
              child: AnimatedSplashScreen(
                backgroundColor: Colors.transparent,
                splash: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize:
                      MainAxisSize.min, // Make the Column take minimum space
                  children: [
                    Flexible(
                      child: LottieBuilder.asset(
                        'assets/images/Animation - 1717949645274.json',
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                    ),
                  ],
                ),
                splashIconSize: MediaQuery.of(context).size.width * 0.6,
                nextScreen: HomeScreen(),
                splashTransition: SplashTransition.fadeTransition,
                duration: 3000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GradientCircle extends StatelessWidget {
  final double diameter;
  final Gradient gradient;

  GradientCircle({required this.diameter, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
      ),
    );
  }
}
