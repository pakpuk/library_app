import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:library_app/common/colors_extensions.dart';
import 'package:library_app/common_widget/best_seller.dart';
import 'package:library_app/common_widget/genres_cell.dart';
import 'package:library_app/common_widget/rece,ty_cell.dart';
import 'package:library_app/common_widget/top_piks_cell.dart';
import 'package:library_app/view/bookreading/book_reading_view.dart';
import 'package:library_app/view/main_tab/mainTab_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  List topPicksArr = [
    {
      "name": "Math Secret",
      "author": "Michael Rosen",
      "img": "lib/assets/img/9781524710590.jpg"
    },
    {
      "name": "Biology",
      "author": "Marcus Berkmann",
      "img": "lib/assets/img/exploring-the-world-of-biology.jpg"
    },
    {
      "name": "Secret of Mental Math",
      "author": "Stride Lottie",
      "img": "lib/assets/img/Secret-Mental-Math.jpg"
    }
  ];

  List bestArr = [
    {
      "name": "Math Secret",
      "author": "Michael Rosen",
      "img": "lib/assets/img/9781524710590.jpg",
      "rating": 5.0
    },
    {
      "name": "Biology",
      "author": "by Rebecca Mackenzie",
      "img": "lib/assets/img/images (2).jpg",
      "rating": 4.0
    },
    {
      "name": "Secret of Mental Math",
      "author": "Stride Lottie",
      "img": "lib/assets/img/Secret-Mental-Math.jpg",
      "rating": 3.0
    }
  ];

  List genresArr = [
    {
      "name": "Biology Cell",
      "img": "lib/assets/img/3-s2.0-C20140002729-cov200h.gif",
    },
    {
      "name": "The Art of Lebromancy",
      "img": "lib/assets/img/images (5).jpg",
    },
    {
      "name": "Speaking Volumes",
      "img": "lib/assets/img/SpeakingVolumes.webp",
    }
  ];

  List recentArr = [
    {
      "name": "Swim & Sun a Monocle  Guide ",
      "author": "by Jake Arnott",
      "img": "lib/assets/img/images (4).jpg"
    },
    {
      "name": "Sallinger",
      "author": "by LOTZ, SARAH",
      "img": "lib/assets/img/images (3).jpg"
    },
    {
      "name": "Biology Cell",
      "author": "by Edward Humes",
      "img": "lib/assets/img/3-s2.0-C20140002729-cov200h.gif"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  child: Transform.scale(
                    scale: 1.5,
                    origin: Offset(0, media.width * 0.8),
                    child: Container(
                      width: media.width,
                      height: media.width,
                      decoration: BoxDecoration(
                          color: TColor.primary,
                          borderRadius:
                              BorderRadius.circular(media.width * 0.5)),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Row(children: const [
                        Text(
                          "Our Top Picks",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                      leading: Container(),
                      leadingWidth: 1,
                      actions: [
                        IconButton(
                            onPressed: () {
                              sideMenuScaffoldKey.currentState?.openEndDrawer();
                            },
                            icon: const Icon(Icons.menu))
                      ],
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.8,
                      child: CarouselSlider.builder(
                        itemCount: topPicksArr.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          var iObj = topPicksArr[itemIndex] as Map? ?? {};
                          return TopPicksCell(
                            iObj: iObj,
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          viewportFraction: 0.45,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Best Orders",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width * 0.9,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: bestArr.length,
                          itemBuilder: ((context, index) {
                            var bObj = bestArr[index] as Map? ?? {};

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BookReadingView(
                                              bObj: bObj,
                                            )));
                              },
                              child: BestSellerCell(
                                bObj: bObj,
                              ),
                            );
                          })),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Genres",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width * 0.6,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: genresArr.length,
                          itemBuilder: ((context, index) {
                            var bObj = genresArr[index] as Map? ?? {};

                            return GenresCell(
                              bObj: bObj,
                              bgcolor: index % 2 == 0
                                  ? TColor.color1
                                  : TColor.color2,
                            );
                          })),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Recently Viewed",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width * 0.7,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: recentArr.length,
                          itemBuilder: ((context, index) {
                            var bObj = recentArr[index] as Map? ?? {};

                            return RecentlyCell(
                              iObj: bObj,
                            );
                          })),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
