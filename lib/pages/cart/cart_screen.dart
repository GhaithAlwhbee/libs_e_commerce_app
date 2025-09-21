import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:libs_e_commerce_app/common/filled_button_impl.dart';
import 'package:libs_e_commerce_app/pages/cart/widgets/cart_item.dart';
import 'package:libs_e_commerce_app/services/cart_service.dart';
import 'package:libs_e_commerce_app/services/notifications_service.dart';
import 'package:libs_e_commerce_app/services/stripe_service.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(
      context,
      listen: true,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child:
                cartProvider.carts.isNotEmpty
                    ? ListView.builder(
                      itemCount: cartProvider.carts.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: CartItem(cartModel: cartProvider.carts[index]),
                        );
                      },
                    )
                    : Center(
                      child: Text(
                        "your cart is empty",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
          ),
          if (cartProvider.carts.isNotEmpty)
            _buildSummarySection(context, cartProvider),
        ],
      ),
    );
  }

  Widget _buildSummarySection(BuildContext context, CartProvider cartProvider) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Delivery',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Expanded(child: DottedLine()),
              SizedBox(width: 10),
              Text(
                'free',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Totla Order",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 10),
              Expanded(child: DottedLine()),
              SizedBox(width: 10),
              Text(
                "\$${cartProvider.totalCart().toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1,
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          FilledButtonData(
            buttonColor: Colors.black,
            "Pay ${cartProvider.totalCart().toStringAsFixed(2)}\$",
            (Map<String, dynamic> param) async {
              await StripeService.instance.makePayment(
                amount: cartProvider.totalCart(),
              );
              FirebaseApi().showLocalNotification(
                title: "Order Confirmed",
                body:
                    "We’ve received your payment of ${cartProvider.totalCart()}\$. Your items will ship soon",
              );
              cartProvider.clearCart();
              Navigator.pop(context);
            },
            const {},
            true,
            isRequireCustomTextStyle: true,
            customTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}
