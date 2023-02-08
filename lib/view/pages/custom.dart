import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewPage(),
    );
  }
}

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  double addingElement = 10;
  void _pressed() {
    setState(() {
      addingElement++;
    });
  }

  void _removeItem(int index) {
    setState(() {
      _key.currentState!.removeItem(
          index,
          (context, animation) => Card(
                child: SnackBar(
                    content: const Text("Deleted"),
                    backgroundColor: Colors.red.withOpacity(0.2)),
              ));
    });
  }

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Samples'),
        leading: const Icon(Icons.sports_gymnastics_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: const [
                  Positioned(
                    // top: 0,
                    // left: 100,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Text('24'),
                    ), //CircularAvatar
                  ), //Positioned
                  Icon(Icons.message, size: 40)
                ],
              ),
              Container(
                alignment: Alignment.topRight,
                color: Colors.grey,
                height: 200,
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 2 / 1,
                  child: Container(
                    // height: 100,
                    // width: 100,
                    color: Colors.purple,
                  ),
                ),
              ),
              Wrap(
                direction: Axis.vertical,
                //  verticalDirection: VerticalDirection.down,
                textDirection: TextDirection.ltr,
                runSpacing: 20,
                alignment: WrapAlignment.spaceEvenly,
                spacing: 40,
                // runAlignment: WrapAlignment.center,
                children: [
                  //   Container(
                  //     height: 100,
                  //     width: 100,
                  //     color: Colors.grey,
                  //   ),
                  //   Container(
                  //     height: 100,
                  //     width: 100,
                  //     color: Colors.red,
                  //   ),
                  //   Container(
                  //     height: 100,
                  //     width: 100,
                  //     color: Colors.deepOrange,
                  //   ),

                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                  ),
                  RichText(
                      selectionColor: Colors.red,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.end,
                      textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: true,
                      ),
                      //textScaleFactor: 5,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      text: const TextSpan(text: "I am there ", children: [
                        TextSpan(
                            text: "Inside",
                            style: TextStyle(fontWeight: FontWeight.w900)),
                        TextSpan(
                            text: " OR ",
                            style: TextStyle(color: Colors.green
                                //fontWeight: FontWeight.w300,
                                )),
                        TextSpan(
                            text: "Outside",
                            style: TextStyle(
                                textBaseline: TextBaseline.ideographic,
                                decorationStyle: TextDecorationStyle.double,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w100)),
                      ])),
                  Text.rich(
                      // softWrap: true,
                      TextSpan(
                          //  spellOut: false,

                          children: [
                        const TextSpan(text: "ShowSnackbar  "),
                        WidgetSpan(
                            //any widgets add for widgetspan
                            alignment: PlaceholderAlignment.middle,
                            baseline: TextBaseline.alphabetic,
                            child: IconButton(
                              icon: const Icon(Icons.smoke_free),
                              onPressed: () {},
                            )),
                        TextSpan(
                            text: "Hamer",
                            style: const TextStyle(color: Colors.red),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      Text("Succesfully Showed".toUpperCase()),
                                  backgroundColor:
                                      Colors.green.withOpacity(0.9),
                                  duration: const Duration(seconds: 6),
                                  elevation: 10,
                                  padding: const EdgeInsets.all(16),
                                  action: SnackBarAction(
                                      onPressed: () {},
                                      textColor: Colors.white,
                                      label: "Cancel"),
                                ));
                              }),
                      ])),
                  Text(
                    'Add Items$addingElement',
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: ClipOval(
                      // clipBehavior: Clip.antiAlias,
                      // clipper: Clipped(),
                      child: Image.network(
                        "https://images.pexels.com/photos/1955134/pexels-photo-1955134.jpeg?auto=compress&cs=tinysrgb&w=300",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // const Spacer(),
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        "https://images.pexels.com/photos/1955134/pexels-photo-1955134.jpeg?auto=compress&cs=tinysrgb&w=300",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: Material(
                      child: Ink.image(
                          repeat: ImageRepeat.repeat,
                          image: const NetworkImage(
                              'https://images.pexels.com/photos/1955134/pexels-photo-1955134.jpeg?auto=compress&cs=tinysrgb&w=300'),
                          fit: BoxFit.cover,
                          width: 300.0,
                          height: 200.0,
                          child: InkWell(
                              customBorder: const BeveledRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  side: BorderSide(
                                      color: Colors.black, width: 2)),
                              splashColor: Colors.blue.withOpacity(0.9),
                              onTap: () {/* ... */},
                              child: const Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'KITTEN',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ))),
                    ),
                  ),
                  GestureDetector(
                    child: FloatingActionButton(
                        onPressed: _pressed,
                        child: const Icon(Icons.sos_rounded)),
                  )
                ],
              ),
              ExpandIcon(
                isExpanded: false,
                color: Colors.white,
                disabledColor: Colors.grey,
                expandedColor: Colors.black,
                //  padding: const EdgeInsets,
                onPressed: (bool value) {
                  setState(() {
                    value = value;
                  });
                },
              ),
              ExpansionTile(
                leading: const Icon(Icons.abc),
                trailing: const Text(";;"),
                //   key: _key,
                title: const Text("ExpansionTile"),
                backgroundColor: Colors.purple.shade50,
                children: [
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.menu),
                      title: const Text("Card1"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeItem,
                      ),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      leading: Icon(Icons.menu),
                      title: Text("Card2"),
                      trailing: Icon(Icons.delete),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      leading: Icon(Icons.menu),
                      title: Text("Card3"),
                      trailing: Icon(Icons.delete),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.pink[50],
    );
  }
}

class Clipped extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCenter(
        center: const Offset(70, 100), height: 100, width: 100);
  }

  @override
  bool shouldReclip(oldClipper) {
    return true;
  }
}
