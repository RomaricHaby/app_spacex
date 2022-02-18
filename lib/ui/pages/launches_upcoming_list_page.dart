

import 'package:app_spacex/core/manager/launches_manager.dart';
import 'package:app_spacex/core/model/launches.dart';
import 'package:app_spacex/ui/components/launches_upcoming_list.dart';
import 'package:flutter/cupertino.dart';

class LaunchesUpcomingListPage extends StatefulWidget{
  final bool isFromFavorite;

  const LaunchesUpcomingListPage({Key? key, this.isFromFavorite = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LaunchesUpcomingListPage();
}

class _LaunchesUpcomingListPage extends State<LaunchesUpcomingListPage> {
  @override
  Widget build(BuildContext context) {
    return LaunchesUpcomingList(
        launches: LaunchesManger().launches
    );
  }
}