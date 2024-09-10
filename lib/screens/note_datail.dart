import 'package:flutter/material.dart';

class NoteDatail extends StatefulWidget {
  final String? appBarTitle;
  const NoteDatail({super.key, this.appBarTitle});

  @override
  State<NoteDatail> createState() => _NoteDatailState(this.appBarTitle);
}

class _NoteDatailState extends State<NoteDatail> {
  String? appBarTitle;
  _NoteDatailState(this.appBarTitle);

  static var _priorrities = ['High', 'Low'];
  TextEditingController titleControler = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle!),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
                  items: _priorrities.map((String dropDownStringItems) {
                    return DropdownMenuItem<String>(
                        value: dropDownStringItems,
                        child: Text(dropDownStringItems));
                  }).toList(),
                  style: textStyle,
                  value: 'Low',
                  onChanged: (valueSelectedbyUser) {
                    setState(() {
                      debugPrint('user selected $valueSelectedbyUser');
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: titleControler,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in title text field');
                },
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: descriptionControler,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in description text field');
                },
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                Theme.of(context).primaryColorDark)),
                        onPressed: () {
                          setState(() {
                            debugPrint('Save Button pressed');
                          });
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            Theme.of(context).primaryColorDark),
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint('Delete button pressed');
                        });
                      },
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
