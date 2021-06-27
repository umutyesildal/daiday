import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage/local_storage.dart';
import 'screens/bloc/general_bloc.dart';
import 'screens/navigator/navigator.dart';
import 'service_locator.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: sl.allReady(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BlocProvider<GeneralBloc>(
              create: (context) =>
                  GeneralBloc(daylogRepository: sl.get<DaylogStorage>()),
              child: MainNavigator(),
            );
          } else {
            return Container();
          }
        });
  }
}
