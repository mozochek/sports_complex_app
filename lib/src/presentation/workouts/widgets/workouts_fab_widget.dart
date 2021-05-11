import 'package:flutter/material.dart';

class WorkoutsFab extends StatelessWidget {
  const WorkoutsFab({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap
          /*?? () async {
        // TODO: old navigation
        await Navigator.of(context).push<void>(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => Provider<IWorkoutFormBloc>(
              create: (_) => WorkoutFormBloc.forCreating(),
              dispose: (_, bloc) async => bloc.dispose(),
              child: const WorkoutForm(),
            ),
          ),
        );
      }*/,
      child: const Icon(Icons.add),
    );
  }
}
