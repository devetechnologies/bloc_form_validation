import 'package:bloc_form_validation/bloc/form_validate/form_validate_bloc.dart';
import 'package:bloc_form_validation/form_validate/models/firts_name_model.dart';
import 'package:bloc_form_validation/form_validate/views/home/widgets/first_name_input.dart';
import 'package:bloc_form_validation/form_validate/views/home/widgets/last_name_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../widgets/success_message.dart';
import '../../view.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _emailFocus = FocusNode();
  final _firstNameFocus = FocusNode();
  final _lastNameFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstNameFocus.addListener(() {
      if (_firstNameFocus.hasFocus) {
        context.read<FormValidateBloc>().add(FirstNameUnfocused());
        //FocusScope.of(context).requestFocus(_lastNameFocus);
      }
      if (_lastNameFocus.hasFocus) {
        context.read<FormValidateBloc>().add(LastNameUnfocused());
        //FocusScope.of(context).requestFocus(_emailFocus);
      }
      if (_emailFocus.hasFocus) {
        context.read<FormValidateBloc>().add(EmailUnfocused());
        //FocusScope.of(context).requestFocus(_firstNameFocus);
      }
    });
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _firstNameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormValidateBloc, FormValidateState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          showDialog<void>(
            context: context,
            builder: (_) => const SuccessMessage(),
          );
        } else {
          //print('Y entoncesss');
        }
        // TODO: implement listener
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            FirstNameInput(focusNode: _firstNameFocus),
            LastnameInput(focusNode: _lastNameFocus),
            EmailInput(focusNode: _emailFocus),
            const SizedBox(
              height: 25,
            ),
            const SubmitButton()
          ],
        ),
      ),
    );
  }
}
