import 'package:flutter/material.dart';

enum SampleItem { item1, item2, item3, item4 }

List<Widget> phones = [
  const Text("Redmi"),
  const Text("Apple"),
  const Text("Samsung"),
];
List<Widget> days = [
  const Text("Sunday"),
  const Text("Monday"),
  const Text("Wednesday"),
];
List<Widget> icon = [
  const Icon(Icons.phone_android_outlined),
  const Icon(Icons.settings_system_daydream_rounded),
  const Icon(Icons.mood_rounded)
];
List<String> list = <String>[
  "DropdownButton1",
  "DropdownButton2",
  "DropdownButton3",
  "DropdownButton4"
];
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  SampleItem? selectedMenu;
  String dropdownValue = list.last;
  final List<bool> _selectedphones = <bool>[true, false, false];
  final List<bool> _selectedays = <bool>[false, false, true];
  final List<bool> _selectedicons = <bool>[false, true, false];
  bool vertical = false;
  @override
  Widget build(BuildContext context) {
    Color getcolor(Set<MaterialState> states) {
      Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    final formkey = GlobalKey<FormState>();
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(),
        drawer: ListView(padding: EdgeInsets.zero, children: const [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Center(child: Text("Drawer Header"))),
          Expanded(
            child: ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          )
        ]),
        body: SizedBox(
          height: myHeight,
          width: myWidth,
          child: Column(
            children: [
              Form(
                key: formkey,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
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
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
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
                          }
                        },
                        style: OutlinedButton.styleFrom(
                            side:
                                const BorderSide(width: 1, color: Colors.black),
                            foregroundColor: Colors.black,
                            minimumSize: const Size(400, 50),
                            backgroundColor: Colors.green.shade300),
                        child: const Text("Enter"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
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
                          PopupMenuButton<SampleItem>(
                            initialValue: selectedMenu,
                            onSelected: (SampleItem item) {
                              setState(() {
                                selectedMenu = item;
                              });
                            },
                            itemBuilder: (context) =>
                                <PopupMenuEntry<SampleItem>>[
                              const PopupMenuItem<SampleItem>(
                                  value: SampleItem.item1,
                                  child: Text("Item 1")),
                              const PopupMenuItem<SampleItem>(
                                  value: SampleItem.item2,
                                  child: Text("Item 2")),
                              const PopupMenuItem<SampleItem>(
                                  value: SampleItem.item3,
                                  child: Text("Item 3"))
                            ],
                          ),
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getcolor),
                            value: vertical,
                            onChanged: (bool? value) {
                              setState(() {
                                vertical = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ToggleButtons(
                isSelected: _selectedphones,
                borderRadius: BorderRadius.circular(16),
                selectedBorderColor: Colors.blue[700],
                selectedColor: Colors.white,
                fillColor: Colors.blue[200],
                color: Colors.blue[400],
                constraints: const BoxConstraints(minWidth: 100, minHeight: 45),
                onPressed: (index) {
                  setState(() {
                    for (int i = 0; i < _selectedphones.length; i++) {
                      _selectedphones[i] = i == index;
                    }
                  });
                },
                children: phones,
              ),
              const SizedBox(
                height: 15,
              ),
              ToggleButtons(
                isSelected: _selectedicons,
                borderRadius: BorderRadius.circular(16),
                selectedBorderColor: Colors.red[700],
                selectedColor: Colors.white,
                fillColor: Colors.red[200],
                color: Colors.red[400],
                constraints: const BoxConstraints(minWidth: 100, minHeight: 45),
                onPressed: (index) {
                  setState(() {
                    for (int i = 0; i < _selectedicons.length; i++) {
                      _selectedicons[i] = i == index;
                    }
                  });
                },
                children: icon,
              ),
              const SizedBox(
                height: 15,
              ),
              ToggleButtons(
                isSelected: _selectedays,
                borderRadius: BorderRadius.circular(16),
                selectedBorderColor: Colors.purple[700],
                selectedColor: Colors.white,
                fillColor: Colors.purple[200],
                color: Colors.purple[400],
                constraints: const BoxConstraints(minWidth: 100, minHeight: 45),
                onPressed: (index) {
                  setState(() {
                    _selectedays[index] = !_selectedays[index];
                  });
                },
                children: days,
              ),
              const SizedBox(
                height: 15,
              ),
              RawMaterialButton(
                shape: const CircleBorder(),
                fillColor: Colors.amber,
                constraints: BoxConstraints.tight(const Size(36, 36)),
                onPressed: () {},
                child: const Icon(Icons.remove_moderator),
              ),
              DropdownButton(
                elevation: 7,
                underline: Container(
                  height: 2,
                  color: Colors.purple,
                ),
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down),
                borderRadius: BorderRadius.circular(10),
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
              ),
              MaterialButton(
                onPressed: () {},
                shape: const CircleBorder(),
                color: Colors.pink.shade100,
                clipBehavior: Clip.antiAlias,
                elevation: 5,
                // focusElevation: 10,
                height: 40,
                child: const Icon(Icons.remove_moderator),
              ),
            ],
          ),
        ));
  }
}
