import 'package:flutter/material.dart';
import 'package:library_app/common/Dimensions.dart';
import 'package:library_app/common_widget/AppIcone.dart';

class BookDeatail extends StatelessWidget {
  const BookDeatail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
                  child: Center(
                    child: Text("name of book"),
                  ),
                )),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "lib/assets/img/images (3).jpg",
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
                  margin: EdgeInsets.only(
                      left: Dimension.width20, right: Dimension.width20),
                  child: Column(
                    children: [
                      Text("author: author name"),
                      SizedBox(
                        height: Dimension.height15,
                      ),
                      Text("Genre :Genre"),
                      SizedBox(
                        height: Dimension.height15,
                      ),
                    ],
                  )))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    backgroundcolor: Colors.green,
                    size: Dimension.iconsize24,
                    Iconecolor: Colors.white,
                    icon: Icons.add),
                Text("£12" + "X" + "0"),
                AppIcon(
                    backgroundcolor: const Color(0xff5ABD8C),
                    size: Dimension.iconsize24,
                    Iconecolor: Colors.white,
                    icon: Icons.remove),
              ],
            ),
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimension.raduis20 * 2),
                topRight: Radius.circular(Dimension.raduis20 * 2),
              ),
              color: Colors.white30,
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimension.height20,
                      bottom: Dimension.height20,
                      left: Dimension.width20,
                      right: Dimension.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.raduis20),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    size: Dimension.iconsize24,
                    color: const Color(0xff5ABD8C),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: Dimension.height20,
                bottom: Dimension.height20,
                left: Dimension.width20,
                right: Dimension.width20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.raduis20),
              color: Color(0xff5ABD8C),
            ),
            child: Text("10 £ Add to carte",
                style: TextStyle(
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
