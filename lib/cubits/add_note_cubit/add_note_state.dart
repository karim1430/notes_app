part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteLoading extends AddNoteState {}

final class AddNoteSuccess extends AddNoteState {}

final class AddNotefailer extends AddNoteState {}

final class AddNote extends AddNoteState {
  final String errMessage;

  AddNote({required this.errMessage});
}
