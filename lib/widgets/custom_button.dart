import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onButtonTap;

  const CustomButton({Key? key, required this.buttonText, this.onButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: Get.width,
      height: 65,
      color: const Color(0xff0884FF),
      child: InkWell(
        onTap: onButtonTap,
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
