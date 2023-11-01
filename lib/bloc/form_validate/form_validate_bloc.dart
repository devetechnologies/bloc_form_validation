import 'package:bloc/bloc.dart';
import 'package:bloc_form_validation/form_validate/models/firts_name_model.dart';
import 'package:bloc_form_validation/form_validate/models/last_name_model.dart';
import 'package:bloc_form_validation/form_validate/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'form_validate_event.dart';
part 'form_validate_state.dart';

class FormValidateBloc extends Bloc<FormValidateEvent, FormValidateState> {
  FormValidateBloc() : super(const FormValidateState()) {
    on<FirstNameUnfocused>(_onFirstNameUnfocused);
    on<FirstNameChanged>(_onFirstNameChanged);

    on<LastNameUnfocused>(_onLastNameUnfocused);
    on<LastNameChanged>(_onLastNameChanged);

    on<EmailChanged>(_onEmailChanged);
    on<EmailUnfocused>(_onEmailUnfocused);

    //on<FormSubmitted>(_onFormSubmitted);
  }

  void _onFirstNameUnfocused(
      FirstNameUnfocused event, Emitter<FormValidateState> emit) {
    final firstName = FirstName.dirty(state.firstName.value);
    emit(state.formValidateStateCopyWith(
        firstName: firstName,
        isValid: Formz.validate([firstName, state.lastName, state.email])));
  }

  void _onFirstNameChanged(
      FirstNameChanged event, Emitter<FormValidateState> emit) {
    final firstName = FirstName.dirty(event.firstName);
    emit(
      state.formValidateStateCopyWith(
        firstName:
            firstName.isValid ? firstName : FirstName.pure(event.firstName),
        isValid: Formz.validate([firstName, state.lastName, state.email]),
      ),
    );
  }

  void _onLastNameUnfocused(
      LastNameUnfocused event, Emitter<FormValidateState> emit) {
    final lastName = LastName.dirty(
      state.lastName.value,
    );
    emit(state.formValidateStateCopyWith(
        lastName: lastName,
        isValid: Formz.validate([state.lastName, lastName, state.email])));
  }

  void _onLastNameChanged(
      LastNameChanged event, Emitter<FormValidateState> emit) {
    final lastname = LastName.dirty(event.lastName);
    emit(
      state.formValidateStateCopyWith(
        lastName: lastname.isValid ? lastname : LastName.pure(event.lastName),
        isValid: Formz.validate([state.firstName, lastname, state.email]),
      ),
    );
  }

  void _onEmailChanged(EmailChanged event, Emitter<FormValidateState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.formValidateStateCopyWith(
        email: email.isValid ? email : Email.pure(event.email),
        isValid: Formz.validate([email, state.firstName, state.lastName]),
      ),
    );
  }

  void _onEmailUnfocused(
      EmailUnfocused event, Emitter<FormValidateState> emit) {
    final email = Email.dirty(state.email.value);
    emit(
      state.formValidateStateCopyWith(
        email: email,
        isValid: Formz.validate([email, state.firstName, state.lastName]),
      ),
    );
  }

  /*Future<void> _onFormSubmitted(
    FormSubmitted event,
    Emitter<FormValidateState> emit,
  ) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    //final fisrtName = FirstName.dirty(state.firstName.value);
    emit(
      state.formValidateStateCopyWith(
        email: email,
        password: password,
        //firstName: fisrtName,
        isValid: Formz.validate([email, password]),
      ),
    );
    if (state.isValid) {
      emit(state.formValidateStateCopyWith(
          status: FormzSubmissionStatus.inProgress));
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(state.formValidateStateCopyWith(
          status: FormzSubmissionStatus.success));
    }
  }*/
}
