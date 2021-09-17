import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late Box<String> friendsBox;

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void iniState() {
    super.initState();
    friendsBox = Hive.box("friends");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive testing'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: friendsBox.listenable(),
            builder: (context, Box<String> frineds, _) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final key = frineds.keys.toList()[index];
                    final value = frineds.get(key);
                    return ListTile(
                      title: Text(value!),
                      subtitle: Text(key),
                    );
                  },
                  separatorBuilder: (_, index) => Divider(),
                  itemCount: frineds.keys.toList().length);
            },
          )),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Card(
                  child: Text('Add New'),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return Dialog(
                          child: Container(
                            padding: EdgeInsets.all(32),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: _idController,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextField(
                                  controller: _nameController,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                InkWell(
                                  child: Card(
                                    child: Text('submit'),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    final key = _idController.text;
                                    final value = _nameController.text;
                                    friendsBox.put(key, value);
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
              InkWell(
                child: Card(
                  child: Text('Update'),
                ),
                onTap: () {},
              ),
              InkWell(
                child: Card(
                  child: Text('Delete'),
                ),
                onTap: () {},
              )
            ],
          )),
        ],
      ),
    );
  }
}
