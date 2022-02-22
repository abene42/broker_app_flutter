import 'package:broker_app/widgets/custom_button.dart';
import 'package:broker_app/widgets/detail_row_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _carouselCenterIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ColorfulSafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300.0,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) =>
                        setState(() => {_carouselCenterIndex = index}),
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          height: 300,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/house_three.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: Get.width,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: AnimatedSmoothIndicator(
                      activeIndex: _carouselCenterIndex,
                      count: 5,
                      effect: const WormEffect(
                        activeDotColor: Color(0xff0884FF),
                        dotColor: Color(0xffF2F2F2),
                        dotWidth: 10,
                        dotHeight: 10,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back),
                    color: Color(0xff3E4E5E),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.fromLTRB(40, 100, 20, 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      DetailRowText(
                          leading: 'Location',
                          trailing: 'Addis Ababa, Bole, Gerji'),
                      Divider(
                        color: Colors.transparent,
                        height: 10,
                      ),
                      DetailRowText(
                          leading: 'Price', trailing: '50,000,000 Birr'),
                      Divider(
                        color: Colors.transparent,
                        height: 10,
                      ),
                      DetailRowText(leading: 'Area', trailing: '150 sq.M'),
                      Divider(
                        color: Colors.transparent,
                        height: 10,
                      ),
                      DetailRowText(
                        leading: 'Floors',
                        trailing: '2',
                      )
                    ],
                  ),
                ),
              ),
            ),
            const CustomButton(buttonText: 'Get Phone Number')
          ],
        ),
      ),
    );
  }
}
