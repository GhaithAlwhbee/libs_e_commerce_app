import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:libs_e_commerce_app/common/filled_button_impl.dart';
import 'package:libs_e_commerce_app/common/show_floating_message_widget.dart';
import 'package:libs_e_commerce_app/services/cart_service.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final DocumentSnapshot<Object?> product = args['product'];
    return Scaffold(
      appBar: AppBar(title: Text(product['name'])),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: product['url'],
                            progressIndicatorBuilder:
                                (context, url, progress) => Center(
                                  child: CupertinoActivityIndicator(
                                    color: const Color(0xFF4F008C),
                                  ),
                                ),
                            // placeholder:
                            //     (context, productImageUrl) => CircularProgressIndicator(),
                            errorWidget:
                                (context, url, error) => Icon(Icons.error),
                          ),
                        ),

                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              "H&M",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black38,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.star, color: Colors.amber, size: 17),
                            Text(
                              "${Random().nextInt(2) + 4}.${Random().nextInt(5) + 4}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "(${Random().nextInt(300) + 100})",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),

                        Text(
                          product['name'],
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${product['price']} \$",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.pink,
                            height: 1.5,
                          ),
                        ),
                        Text(
                          product['description'],
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
                FilledButtonData(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.add_shopping_cart, color: Colors.white),
                  ),
                  buttonColor: Colors.black,
                  "Add to Cart",
                  (Map<String, dynamic> param) async {
                    Provider.of<CartProvider>(context, listen: false).addToCart(
                      product.id,
                      product.data() as Map<String, dynamic>,
                    );
                    showFloatingMessage(context, 'Added to cart', status: true);
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
          ),
        ),
      ),
    );
  }
}
