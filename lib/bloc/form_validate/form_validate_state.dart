part of 'form_validate_bloc.dart';

final class FormValidateState extends Equatable {
  const FormValidateState(
      {this.email = const Email.pure(),
      this.firstName = const FirstName.pure(),
      this.lastName = const LastName.pure(),
      this.isValid = false,
      this.status = FormzSubmissionStatus.initial});

  final Email email;
  final FirstName firstName;
  final LastName lastName;
  final bool isValid;
  final FormzSubmissionStatus status;

  FormValidateState formValidateStateCopyWith({
    Email? email,
    FirstName? firstName,
    LastName? lastName,
    bool? isValid,
    FormzSubmissionStatus? status,
  }) {
    return FormValidateState(
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        isValid: isValid ?? this.isValid,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [email, status, firstName, lastName];
}

//final class FormValidateInitial extends FormValidateState {}
