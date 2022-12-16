import 'package:eshoppy/helpers/screen_size.dart';
import 'package:flutter/material.dart';


class ColorChips extends StatefulWidget {
  ColorChips({Key? key, required this.productColors}) : super(key: key);

  final List<Color> productColors;

  Color? selectedItemColor;

  static Color? color;

  @override
  State<ColorChips> createState() => _ColorChipsState();
}

class _ColorChipsState extends State<ColorChips> {
  int? defaultIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.productColors.length,
        (index) {
          return Flexible(
            child: ChipCard(
              onTap: () {
                setState(() {
                  defaultIndex = index;
                  ColorChips.color = widget.productColors[index];
                });
              },
              color: widget.productColors[index],
              isSelect: defaultIndex == index ? true : false,
            ),
          );
        },
      ),
    );
  }
}

class ChipCard extends StatefulWidget {
  const ChipCard({
    Key? key,
    required this.onTap,
    required this.isSelect,
    required this.color,
  }) : super(key: key);

  final Function() onTap;
  final bool isSelect;
  final Color color;

  @override
  State<ChipCard> createState() => _ChipCardState();
}

class _ChipCardState extends State<ChipCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: widget.color.withOpacity(0.7),
              border: Border.all(
                width: 2.5,
                color: widget.color == Colors.white
                    ? Colors.black.withOpacity(0.05)
                    : Colors.white60,
              )),
          height: deviceScreenHeight(context) * 0.055,
          width: deviceScreenHeight(context) * 0.055,
          child: Center(
            child: widget.isSelect
                ? Icon(
                    Icons.check,
                    color: widget.color == Colors.white
                        ? Colors.black54
                        : Colors.white,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
