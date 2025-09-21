import 'package:flutter/material.dart';
import 'package:libs_e_commerce_app/common/bordered_input_field.dart';
import 'package:libs_e_commerce_app/common/filled_button_impl.dart';
import 'package:libs_e_commerce_app/common/show_floating_message_widget.dart';
import 'package:libs_e_commerce_app/services/auth_service.dart';
import 'package:libs_e_commerce_app/services/cart_service.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final emailFieldKey = GlobalKey<FormFieldState>();
  final TextEditingController passwordController = TextEditingController();
  final passwordFieldKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );

    bool isValidate() {
      // Account Number validate
      if (emailFieldKey.currentState!.validate()) {
      } else {
        return false;
      }
      if (passwordFieldKey.currentState!.validate()) {
      } else {
        return false;
      }

      return true;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/logo.png', width: double.infinity),
            BorderedInputField(
              textFormKey: emailFieldKey,
              keyboardType: TextInputType.text,
              maxLines: 1,
              hintText: "Email",
              textDirection: TextDirection.ltr,
              height: 56,
              controller: emailController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "email is required";
                }
              },
              isDense: false,
            ),
            SizedBox(height: 8.0),
            BorderedInputField(
              textFormKey: passwordFieldKey,
              keyboardType: TextInputType.text,
              maxLines: 1,
              hintText: "Password",
              // textDirection: TextDirection.rtl,
              height: 56,
              controller: passwordController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "password is required";
                }
              },
              isDense: false,
            ),
            SizedBox(height: 24.0),
            FilledButtonData(
              buttonColor: Colors.black,
              "Login",
              (Map<String, dynamic> param) async {
                if (isValidate()) {
                  String res = await authProvider.login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (res == "success") {
                    Provider.of<CartProvider>(context, listen: false).reset();
                    if (context.mounted) {
                      showFloatingMessage(
                        context,
                        "Register Successful",
                        status: true,
                      );
                      Navigator.canPop(context);
                      Navigator.pushNamed(context, 'home_screen');
                    }
                  } else {
                    if (context.mounted) {
                      showFloatingMessage(context, res, status: false);
                    }
                  }
                }
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
    );
  }
}
