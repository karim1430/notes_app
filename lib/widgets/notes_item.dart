import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNotesView();
        }));
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.amberAccent, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                'Flutter Tips',
                style: TextStyle(color: Colors.black, fontSize: 32),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text('Builed your career with karim salah',
                    style: TextStyle(color: Colors.black.withOpacity(.3))),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, bottom: 20),
              child: Text(
                'May,21.2022',
                style: TextStyle(color: Colors.black.withOpacity(.3)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
