import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardButton extends StatelessWidget {
  final String buttonText;
  final SvgPicture buttonIcon;
  final VoidCallback? onButtonClick;
  const CardButton(
      {Key? key,
      required this.buttonText,
      required this.buttonIcon,
      this.onButtonClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: onButtonClick,
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                buttonText,
                style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w400,
                    color: Color(
                      0xff3E4E5E,
                    )),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: RotatedBox(quarterTurns: 0, child: buttonIcon),
            )
          ],
        ),
      ),
    );
  }
}
