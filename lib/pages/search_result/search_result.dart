import 'package:broker_app/widgets/card_item_view.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xff3E4E5E),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Search Result',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color(0xff3E4E5E),
          ),
        ),
      ),
      body: ColorfulSafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: const [
              CardItemView(
                imageUrl: 'assets/images/house_three.jpg',
                cost: '50,000,000',
              ),
              Divider(
                color: Colors.transparent,
              ),
              CardItemView(
                imageUrl: 'assets/images/house_three.jpg',
                cost: '50,000,000',
              ),
              Divider(
                color: Colors.transparent,
              ),
              CardItemView(
                imageUrl: 'assets/images/house_three.jpg',
                cost: '50,000,000',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
