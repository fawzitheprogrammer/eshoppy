import 'package:eshoppy/data/bottom_navbar_provider.dart';
import 'package:eshoppy/helpers/font_size.dart';
import 'package:eshoppy/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Core of design
      body: Container(
        /// Background
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg_girl.jpg'), fit: BoxFit.cover),
        ),

        /// Stack to put widgets above each others
        child: Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.topCenter,
          children: [
            /// Filter
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black45,
            ),

            /// Positioned Container that holds all items
            Positioned(
              bottom: 5,
              child: Container(
                padding: const EdgeInsets.all(10),

                /// Properties of core container
                height: MediaQuery.of(context).size.height * .54,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.3),
                ),

                /// A columns that aligns items vertically one line
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Form for sign-up
                    Form(
                      child: Column(
                        children: [
                          /// Form title - Fashion app
                          Text(
                            'Eshoppy',
                            style: poppinsCustom(Colors.black54, 18)
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),

                          /// TextField field for email
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email_sharp,
                                color: Colors.black45,
                              ),
                              hintText: 'Email',
                              hintStyle: poppinsCustom(Colors.grey, 14),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.6),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none),
                            ),
                            style: poppinsCustom(Colors.grey, 16),
                            cursorColor: Colors.black.withOpacity(0.4),
                          ),
                          const SizedBox(height: 10),

                          /// TextField for password
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.black45,
                              ),
                              hintText: 'Password',
                              hintStyle: poppinsCustom(Colors.grey, 14),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.6),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isHidden
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye_outlined,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (isHidden) {
                                      isHidden = true;
                                    } else {
                                      isHidden = false;
                                    }
                                  });
                                },
                              ),
                            ),
                            style: poppinsCustom(Colors.black54, 18),
                            cursorColor: Colors.black.withOpacity(0.4),
                            obscureText: isHidden,
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          /// Login Button
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: Colors.black87,
                                    onPressed: () {
                                      Provider.of<BottomNavBar>(context,
                                              listen: false)
                                          .bottomNavIndex(0);
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MyMainScreens(),
                                          ),
                                          (route) => false);
                                    },
                                    child: Text(
                                      'Login',
                                      style: poppinsCustom(Colors.white, 18),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),

                          /// Or Option
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 1,
                                width: MediaQuery.of(context).size.width * .1,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Or',
                                style: TextStyle(
                                    fontFamily: 'poppins-bold',
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width * .1,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          /// Continue with google mail
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: Stack(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              height: 60,
                                              child: MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                color: const Color(0xFFECEBEB),
                                                onPressed: () {
                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const MyMainScreens()),
                                                      (route) => false);
                                                },
                                                child: Text(
                                                  'Gmail',
                                                  style: poppinsCustom(
                                                      Colors.black87, 16),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Positioned(
                                        top: 15,
                                        left: 90,
                                        child: SvgPicture.asset(
                                          'assets/icons/google.svg',
                                          height: 30,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
