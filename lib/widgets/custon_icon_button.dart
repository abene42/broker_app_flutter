import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BigButton extends StatelessWidget {
  final SvgPicture icon;
  final String buttonText;
  final VoidCallback? onButtonTap;
  const BigButton(
      {Key? key,
      required this.icon,
      required this.buttonText,
      this.onButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 160,
      width: Get.width * (3 / 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ]),
      child: InkWell(
        onTap: onButtonTap,
        borderRadius: BorderRadius.circular(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              buttonText,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xff3E4E5E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
