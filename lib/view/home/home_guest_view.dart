import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:library_app/common/colors_extensions.dart';
import 'package:library_app/common_widget/best_seller.dart';
import 'package:library_app/common_widget/genres_cell.dart';
import 'package:library_app/common_widget/round_text_field.dart';
import 'package:library_app/common_widget/roung_butoon.dart';
import 'package:library_app/common_widget/top_piks_cell.dart';
import 'package:library_app/view/bookreading/book_reading_view.dart';
import 'package:library_app/view/home/home_view.dart';
import 'package:library_app/view/main_tab/main_tab_guest.dart';

class HomeguestView extends StatefulWidget {
  const HomeguestView({super.key});

  @override
  State<HomeguestView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeguestView> {
  TextEditingController txtPassword = TextEditingController();
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
                          "Sign UP For More Actions",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                          color: TColor.textbox.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Receive our monthly newsletter and receive updates on new stock and books .",
                              style: TextStyle(
                                color: TColor.subTitle,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            RoundTextField(
                              controller: txtPassword,
                              hintText: "Email Address",
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            RoundTextField(
                              controller: txtEmail,
                              hintText: "Passwword",
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MiniRoundButton(
                                  title: "Sign In",
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeView()));
                                  },
                                )
                              ],
                            )
                          ]),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
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
