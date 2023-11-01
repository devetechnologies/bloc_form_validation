import 'package:bloc_form_validation/bloc/form_validate/form_validate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FormValidateBloc(),
        child: const Form(child: FormWidget()));
  }
}
