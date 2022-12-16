import 'package:eshoppy/data/products_list.dart';
import 'package:eshoppy/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eshoppy/helpers/helper_imports.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  buildCarousel(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  buildLabel(label: 'Categories', link: 'View all'),
                ],
              ),
            ),
            SliverAppBar(
              pinned: true,
              backgroundColor: scaffoldBg(context),
              elevation: 0.0,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: buildCategories(),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: GridView.builder(
              physics: const BouncingScrollPhysics(), // important
              shrinkWrap: true,
              itemCount: ProductsList().productsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: deviceScreenHeight(context) * 0.34),
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => DetailScreen(
                              product: ProductsList().productsList[index],
                            )),
                      ),
                    );
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: deviceScreenHeight(context) * 0.25,
                            width: deviceScreenWidth(context) * 0.35,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Hero(
                                tag: ProductsList().productsList[index].imgUrl,
                                child: Image.asset(
                                  ProductsList().productsList[index].imgUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            ProductsList()
                                .productsList[index]
                                .productName
                                .toString(),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          RichText(
                            text: TextSpan(
                              text: r'$',
                              style: poppinsCustom(Colors.grey, 12)
                                  .copyWith(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: ProductsList()
                                      .productsList[index]
                                      .productNewPrice
                                      .toString(),
                                  style: poppinsCustom(Colors.black87, 14)
                                      .copyWith(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                );
              }),
            ))
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

  Widget buildCarousel() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: deviceScreenHeight(context) * 0.25,
      width: deviceScreenWidth(context) * 0.9,
      decoration: BoxDecoration(
        color: const Color.fromARGB(100, 255, 190, 169),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New \nCollections',
                  style: poppinsCustom(iconAndActiveTextColor, 18).copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: deviceScreenHeight(context) * 0.012,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: Colors.white,
                  elevation: 0.0,
                  onPressed: () {},
                  child: Text(
                    'Shop Now',
                    style: poppinsCustom(iconAndActiveTextColor, 14).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/collections.png',
            fit: BoxFit.cover,
            //height: deviceScreenHeight(context) * 0.15,
            width: deviceScreenWidth(context) * 0.5,
          ),
        ],
      ),
    );
  }

  Widget buildCategories() {
    PageController controller = PageController();

    List<String> categories = [
      'All',
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
                      Color colorBg = index == activeButton
                          ? Colors.black87
                          : Colors.transparent;
                      Color colorText =
                          index == activeButton ? Colors.white : Colors.black12;

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
                            categories[index],
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
