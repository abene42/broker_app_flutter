import 'package:flutter/material.dart';

class DetailRowText extends StatelessWidget {
  final String leading;
  final String trailing;
  const DetailRowText({Key? key, required this.leading, required this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            leading,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const VerticalDivider(),
        Expanded(
          child: SizedBox(
            width: 100,
            child: Text(
              trailing,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
      ],
    );
  }
}
