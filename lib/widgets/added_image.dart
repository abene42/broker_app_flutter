import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddedImage extends StatelessWidget {
  const AddedImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 160,
      alignment: Alignment.bottomRight,
      decoration: const BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: GestureDetector(
        child: SvgPicture.asset('assets/icons/remove_icon.svg'),
        onTap: () => print("\x1B[33m Image Remove button clicked \x1B[0m"),
      ),
    );
  }
}
