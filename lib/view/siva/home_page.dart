import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/material.dart';

class Contact {
  String name;
  String contact;
  Contact({required this.name, required this.contact});
}

class HomePagee extends StatefulWidget {
  const HomePagee({Key? key}) : super(key: key);

  @override
  State<HomePagee> createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePagee> {
  TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  final List<Contact> _contacts = [];

  int selectedIndex = 0;

  _callNumber(String key) async {
    String number = key;
    await FlutterPhoneDirectCaller.callNumber(number.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contacts List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contactController,
              keyboardType: TextInputType.number,
              maxLength: 15,
              decoration: const InputDecoration(
                  hintText: 'Contact Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contactController.text = '';
                          _contacts.add(Contact(name: name, contact: contact));
                        });
                      }

                      //
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contactController.text = '';
                          _contacts[selectedIndex].name = name;
                          _contacts[selectedIndex].contact = contact;
                          selectedIndex = 0;
                        });
                      }
                      //
                    },
                    child: const Text('Update')),
              ],
            ),
            const SizedBox(height: 10),
            _contacts.isEmpty
                ? const Text(
                    'Contact List is Empty...',
                    style: TextStyle(fontSize: 22),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: _contacts.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              index % 2 == 0 ? Colors.deepPurpleAccent : Colors.lightBlue,
          foregroundColor: Colors.white,
          child: Text(
            _contacts[index].name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(_contacts[index].contact)
          ],
        ),
        trailing: SizedBox(
          width: 185,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  nameController.text = _contacts[index].name;
                  contactController.text = _contacts[index].contact;
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: const Icon(Icons.edit),
              ),
              const SizedBox(
                width: 8.5,
              ),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      _contacts.removeAt(index);
                    });
                  }),
                  child: const Icon(Icons.delete)),
              const SizedBox(
                width: 8.5,
              ),
              IconButton(
                  icon: const Icon(
                    Icons.phone,
                  ),
                  onPressed: () {
                    _callNumber(_contacts[index].contact);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
