import 'package:broker_app/controllers/homepage/homepage_controller.dart';
import 'package:broker_app/widgets/custon_icon_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final HomepageController _homepageController =
      Get.put(HomepageController());
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ColorfulSafeArea(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 21.0),
            child: SizedBox(
              width: double.infinity,
              child: IndexedStack(
                index: currentPageIndex,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'What are you adding?',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3E4E5E),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        height: Get.size.height * 0.02,
                        color: Colors.transparent,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              alignment: WrapAlignment.center,
                              children: [
                                BigButton(
                                    icon: SvgPicture.asset(
                                        'assets/icons/car.svg'),
                                    buttonText: 'Car',
                                    onButtonTap: () => _homepageController
                                        .handleItemTypeButtonClicked('car')),
                                BigButton(
                                    icon: SvgPicture.asset(
                                        'assets/icons/house.svg'),
                                    buttonText: 'House',
                                    onButtonTap: () => _homepageController
                                        .handleItemTypeButtonClicked('house')),
                                BigButton(
                                    icon: SvgPicture.asset(
                                        'assets/icons/land.svg'),
                                    buttonText: 'Land',
                                    onButtonTap: () => _homepageController
                                        .handleItemTypeButtonClicked('land')),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'What are you looking for?',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3E4E5E),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        height: Get.size.height * 0.02,
                        color: Colors.transparent,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              alignment: WrapAlignment.center,
                              children: [
                                BigButton(
                                  icon:
                                      SvgPicture.asset('assets/icons/car.svg'),
                                  buttonText: 'Car',
                                  onButtonTap: () {
                                    _homepageController
                                        .handleItemTypeButtonClicked('car');
                                  },
                                ),
                                BigButton(
                                  icon: SvgPicture.asset(
                                      'assets/icons/house.svg'),
                                  buttonText: 'House',
                                  onButtonTap: () {
                                    _homepageController
                                        .handleItemTypeButtonClicked('house');
                                  },
                                ),
                                BigButton(
                                  icon:
                                      SvgPicture.asset('assets/icons/land.svg'),
                                  buttonText: 'Land',
                                  onButtonTap: () => _homepageController
                                      .handleItemTypeButtonClicked('land'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(color: Colors.brown, child: Center())
                ],
              ),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        selectedIconTheme:
            const IconThemeData(color: Color(0xff0884FF), size: 30),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        selectedItemColor: const Color(0xff0884FF),
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
          if (index == 0) {
            _homepageController.addSearchDataValue('routePathStatus', 'adding');
          } else if (index == 1) {
            _homepageController.addSearchDataValue(
                'routePathStatus', 'searching');
          } else if (index == 2) {
            _homepageController.addSearchDataValue('routePathStatus', 'me');
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_outlined),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}
