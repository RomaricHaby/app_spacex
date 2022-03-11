
import 'package:app_spacex/core/manager/launches_manager.dart';
import 'package:app_spacex/core/model/launch.dart';
import 'package:flutter/material.dart';
import '../../core/model/company.dart';
import '../components/image_placeholder.dart';


class SpaceXPageArguments {
  SpaceXPageArguments();
}

class SpaceXPage extends StatefulWidget{
  const SpaceXPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SpaceXPageState();
}

class SpaceXPageState extends State<SpaceXPage>  {
  static const route = "/spaceXDetail";
  late Company company;

  @override
  Widget build(BuildContext context ) {
    return WillPopScope(onWillPop: () async {
      Navigator.pop(context);
      return true;
    },
      child: FutureBuilder<List<dynamic>>(
        future: Future.wait([
            LaunchesManager().getInfoCompany()
          ]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            company = snapshot.data?[0];
            return Scaffold(
              appBar: AppBar(
                title: const Text("SpaceX"),
              ),
                body: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                child:
                                 Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/SpaceX_logo_black.svg/langfr-2880px-SpaceX_logo_black.svg.png",
                                  fit: BoxFit.fitWidth,
                                  errorBuilder: (context, child, stack) {
                                    return const ImagePlaceholder();
                                  },
                                  ))],
                        ),

                              const SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(company.summary ?? "",
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text("Fondateur : ${company.founder}",
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text("Nombre d'employés : ${company.employees}",
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text("Date de création : ${company.founded}",
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              )
                        ])
                )
            );
          }
          else{
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }
      ),
    );
  }
}