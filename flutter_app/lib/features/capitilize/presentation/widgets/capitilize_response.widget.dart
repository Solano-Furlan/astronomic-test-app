import 'package:flutter/material.dart';
import 'package:flutter_app/features/capitilize/state/capitilize_cubit/capitilize.state.dart';
import 'package:flutter_app/features/capitilize/state/capitilize_cubit/capitilize.cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CapitilizeResponseWidget extends StatelessWidget {
  const CapitilizeResponseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CapitilizeCubit, CapitilizeState>(
      builder: (context, state) {
        if (state is CapitilizeInitialState ||
            state is CapitilizeLoadingState) {
          return const SizedBox();
        }
        if (state is CapitilizeLoadedState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Capitilized Text:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                state.capitilized.capitilizedText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        }
        return const SizedBox(
          width: 300,
          child: Text(
            'Failed to capitilize, please check if the API is running locally on http://localhost:3000. If it\'s not running navigate to astronomic_test_app/nest-api and run => npm run start.',
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
