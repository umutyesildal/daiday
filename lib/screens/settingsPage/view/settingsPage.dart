import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:daiday/screens/settingsPage/view/widgets/darkMode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  static String routeName = 'Settings Page';
  @override
  Widget build(BuildContext context) {
    final generalBloc = BlocProvider.of<GeneralBloc>(context);

    return BlocBuilder<GeneralBloc, GeneralState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Settings'),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.emoji_emotions,
                            size: 70,
                            color: Theme.of(context).dividerColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'GO PREMIUM',
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Theme.of(context).dividerColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Get all the new features!',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: SizedBox(
                              width: double.infinity,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff4D4D4D),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 24,
                            color: Theme.of(context).dividerColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Change Name',
                            style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DividerWithPadding(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<ChangeTheme>(
                            builder: (context) {
                              return BlocProvider.value(
                                value: generalBloc,
                                child: ChangeTheme(),
                              );
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.brush,
                            size: 24,
                            color: Theme.of(context).dividerColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Appearance',
                            style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DividerWithPadding(),
                  /*    Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.accessibility_new,
                            size: 24,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Add Activity (Premium Feature)',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DividerWithPadding(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.mood,
                            size: 24,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Add Mood (Premium Feature)',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DividerWithPadding(), */
                  /*   Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.brush,
                        size: 24,
                        color: Color(0xff4D4D4D),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Görünüm',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff4D4D4D),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DividerWithPadding(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.language,
                        size: 24,
                        color: Color(0xff4D4D4D),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Dil',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff4D4D4D),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DividerWithPadding(),
              */
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// For now its only for Notifications.
class SettingsTextRow extends StatelessWidget {
  const SettingsTextRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40, top: 12, bottom: 12),
      child: Row(
        children: [
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          SizedBox(
            width: 30,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Notifications',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class DividerWithPadding extends StatelessWidget {
  const DividerWithPadding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 25.0),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }
}

class UsernameText extends StatelessWidget {
  const UsernameText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SpaceBetweenWidgets extends StatelessWidget {
  const SpaceBetweenWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
    );
  }
}
