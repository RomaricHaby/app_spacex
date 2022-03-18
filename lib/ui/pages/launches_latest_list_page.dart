


import 'package:flutter/cupertino.dart';

import '../../core/manager/launches_manager.dart';
import '../../core/model/launch.dart';
import '../components/launches_upcoming_list.dart';

class LaunchesLatestListPage extends StatefulWidget{
  final bool isFromFavorite;

  const LaunchesLatestListPage({Key? key, this.isFromFavorite = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LaunchesLatestListPage();
}

class _LaunchesLatestListPage extends State<LaunchesLatestListPage> {
  @override
  Widget build(BuildContext context) {
    return LaunchesUpcomingList(
        launches: LaunchesManager().launchesLatest,
        onFavoriteChanged:(Launch launch, bool shouldToggle) async{
          if (shouldToggle) {
            await LaunchesManager().toggleFavorite(launch);
          }
          setState(() {});
        }
    );
  }
}