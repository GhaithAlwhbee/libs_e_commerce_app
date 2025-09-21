import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  // void saveCartListTolocal(List<CartModel> cartProductsList) async{
  //   List<String> stringCartList = [];
  //   cartProductsList.forEach((cartModel) => stringCartList.add(jsonEncode(cartModel.toJson())) );
  //   if(sharedPreferences.containsKey(AppConstants.cartList)){
  //     await sharedPreferences.remove(AppConstants.cartList);
  //   }
  //   sharedPreferences.setStringList(AppConstants.cartList, stringCartList);
  // }

  //  List<CartModel> getCartListFromLocal() {
  //   List<String>? stringCartList = [];
  //   if(sharedPreferences.containsKey(AppConstants.cartList)) {
  //     stringCartList = sharedPreferences.getStringList(AppConstants.cartList);
  //   }
  //   List<CartModel> cartList = [];
  //   stringCartList!.forEach((item) => cartList.add(CartModel.fromJson(jsonDecode(item))) );
  //   return cartList;
  // }
}
