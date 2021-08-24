import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddName extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralBloc, GeneralState>(builder: (context, state) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 4,
                child: Image.asset(
                  'assets/Candidate profile review.png',
                  width: 350,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    'There is only one thing left',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    'Let me know with what name i can call you',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                      hintText: 'Your Name',
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: new BorderSide(
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<GeneralBloc>(context).add(
                        ChangeNameEvent(name: myController.text.toString()));
                  },
                  child: Text('     Send     '),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
