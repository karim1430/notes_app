import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_list_view.dart';

import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edit_color_to_list_view.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.title;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchNotesCubit();
              Navigator.pop(context);
            }, /////////////////////////////////////////
            title: 'Edit note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: 'Title',
            onChanged: (data) {
              title = data;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: 'Content',
            maxLine: 5,
            onChanged: (data) {
              content = data;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          EditColorToListView(
            note: widget.note,
          )
        ],
      ),
    );
  }
}
