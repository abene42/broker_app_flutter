import 'package:broker_app/controllers/homepage/homepage_controller.dart';
import 'package:broker_app/widgets/card_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RentOrPurchasePage extends StatelessWidget {
  RentOrPurchasePage({Key? key}) : super(key: key);
  final HomepageController _homepageController = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Color(0xff3E4E5E),
      ),
      body: ColorfulSafeArea(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 21.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Rent\nor\nPurchase?',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3E4E5E),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    height: Get.size.height * 0.08,
                    color: Colors.transparent,
                  ),
                  CardButton(
                    buttonText: 'Rental',
                    buttonIcon: SvgPicture.asset('assets/icons/for_rent.svg'),
                    onButtonClick: () => _homepageController
                        .handleRentalOrPurchaseButtonClicked('rental'),
                  ),
                  Divider(
                    height: Get.size.height * 0.02,
                    color: Colors.transparent,
                  ),
                  CardButton(
                    buttonText: 'Purchase',
                    buttonIcon: SvgPicture.asset('assets/icons/for_sell.svg'),
                    onButtonClick: () => _homepageController
                        .handleRentalOrPurchaseButtonClicked('purchase'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
