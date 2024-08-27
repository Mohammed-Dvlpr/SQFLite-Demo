import 'package:flutter/material.dart';

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
      body: getListView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
        },
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getListView(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyLarge;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.add),
              ),
              title: Text(
                'Dummy Title',
                style: textStyle,
              ),
              subtitle: Text('Dummy Date'),
              trailing: Icon(Icons.delete),
              onTap: () {
                debugPrint('ListTab');
              },
            ),
          );
        });
  }
}
