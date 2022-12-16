import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eshoppy/helpers/helper_imports.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          primary: true,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildSearchBox(),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: buildCategories(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSearchBox() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            height: 14,
            width: 14,
            color: iconAndInactiveTextColor,
          ),
        ),
        hintText: 'Search',
        hintStyle: GoogleFonts.poppins(color: iconAndInactiveTextColor),
        filled: true,
        fillColor: whiteColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
      ),
      style: poppinsCustom(iconAndActiveTextColor, 16),
      cursorColor: Colors.black.withOpacity(0.4),
    );
  }

  Widget buildCategories() {
    PageController controller = PageController();

    List<String> categories = [
      'Men Suits ',
      'Coat',
      'Shoes',
      'Dresses',
      'T-shirt',
      'Shirt'
    ];

    // void animateToPage(int index) {
    //   controller.animateToPage(index,
    //       duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    // }

    int activeButton = 0;

    return StatefulBuilder(
      builder: ((context, setState) => SizedBox(
            child: Column(
              children: [
                SizedBox(
                  height: deviceScreenHeight(context) * 0.06,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // Active and inactive colors for buttons
                      Color colorBg = Colors.transparent;
                      Color colorText = Colors.black38;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: MaterialButton(
                          minWidth: 25.0,
                          highlightElevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(
                              width: 2,
                              color: colorText.withOpacity(0.03),
                            ),
                          ),
                          color: colorBg,
                          elevation: 0.0,
                          onPressed: () {
                            setState(() {
                              activeButton = index;
                              // animateToPage(activeButton);
                            });
                          },
                          child: Text(
                            '#${categories[index]}',
                            style: poppinsCustom(colorText, 14).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
