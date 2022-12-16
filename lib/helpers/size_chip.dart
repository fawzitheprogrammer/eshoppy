import 'package:eshoppy/data/products_list.dart';
import 'package:eshoppy/helpers/font_size.dart';
import 'package:eshoppy/helpers/screen_size.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SizeChip extends StatefulWidget {
  SizeChip({Key? key, required this.productSize}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final productSize;

  int? selectedItemSize;

  static int? size;

  @override
  State<SizeChip> createState() => _SizeChipState();
}

class _SizeChipState extends State<SizeChip> {
  int? defaultIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: Container(
        height: deviceScreenHeight(context) * 0.07,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) => SizeChipCard(
                  onTap: () {
                    setState(() {
                      defaultIndex = index;
                      SizeChip.size = widget.productSize[index];
                    });
                  },
                  isSelect: defaultIndex! < 0 ? true : defaultIndex == index,
                  size: widget.productSize[index],
                )),
            separatorBuilder: ((context, index) => const Icon(
                  Icons.circle,
                  size: 4,
                  color: Colors.black12,
                )),
            itemCount: ProductsList().productsList.last.productSize.length),
      ),
    );
  }
}

class SizeChipCard extends StatefulWidget {
  const SizeChipCard({
    Key? key,
    required this.size,
    required this.onTap,
    required this.isSelect,
  }) : super(key: key);

  final int size;
  final Function() onTap;
  final bool isSelect;

  @override
  State<SizeChipCard> createState() => _SizeChipCardState();
}

class _SizeChipCardState extends State<SizeChipCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(15.0),
            border: Border(
              bottom: BorderSide(
                color: widget.isSelect ? Colors.black87 : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          height: deviceScreenHeight(context) * 0.055,
          width: deviceScreenHeight(context) * 0.055,
          child: Center(
            child: Text(
              widget.size.toString(),
              style: poppinsCustom(
                      widget.isSelect ? Colors.black87 : Colors.black12, 16)
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
