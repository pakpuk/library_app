import 'package:flutter/material.dart';
import 'package:library_app/common/colors_extensions.dart';
import 'package:library_app/common/extensions.dart';
import 'package:library_app/common_widget/hestory_raw.dart';
import 'package:library_app/common_widget/search_grid.dart';
import 'package:library_app/view/search/search_force_view.dart';
import 'package:library_app/view/search/search_view_filter.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtSearch = TextEditingController();
  int selectTag = 0;
  List tagsArr = [
    "Genre",
    "New Release",
    "The Art",
    "Genre1",
    "New Release1",
    "The Art1"
  ];

  List searchArr = [
    {
      "name": "Biography",
      "img": "lib/assets/img/images (2).png",
    },
    {
      "name": "Business",
      "img": "lib/assets/img/téléchargement (4).jpg",
    },
    {"name": "Math ", "img": "lib/assets/img/9781524710590.jpg"},
    {
      "name": "Physic",
      "img": "lib/assets/img/téléchargement (6).jpg",
    },
    {
      "name": "Fiction",
      "img": "lib/assets/img/images (7).jpg",
    },
    {
      "name": "Math ",
      "img": "lib/assets/img/9781524710590.jpg",
    },
  ];

  List sResultArr = [
    {
      "name": "The Heart of Hell",
      "img": "lib/assets/img/images (7).jpg",
      "author": "Mitch Weiss",
      "description":
          "The untold story of courage and sacrifice in the shadow of Iwo Jima.",
      "rate": 5.0
    },
    {
      "name": "Adrennes 1944",
      "img": "lib/assets/img/images (2).png",
      "author": "Antony Beevor",
      "description":
          "#1 international bestseller and award winning history book.",
      "rate": 4.0
    },
    {
      "name": "War on the Gothic Line",
      "img": "ib/assets/img/téléchargement (4).jpg",
      "author": "Christian Jennings",
      "description":
          "Through the eyes of thirteen men and women from seven different nations",
      "rate": 3.0
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: TColor.textbox,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: txtSearch,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchForceView(
                            didSearch: (sText) {
                              txtSearch.text = sText;
                              if (mounted) {
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      );
                      endEditing();
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 8),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: TColor.text),
                      suffixIcon: SizedBox(
                        width: 40,
                        child: IconButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchFilterView(
                                    didFilter: (fObj) {
                                      if (mounted) {
                                        setState(() {});
                                      }
                                    },
                                  ),
                                ),
                              );
                              endEditing();
                            },
                            icon: Icon(Icons.tune, color: TColor.text)),
                      ),
                      hintText: "Search Books. Authors. or ISBN",
                      labelStyle: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              if (txtSearch.text.isNotEmpty)
                const SizedBox(
                  width: 8,
                ),
              if (txtSearch.text.isNotEmpty)
                TextButton(
                    onPressed: () {
                      txtSearch.text = "";
                      setState(() {});
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: TColor.text,
                        fontSize: 17,
                      ),
                    ))
            ],
          ),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: tagsArr.map((tagName) {
                    var index = tagsArr.indexOf(tagName);
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectTag = index;
                          });
                        },
                        child: Text(
                          tagName,
                          style: TextStyle(
                              color: selectTag == index
                                  ? TColor.text
                                  : TColor.subTitle,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            if (txtSearch.text.isEmpty)
              Expanded(
                child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.75,
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: searchArr.length,
                  itemBuilder: (context, index) {
                    var sObj = searchArr[index] as Map? ?? {};
                    return SearchGridCell(
                      sObj: sObj,
                      index: index,
                    );
                  },
                ),
              ),
            if (txtSearch.text.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: sResultArr.length,
                  itemBuilder: (context, index) {
                    var sObj = sResultArr[index] as Map? ?? {};
                    return HistoryRow(
                      sObj: sObj,
                    );
                  },
                ),
              )
          ],
        ));
  }
}
