

import 'package:app_spacex/core/manager/launches_manager.dart';
import 'package:app_spacex/core/model/launch.dart';
import 'package:app_spacex/ui/components/launches_upcoming_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class LaunchesUpcomingListPage extends StatefulWidget{
  final bool isFromFavorite;

  const LaunchesUpcomingListPage({Key? key, this.isFromFavorite = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LaunchesUpcomingListPage();
}

class _LaunchesUpcomingListPage extends State<LaunchesUpcomingListPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          SizedBox(
            child: Column(
              children: [
                const Text("Temps avant lancement :"),
                CountdownTimer(endTime: getTimeLaunch(), textStyle: const TextStyle(fontSize: 25))
              ]
            ),
          ),


          LaunchesUpcomingList(
           launches: widget.isFromFavorite ?
           LaunchesManager().favoriteLaunches :
           LaunchesManager().launchesUpcoming,
           onFavoriteChanged: (Launch launch, bool shouldToggle) async {
             if (shouldToggle) {
               await LaunchesManager().toggleFavorite(launch);
             }
             setState(() {});
           })
        ]
    );
  }

  int getTimeLaunch(){
    if(LaunchesManager().launchesUpcoming.first.dateLocal != null){
      int? time = LaunchesManager().launchesUpcoming.first.dateLocal?.millisecondsSinceEpoch;
      return time! + 1000 *30;
    }
    return 0;
  }
}
