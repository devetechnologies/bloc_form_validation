part of 'form_validate_bloc.dart';

sealed class FormValidateEvent extends Equatable {
  const FormValidateEvent();

  @override
  List<Object> get props => [];
}

final class FirstNameChanged extends FormValidateEvent {
  final String firstName;

  const FirstNameChanged({required this.firstName});

  @override
  List<Object> get props => [firstName];
}

final class FirstNameUnfocused extends FormValidateEvent {}

final class LastNameChanged extends FormValidateEvent {
  final String lastName;

  const LastNameChanged({required this.lastName});

  @override
  List<Object> get props => [lastName];
}

final class LastNameUnfocused extends FormValidateEvent {}

final class EmailChanged extends FormValidateEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

final class EmailUnfocused extends FormValidateEvent {}

final class FormSubmitted extends FormValidateEvent {}
