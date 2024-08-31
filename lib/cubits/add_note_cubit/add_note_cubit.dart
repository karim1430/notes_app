import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/constant.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = Color(0xff8747);
  addNote(NoteModel note) //  this method store in database
  {
    note.color = color.value;
    try {
      emit(AddNoteLoading());
      var notesBox = Hive.box<NoteModel>(kNoteBox);
      notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNotefailer(errMessage: e.toString()));
    }
  }
}
