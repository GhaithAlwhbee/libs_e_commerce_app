import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:libs_e_commerce_app/firebase_options.dart';
import 'package:libs_e_commerce_app/pages/app_main_screen.dart';
import 'package:libs_e_commerce_app/pages/auth/login_screen.dart';
import 'package:libs_e_commerce_app/pages/auth/sign_up_screen.dart';
import 'package:libs_e_commerce_app/pages/auth/welcome_screen.dart';
import 'package:libs_e_commerce_app/pages/cart/cart_screen.dart';
import 'package:libs_e_commerce_app/pages/products/product_screen.dart';
import 'package:libs_e_commerce_app/providers.dart';
import 'package:libs_e_commerce_app/services/notifications_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "";
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  runApp(MultiProvider(providers: providerList, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError || !snapshot.hasData) {
            return WelcomeScreen();
          } else {
            return AppMainScreen();
          }
        },
      ),
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        'registration_screen': (context) => SignUpScreen(),
        'login_screen': (context) => LoginScreen(),
        'home_screen': (context) => AppMainScreen(),
        'product_screen': (context) => ProductScreen(),
        'cart_screen': (context) => CartScreen(),
      },
    );
  }
}
