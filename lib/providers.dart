import 'package:libs_e_commerce_app/services/auth_service.dart';
import 'package:libs_e_commerce_app/services/cart_service.dart';
import 'package:libs_e_commerce_app/services/product_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerList = [
  ChangeNotifierProvider(create: (ctx) => AuthProvider()),
  ChangeNotifierProvider(create: (ctx) => ProductProvider()),
  ChangeNotifierProvider(create: (ctx) => CartProvider()..loadCartItems()),
];
