import 'package:flutter/material.dart';
import 'package:sqfl_demo_porject/screens/note_datail.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: getListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('Flotting button Press');
          },
          tooltip: 'Add Note',
          child: const Icon(Icons.add),
        ));
  }

  ListView getListView() {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyLarge;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.add),
              ),
              title: Text('Dummy Title', style: textStyle),
              subtitle: Text('Dummy Date'),
              trailing: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                debugPrint('Ontab');
              },
            ),
          );
        });
  }
}
