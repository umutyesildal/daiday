import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralBloc, GeneralState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Appearance',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dark Mode',
                        style: TextStyle(fontSize: 20),
                      ),
                      CupertinoSwitch(
                        value: state.theme!,
                        onChanged: (value) {
                          BlocProvider.of<GeneralBloc>(context)
                              .add(ChangeThemeEvent(theme: value));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: SizedBox(),
              )
            ],
          ),
        ),
      );
    });
  }
}
