import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CameraAndGalleryButton extends StatelessWidget {
  final String buttonText;
  final SvgPicture buttonIcon;
  final VoidCallback? onButtonClick;

  const CameraAndGalleryButton(
      {Key? key,
      required this.buttonText,
      required this.buttonIcon,
      this.onButtonClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 150,
      width: Get.width * (2 / 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: onButtonClick,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                buttonText,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff3E4E5E)),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: RotatedBox(
                quarterTurns: 0,
                child: buttonIcon,
              ),
            )
          ],
        ),
      ),
    );
  }
}
