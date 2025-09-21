// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CardHomeWidget extends StatelessWidget {
  final Function() onTap;
  final String screenName;
  final String imageName;
  const CardHomeWidget({
    super.key,
    required this.onTap,
    required this.screenName,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Card(
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Image(image: image)
                    Image.asset(
                      'assets/images/$imageName',
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 150,
                      fit: BoxFit.fitWidth,
                    ),
                    Text(
                      screenName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          (screenName == 'Cart')
              ? Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    // Provider.of<CartProvider>(context, listen: true).numberOfItems.toString(),
                    '2', // todo replace with cart items count
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}
