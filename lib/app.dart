import 'package:daiday/constants.dart';
import 'package:daiday/screens/navigator/onBoarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage/local_storage.dart';
import 'screens/bloc/general_bloc.dart';
import 'screens/navigator/navigator.dart';
import 'service_locator.dart';

// This app function is used to register bloc and getting the DaylogStorage package.
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
                child: MainApp());
          } else {
            return Container();
          }
        });
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future? getData() {
    BlocProvider.of<GeneralBloc>(context).add(GetNameEvent());
    BlocProvider.of<GeneralBloc>(context).add(GetThemeEvent());
    BlocProvider.of<GeneralBloc>(context).add(GetDaylogsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralBloc, GeneralState>(
      builder: (context, state) {
        if (state.isDaylogs == false) {
          return SizedBox();
        } else {
          return MaterialApp(
            theme: state.theme! ? darkTheme : lightTheme,
            home: state.name == 'first' ? OnBoarding() : MainNavigator(),
          );
        }
      },
    );
  }
}
