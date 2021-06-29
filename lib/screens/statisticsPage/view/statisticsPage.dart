import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:daiday/screens/statisticsPage/models/daylogStatisticsEntity.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage/local_storage.dart';

class BarChart extends StatelessWidget {
  _getSeriesData() {
    List<charts.Series<DaylogStatistics, String>> series = [
      charts.Series(
          id: "moodBarChart",
          data: moodList,
          domainFn: (DaylogStatistics series, _) => series.mood, //Moods
          measureFn: (DaylogStatistics series, _) =>
              series.numberOfMood, //number of a mood
          colorFn: (DaylogStatistics series, _) => _getColor(series.mood!))
    ];
    return series;
  }

  List<DaylogStatistics> moodList = [];

  _getMood(List<DaylogHiveEntity> logs) {
    String? currentMood;
    int numberOfMood = 0;
    for (int i = 0; i < logs.length; i++) {
      currentMood = logs[i].mood;
      if ((moodList.any((element) => element.mood == currentMood))) {
        print('contains');
      } else {
        logs.forEach((element) {
          if (element.mood == currentMood) {
            numberOfMood++;
          }
        });
        DaylogStatistics iteration =
            DaylogStatistics(mood: currentMood, numberOfMood: numberOfMood);
        moodList.add(iteration);
      }
      numberOfMood = 0;
    }
    for (int j = 0; j < moodList.length; j++) {
      print(moodList[j].mood! + moodList[j].numberOfMood.toString());
    }
  }

  charts.Color _getColor(String mood) {
    if (mood == 'Happy') {
      return charts.ColorUtil.fromDartColor(Colors.blue);
    } else if (mood == 'Sad') {
      return charts.ColorUtil.fromDartColor(Colors.red);
    } else if (mood == 'Angry') {
      return charts.ColorUtil.fromDartColor(Colors.black);
    } else {
      return charts.ColorUtil.fromDartColor(Colors.deepPurple);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralBloc, GeneralState>(builder: (context, state) {
      _getMood(state.allDaylogs!);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Charts'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(flex: 2, child: SizedBox()),
            Expanded(flex: 2, child: SizedBox()),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Moods of all the time",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: charts.BarChart(
                            _getSeriesData(),
                            animate: true,
                            domainAxis: charts.OrdinalAxisSpec(
                                renderSpec: charts.SmallTickRendererSpec(
                                    labelRotation: 60)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      );
    });
  }
}
