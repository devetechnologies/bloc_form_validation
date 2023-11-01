import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/form_validate/form_validate_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isValid =
        context.select((FormValidateBloc bloc) => bloc.state.isValid);
    return ElevatedButton(
      onPressed: isValid
          ? () => context.read<FormValidateBloc>().add(FormSubmitted())
          : null,
      child: const Text('Submit'),
    );
  }
}
