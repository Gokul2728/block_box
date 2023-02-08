import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Widgets(),
  ));
}

class Widgets extends StatefulWidget {
  const Widgets({super.key});

  @override
  State<Widgets> createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  bool selected = false;
  bool _bool = true;
  bool _isPlay = true;
  double _fontSize = 25;
  Color _color = Colors.pink;
  //double x = 0;
  //double y = 0;
  //double z = 0;
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  final formkey = GlobalKey<FormState>();
  final _items = [];
  void _addItem() {
    _items.insert(0, "AnimatedList ${_items.length + 1}");
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 2));
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(
        index,
        (_, animation) => SizeTransition(
              sizeFactor: animation,
              child: Card(
                color: _color,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    'Deleted',
                    style: TextStyle(fontSize: _fontSize),
                  ),
                ),
              ),
            ),
        duration: const Duration(milliseconds: 1000));
    _items.removeAt(index);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //AboutDialog
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => const AboutDialog(
                                  applicationIcon:
                                      Icon(Icons.radio_button_checked_outlined),
                                  applicationLegalese: 'Lagalese',
                                  applicationName: 'Button',
                                  applicationVersion: 'version 1.0.0',
                                  children: [
                                    Text("This Message created by ...."),
                                  ],
                                ));
                      },
                      child: const Text("Show About Dialog Box"),
                    ),
                    //Alert Dialog
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    icon: const Icon(
                                      Icons.warning_rounded,
                                      color: Colors.red,
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Done')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Close'))
                                    ],
                                    title: const Text('Alert Dialog'),
                                    content: const Text(
                                        'This message was carefully read'),
                                    contentPadding: const EdgeInsets.all(20),
                                  ));
                        },
                        child: const Text('Alert Dialog'))
                  ],
                ),
                const AboutListTile(
                  dense: false,

                  icon: Icon(Icons.info),
                  applicationIcon: Icon(Icons.directions_boat_filled_outlined),
                  applicationLegalese: 'Bottle',
                  applicationName: 'Birthday Cake',
                  applicationVersion: 'version 2.0',
                  aboutBoxChildren: [Text("This text was followed by ksrtc")],
                  //child: Icon(Icons.follow_the_signs_rounded),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Absorb Pointer
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 140,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey),
                              onPressed: () {},
                              child: null),
                        ),
                        SizedBox(
                          height: 140,
                          width: 80,
                          child: AbsorbPointer(
                            absorbing: true,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightGreen),
                                onPressed: () {},
                                child: const Text(
                                  'Absorb Pointer',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        )
                      ],
                    ),
                    //Align
                    Column(
                      children: [
                        Container(
                          height: 140,
                          width: 100,
                          color: Colors.blueGrey.shade100,
                          child: const Align(
                            alignment: Alignment.bottomLeft,
                            child: Icon(Icons.whatshot_sharp, size: 40),
                          ),
                        ),
                        const Text("Align")
                      ],
                    ),
                    //Animated Align
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = !selected;
                            });
                          },
                          child: Container(
                              height: 120,
                              width: 100,
                              color: Colors.amber.shade100,
                              child: AnimatedAlign(
                                curve: Curves.linear,
                                alignment: selected
                                    ? Alignment.topLeft
                                    : Alignment.bottomRight,
                                duration: const Duration(seconds: 1),
                                child: const Icon(
                                  Icons.toys_rounded,
                                  color: Colors.red,
                                ),
                              )),
                        ),
                        const Text("AnimatedAlign")
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 70,
                      width: 150,
                      color: Colors.grey.shade200,
                      child: AnimatedBuilder(
                          builder: (context, child) => Transform.rotate(
                                angle: _controller.value * 2.0 * math.pi,
                                child: child,
                              ),
                          animation: _controller,
                          child: const Icon(
                            size: 40,
                            Icons.cruelty_free_outlined,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 70,
                      width: 150,
                      color: Colors.grey.shade200,
                      child: AnimatedBuilder(
                          builder: (context, child) => Transform.scale(
                                scale: _controller.value * 1.0 * math.pi,
                                child: child,
                              ),
                          animation: _controller,
                          child: const Icon(
                            Icons.cruelty_free_outlined,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text("AnimationBuilders")
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 200,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                          });
                        },
                        child: AnimatedContainer(
                          //transform: Matrix4(
                          //    1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0)
                          //  ..rotateX(x)
                          //  ..rotateY(y)
                          //  ..rotateZ(z),
                          curve: Curves.fastOutSlowIn,
                          color: selected
                              ? Colors.green.shade200
                              : Colors.red.shade200,
                          height: selected ? 100 : 60,
                          width: selected ? 250 : 120,
                          alignment:
                              selected ? Alignment.center : Alignment.topRight,
                          duration: const Duration(seconds: 2),
                          child: const Icon(
                            Icons.emoji_emotions_sharp,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _bool = !_bool;
                              });
                            },
                            child: const Text(
                              'AnimatedCrossFade',
                              style: TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.underline),
                            )),
                        SizedBox(
                          height: 170,
                          child: AnimatedCrossFade(
                              firstChild: Image.network(
                                'https://images.pexels.com/photos/842654/pexels-photo-842654.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                width: 300,
                                fit: BoxFit.fill,
                              ),
                              secondChild: Image.network(
                                'https://images.pexels.com/photos/39693/motorcycle-racer-racing-race-speed-39693.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                width: 300,
                                fit: BoxFit.fill,
                              ),
                              crossFadeState: _bool
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: const Duration(seconds: 4),
                              firstCurve: Curves.linear),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_isPlay == false) {
                          _controller.forward();
                          _isPlay = true;
                        } else {
                          _controller.reverse();
                          _isPlay = false;
                        }
                      },
                      //AnimatedIcon
                      child: AnimatedIcon(
                        icon: AnimatedIcons.add_event,
                        progress: _controller,
                        size: 70,
                      ),
                    ),
                    Column(
                      children: [
                        AnimatedDefaultTextStyle(
                            style: TextStyle(
                                color: _color,
                                fontSize: _fontSize,
                                fontWeight: FontWeight.bold),
                            duration: const Duration(seconds: 1),
                            child: const Text("AnimatedTextStyle")),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _fontSize = _bool ? 50 : 30;
                                _color =
                                    _bool ? Colors.deepOrange : Colors.green;
                                _bool = !_bool;
                              });
                            },
                            child: const Text("Change")),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                IconButton(
                    onPressed: _addItem, icon: const Icon(Icons.add_card)),
                Container(
                  color: Colors.grey.shade300,
                  height: 300,
                  width: double.infinity,
                  child: AnimatedList(
                    itemBuilder: (context, index, animation) {
                      return SizeTransition(
                        sizeFactor: animation,
                        key: UniqueKey(),
                        child: Card(
                          margin: const EdgeInsets.all(10),
                          color: _color,
                          child: ListTile(
                            title: Text(
                              _items[index],
                              style: TextStyle(fontSize: _fontSize),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  _removeItem(index);
                                },
                                icon: const Icon(Icons.delete_sweep)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Form(
                  key: formkey,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          CloseButton(
                              color: Colors.red,
                              onPressed: () => showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Wrap(children: [
                                        ListTile(
                                          onTap: () {},
                                          title: const Text('Person'),
                                          leading: const Icon(Icons.person),
                                        ),
                                        ListTile(
                                          onTap: () {},
                                          title: const Text('Windows'),
                                          leading: const Icon(
                                              Icons.view_compact_alt_outlined),
                                        )
                                      ]))),
                          const Text("CloseButton,BottomSheet")
                        ],
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Enter Something",
                            label: Text("Name"),
                            icon: Icon(Icons.person)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Something";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
