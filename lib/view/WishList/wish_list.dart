import 'package:flutter/material.dart';
import 'package:library_app/common/Dimensions.dart';
import 'package:library_app/common_widget/roung_butoon.dart';
import 'package:library_app/view/search/search_view.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 80),
            width: double.infinity,
            height: Dimension.height45,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "lib/assets/img/f6e464230662e7fa4c6a4afb92631aed.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: Dimension.height20,
          ),
          Text(
            "Your wish list is Empty",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              color: const Color(0xff212121),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: Dimension.height20,
          ),
          Text(
            "Explore more and shortList some books",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: const Color(0xff212121),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: Dimension.height20,
          ),
          RoundButton(
            title: 'Start Exploring',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchView()));
            },
          )
        ],
      ),
    );
  }
}
