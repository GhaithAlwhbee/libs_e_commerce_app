import 'dart:convert';
import 'dart:developer';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment({required double amount}) async {
    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(
        amount,
        "usd",
      );
      if (paymentIntentClientSecret == null) return;

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Ghaith Alwehba",
        ),
      );

      await _processPayment();
    } catch (e) {
      log("Erorr $e");
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();

      // await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      log("Erorr $e");
    }
  }

  Future<String?> _createPaymentIntent(double amount, String currency) async {
    try {
      var client = http.Client();
      Map<String, dynamic> data = {
        "amount": (amount * 100).toInt().toString(),
        "currency": currency,
      };
      var response = await client.post(
        Uri.https('api.stripe.com', '/v1/payment_intents'),
        body: data,
        headers: {"Content-type": 'application/x-www-form-urlencoded'},
      );
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
      if (decodedResponse != null) {
        return decodedResponse['client_secret'];
      }
      return null;
    } catch (e) {
      log("Erorr $e");
      return null;
    }
  }
}
