import 'package:flutter/material.dart';
import 'package:flutter_app/features/capitilize/presentation/widgets/capitilize_form.widget.dart';
import 'package:flutter_app/features/capitilize/presentation/widgets/capitilize_response.widget.dart';

class CapitilizeScreen extends StatelessWidget {
  const CapitilizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              30,
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              CapitilizeFormWidget(),
              CapitilizeResponseWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
