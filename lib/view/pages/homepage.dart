import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SizedBox(
          height: myHeight,
          width: myWidth,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: myHeight * 0.04, left: myWidth * 0.08),
                child: Row(
                  children: const [
                    Text(
                      'Hi, IO Team',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: myHeight * 0.01, left: myWidth * 0.08),
                child: Row(
                  children: const [
                    Text(
                      'Manage you banking card in IO app',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: myHeight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: myWidth * 0.08),
                child: Container(
                  height: myHeight * 0.2,
                  decoration: BoxDecoration(
                      color: const Color(0xff7847FC),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: myWidth * 0.05,
                            vertical: myHeight * 0.015),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              'https://raw.githubusercontent.com/iogroupteam/my_wallet/master/assets/1.png',
                              height: myHeight * 0.04,
                              color: Colors.white,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: myWidth * 0.02,
                                  vertical: myHeight * 0.005),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white.withOpacity(0.5)),
                              child: const Center(
                                  child: Text(
                                '02/04',
                                style: TextStyle(color: Colors.white),
                              )),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: myHeight * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myText('6104'),
                            myText('3389'),
                            myText('3256'),
                            myText('8955'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: myWidth * 0.05,
                            vertical: myHeight * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Emily Smith',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              'CVV2: 452',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: myWidth * 0.08, vertical: myHeight * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myItemContiner('Card balance', '100.000'),
                    myItemContiner('Removable', '90.000'),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: myHeight * 0.02, left: myWidth * 0.08),
                child: Row(
                  children: const [
                    Text(
                      'History',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: myHeight * 0.02,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: myHeight * 0.01),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: myWidth * 0.06,
                              vertical: myHeight * 0.02),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white),
                          child: Image.network(
                            'https://raw.githubusercontent.com/iogroupteam/my_wallet/master/assets/2.png',
                            height: myHeight * 0.05,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Withdraw Money',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: myHeight * 0.01),
                          const Text(
                            'Yesterday',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      const Text(
                        '\$ 100.000',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff7847FC),
                        ),
                      )
                    ],
                  );
                },
              ))
            ],
          )),
    ));
  }

  Widget myText(String txt) {
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: myWidth * 0.03),
      child: Text(
        txt,
        style: const TextStyle(
            fontSize: 27, color: Colors.white, fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget myItemContiner(String title, String price) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
          top: myHeight * 0.02,
          left: myWidth * 0.05,
          right: myWidth * 0.1,
          bottom: myHeight * 0.02),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: myHeight * 0.01,
          ),
          Row(
            children: [
              const Text(
                '\$',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                price,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
