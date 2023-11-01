import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/form_validate/form_validate_bloc.dart';

class LastnameInput extends StatelessWidget {
  const LastnameInput({required this.focusNode, super.key});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidateBloc, FormValidateState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.firstName.value,
          focusNode: focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.person),
            helperText: '''Please Complete Lastname''',
            helperMaxLines: 2,
            labelText: 'Last Name',
            errorMaxLines: 2,
            errorText: state.firstName.displayError != null
                ? '''Last Name is required'''
                : null,
          ),
          obscureText: false,
          onChanged: (value) {
            context
                .read<FormValidateBloc>()
                .add(LastNameChanged(lastName: value));
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
