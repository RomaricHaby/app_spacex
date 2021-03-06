import 'package:app_spacex/core/model/launch.dart';
import 'package:app_spacex/ui/home.dart';
import 'package:app_spacex/ui/launch_detail.dart';
import 'package:app_spacex/ui/pages/space_x_page.dart';
import 'package:flutter/material.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space X',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        var arguments = settings.arguments;
        switch (settings.name) {
          case LaunchDetail.route:
            if (arguments != null && arguments is LaunchDetailArguments) {
              Launch launch = arguments.launch;
              return MaterialPageRoute(builder: (_) => LaunchDetail(launch));
            } else {
              throw Exception(
                  "Cette route doit avoir un objet SpotDetailArgument en argument");
            }
          case SpaceXPageState.route :
            if (arguments != null && arguments is SpaceXPageArguments) {
              return MaterialPageRoute(builder: (_) => const SpaceXPage());
            } else {
              throw Exception(
                  "Cette route doit avoir un objet SpotDetailArgument en argument");
            }
          default:
            return unknownRoute();
        }
      },
      home: const HomePage(title: 'Space X'),
    );
  }

  MaterialPageRoute unknownRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text("Route inconnue")),
        ));
  }
}