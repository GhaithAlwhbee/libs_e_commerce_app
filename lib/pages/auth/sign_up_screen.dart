import 'package:flutter/material.dart';
import 'package:libs_e_commerce_app/common/bordered_input_field.dart';
import 'package:libs_e_commerce_app/common/filled_button_impl.dart';
import 'package:libs_e_commerce_app/common/show_floating_message_widget.dart';
import 'package:libs_e_commerce_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final nameFieldKey = GlobalKey<FormFieldState>();
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
      if (nameFieldKey.currentState!.validate()) {
      } else {
        return false;
      }
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
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/logo.png', width: double.infinity, height: 300),
            BorderedInputField(
              textFormKey: nameFieldKey,
              keyboardType: TextInputType.text,
              maxLines: 1,
              hintText: "Name",
              // textDirection: TextDirection.rtl,
              height: 56,
              controller: nameController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "name is required";
                }
              },
              isDense: false,
            ),
            SizedBox(height: 8.0),
            BorderedInputField(
              textFormKey: emailFieldKey,
              keyboardType: TextInputType.text,
              maxLines: 1,
              hintText: "Email",
              // textDirection: TextDirection.rtl,
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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FilledButtonData(
                    buttonColor: Colors.black,
                    "Sain Up",
                    (Map<String, dynamic> param) async {
                      if (isValidate()) {
                        String res = await authProvider.signUp(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        if (res == "success") {
                          if (context.mounted) {
                            showFloatingMessage(
                              context,
                              "Register Successful",
                              status: true,
                            );
                            Navigator.popAndPushNamed(context, 'home_screen');
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
