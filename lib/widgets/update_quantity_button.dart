import 'package:flutter/material.dart';

class UpdateQuantityButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  const UpdateQuantityButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color.fromARGB(255, 245, 245, 245),
        ),
        width: 25,
        height: 25,
        child: Icon(icon, size: 15),
      ),
    );
  }
}
