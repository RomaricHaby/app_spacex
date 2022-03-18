import 'package:app_spacex/core/manager/launches_manager.dart';
import 'package:app_spacex/ui/launch_detail.dart';
import 'package:app_spacex/ui/pages/launches_latest_list_page.dart';
import 'package:app_spacex/ui/pages/launches_upcoming_list_page.dart';
import 'package:app_spacex/ui/pages/map_page.dart';
import 'package:app_spacex/ui/pages/space_x_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the HomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          actions: [
            IconButton(onPressed: () async {
              await Navigator.of(context).pushNamed(SpaceXPageState.route, arguments: SpaceXPageArguments() );
            }, icon: const Icon(Icons.info))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                label: "Up coming launch",
                icon: Icon(Icons.list),
                activeIcon: Icon(
                  Icons.list,
                  color: Colors.blue,
                )),
            BottomNavigationBarItem(
                label: "Latest launch",
                icon: Icon(Icons.history_outlined),
                activeIcon: Icon(
                  Icons.history,
                  color: Colors.blue,
                )),
            BottomNavigationBarItem(
                label: "Landpads",
                icon: Icon(Icons.map_outlined),
                activeIcon: Icon(
                  Icons.map,
                  color: Colors.blue,
                )),
            BottomNavigationBarItem(
                label: "Favoris",
                icon: Icon(Icons.favorite_border),
                activeIcon: Icon(
                  Icons.favorite,
                  color: Colors.blue,
                ))

          ],
          currentIndex: _currentIndex,
          onTap: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
            _pageController.animateToPage(_currentIndex,
                duration: kThemeAnimationDuration, curve: Curves.ease);
          },
        ),
        body: FutureBuilder(
          future: LaunchesManager().initData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: const [
                  LaunchesUpcomingListPage(),
                  LaunchesLatestListPage(),
                  MapPage(),
                  LaunchesUpcomingListPage(isFromFavorite: true)
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        )
    );
  }

}