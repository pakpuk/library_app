import 'package:flutter/material.dart';
import 'package:library_app/common/Dimensions.dart';
import 'package:library_app/common/colors_extensions.dart';

class ExpandabelTextwidget extends StatefulWidget {
  final String text;
  const ExpandabelTextwidget({super.key, required this.text});
  @override
  _ExpandabelTextwidgetState createState() => _ExpandabelTextwidgetState();
}

class _ExpandabelTextwidgetState extends State<ExpandabelTextwidget> {
  late String firsthalf;
  late String secondHalf;
  final double texthalf = Dimension.screeenHeight / 5.63;
  bool Hiddentext = true;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > texthalf) {
      firsthalf = widget.text.substring(0, texthalf.toInt());
      secondHalf =
          widget.text.substring(texthalf.toInt() + 1, widget.text.length);
    } else {
      firsthalf = widget.text;
      secondHalf = " ";
    }

    @override
    Widget build(BuildContext context) {
      return Container(
        child: secondHalf.isEmpty
            ? Text(
                firsthalf,
                style: TextStyle(
                  color: TColor.subTitle,
                  fontSize: 11,
                ),
              )
            : Column(
                children: [
                  Text(
                      Hiddentext
                          ? (firsthalf + "...")
                          : (firsthalf + secondHalf),
                      style: TextStyle(
                        height: 1.8,
                        color: Colors.black,
                      )),
                  InkWell(
                    onTap: () {
                      Hiddentext = !Hiddentext;
                    },
                    child: Row(
                      children: [
                        Text(
                          Hiddentext ? "show more" : "show less",
                          style: TextStyle(color: const Color(0xff5ABD8C)),
                        ),
                        Icon(
                            Hiddentext
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: const Color(0xff5ABD8C))
                      ],
                    ),
                  )
                ],
              ),
      );
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
