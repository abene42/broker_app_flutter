import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItemView extends StatelessWidget {
  final String imageUrl;
  final String cost;
  final VoidCallback? onCardClicked;
  const CardItemView(
      {Key? key,
      required this.imageUrl,
      required this.cost,
      this.onCardClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      height: 300,
      // padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => Get.toNamed('/detailPage'),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                    //TODO change asset image to network image
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover),
              ),
            ),
            const Divider(
              color: Colors.transparent,
              height: 40,
            ),
            Text(
              cost + ' Birr',
              style: const TextStyle(
                color: Color(0xff3E4E5E),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
