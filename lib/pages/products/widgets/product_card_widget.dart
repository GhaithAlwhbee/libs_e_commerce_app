import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final DocumentSnapshot<Object?> product;
  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => Navigator.pushNamed(
            context,
            'product_screen',
            arguments: {'product': product},
          ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: CachedNetworkImage(
                width: 140,
                height: 140,
                imageUrl: product['url'],
                progressIndicatorBuilder:
                    (context, url, progress) => Center(
                      child: CupertinoActivityIndicator(
                        color: const Color(0xFF4F008C),
                      ),
                    ),
                // placeholder:
                //     (context, productImageUrl) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "H&M",
                  style: TextStyle(fontSize: 14, color: Colors.black38),
                ),
                SizedBox(width: 5),
                Icon(Icons.star, color: Colors.amber, size: 17),
                Text(
                  "${Random().nextInt(2) + 4}.${Random().nextInt(5) + 4}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 2),
                Text(
                  "(${Random().nextInt(300) + 100})",
                  style: TextStyle(fontSize: 12, color: Colors.black38),
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
              style: TextStyle(fontSize: 18, color: Colors.pink, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
