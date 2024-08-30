import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});

  final NoteModel note;

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
                note.title,
                style: TextStyle(color: Colors.black, fontSize: 32),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(note.subTitle,
                    style: TextStyle(color: Colors.black.withOpacity(.3))),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchNotesCubit();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('done deleted note')));
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, bottom: 20),
              child: Text(
                note.date,
                style: TextStyle(color: Colors.black.withOpacity(.3)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
