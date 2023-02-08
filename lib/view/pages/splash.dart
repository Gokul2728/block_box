import 'dart:async';
//import 'package:aesthetic_dialogs/aesthetic_dialogs.dart';
import 'package:block_box/view/pages/bottomNaviBar/naviBar.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const NaviBar()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff7847FC),
        body: SizedBox(
          height: myHeight,
          width: myWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: myHeight * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(''),
                const Text(
                  'IO wallet',
                  style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Creat by',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: myWidth * 0.02,
                        ),
                        Image.network(
                          'https://raw.githubusercontent.com/iogroupteam/my_wallet/master/assets/io.png',
                          height: myHeight * 0.03,
                        )
                      ],
                    ),
                    SizedBox(
                      height: myHeight * 0.005,
                    ),
                    Image.network(
                      'https://raw.githubusercontent.com/iogroupteam/my_wallet/master/assets/loading1.gif',
                      height: myHeight * 0.015,
                      color: Colors.white,
                    )
                  ],
                ),
                // ElevatedButton(onPressed: null, child: const Text("Aesthetic"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Future<void> aestheticDialog() async {
  //  AestheticDialogs.showDialog(
  //      dialogType: DialogType.SUCCESS,
  //      dialogStyle: DialogStyle.EMOJI,
  //      dialogGravity: DialogGravity.CENTER,
  //      dialogAnimation: DialogAnimation.SWIPE_LEFT,
  //      duration: 4000,
  //      title: "Aesthetic",
  //      message: "Title",
  //      cancelable: true,
  //      darkMode: false);
  //}
}
