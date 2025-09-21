// import 'package:ebtech_task/View/Screens/Cart/Widgets/update_quantity_button.dart';
// import 'package:ebtech_task/data/models/cart.dart';
// import 'package:ebtech_task/provider/cart_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:libs_e_commerce_app/widgets/update_quantity_button.dart';
// import 'package:provider/provider.dart';

// class CartProductWidget extends StatelessWidget {
//   final CartModel cartModel;
//   final int index;
//   const CartProductWidget({super.key, required this.cartModel, required this.index});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//         color: Colors.white,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(
//           Radius.circular(12),
//         )),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Image.network(
//                     cartModel.product!.image,
//                     width: 100,
//                     height: 100,
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           cartModel.product!.title,
//                           style: const TextStyle(fontWeight: FontWeight.w500, height: 1.5, overflow: TextOverflow.fade),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("${(cartModel.product!.price * cartModel.quantity)} \$"),
//                             Row(
//                               children: [
//                                 UpdateQuantityButton(
//                                     icon: Icons.remove,
//                                     onPressed: () {
//                                       Provider.of<CartProvider>(context, listen: false)
//                                           .updateProductInCart(index, false);
//                                     }),
//                                 const SizedBox(
//                                   width: 5,
//                                 ),
//                                 Container(
//                                   decoration: const BoxDecoration(
//                                     borderRadius: BorderRadius.all(Radius.circular(5)),
//                                     color: Color.fromARGB(255, 245, 245, 245),
//                                   ),
//                                   width: 25,
//                                   height: 25,
//                                   child: Center(child: Text(cartModel.quantity.toString())),
//                                 ),
//                                 const SizedBox(
//                                   width: 5,
//                                 ),
//                                 UpdateQuantityButton(
//                                     icon: Icons.add,
//                                     onPressed: () {
//                                       Provider.of<CartProvider>(context, listen: false)
//                                           .updateProductInCart(index, true);
//                                     }),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }
