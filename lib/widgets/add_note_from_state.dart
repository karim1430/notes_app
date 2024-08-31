import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:intl/message_format.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteFromState extends StatefulWidget {
  const AddNoteFromState({super.key});

  @override
  State<AddNoteFromState> createState() => _AddNoteFromStateState();
}

class _AddNoteFromStateState extends State<AddNoteFromState> {
  GlobalKey<FormState> fromKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: 'Tilte',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: "Content",
            maxLine: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          ColorsListView(),
          const SizedBox(
            height: 40,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomBotton(
                islouding: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (fromKey.currentState!.validate()) {
                    fromKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formatToCurrentDate =
                        '${currentDate.day} :${currentDate.month} :${currentDate.year} ';
                    // DateFormat('dd-mm-yyyy').format(currentDate);
                    // DateFormat.yMd().format(currentDate);

                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formatToCurrentDate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
