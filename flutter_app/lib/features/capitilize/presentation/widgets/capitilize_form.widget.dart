import 'package:flutter/material.dart';
import 'package:flutter_app/features/capitilize/state/capitilize_cubit/capitilize.state.dart';
import 'package:flutter_app/features/capitilize/state/capitilize_cubit/capitilize.cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CapitilizeFormWidget extends StatefulWidget {
  const CapitilizeFormWidget({super.key});

  @override
  State<CapitilizeFormWidget> createState() => _CapitilizeFormWidgetState();
}

class _CapitilizeFormWidgetState extends State<CapitilizeFormWidget> {
  late TextEditingController textEditingController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    textEditingController = TextEditingController(
      text: null,
    );
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CapitilizeCubit, CapitilizeState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 300,
                child: Text(
                  'Enter a text below and a NodeJS NestJS api running locally on http://localhost:3000 will capitilize it for you.',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: textEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a sentence to capitalize.';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              IgnorePointer(
                ignoring: state is CapitilizeLoadingState,
                child: ElevatedButton(
                  onPressed: _capitilize,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: state is CapitilizeLoadingState
                        ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Capitilize'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _capitilize() async {
    if (_formKey.currentState?.validate() == true) {
      await context.read<CapitilizeCubit>().getCapitilizedText(
            text: textEditingController.text,
          );
    }
  }
}
