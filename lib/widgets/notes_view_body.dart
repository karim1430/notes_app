import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/list_view_notes.dart';
import 'package:notes_app/widgets/notes_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16, right: 20),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CustomAppBar(
            title: 'Title',
            icon: Icons.search,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: ListViewNotes()),
        ],
      ),
    );
  }
}
