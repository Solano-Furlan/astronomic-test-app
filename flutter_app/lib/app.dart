import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/capitilize/data/capitilize.repository.dart';
import 'package:flutter_app/features/capitilize/presentation/screens/capitilize.screen.dart';
import 'package:flutter_app/features/capitilize/state/capitilize_cubit/capitilize.cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CapitilizeCubit(
            capitilizeRepository: CapitilizeRepository(
              dio: Dio(),
            ),
          ),
        ),
      ],
      child: const MaterialApp(
        home: CapitilizeScreen(),
      ),
    );
  }
}
