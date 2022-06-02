import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweetcakewarsaw/app/cubit/root_cubit.dart';

class AddAccountPageContent extends StatelessWidget {
  const AddAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Jesteś zalogogwany jako $email'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<RootCubit>().signOut();
              },
              child: const Text('Wyloguj'),
            ),
          ],
        ),
      ),
    );
  }
}
