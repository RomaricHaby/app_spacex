import 'package:app_spacex/core/model/launch.dart';
import 'package:flutter/material.dart';

import 'components/image_placeholder.dart';

class LaunchDetailArguments {
  Launch launch;

  LaunchDetailArguments({required this.launch});
}


class LaunchDetail extends StatefulWidget {
static const route = "/launchDetail";

final Launch launch;

const LaunchDetail(this.launch, {Key? key}) : super(key: key);
@override
State<StatefulWidget> createState() => _LaunchDetail();
}

class _LaunchDetail extends State<LaunchDetail> {


  @override
  Widget build(BuildContext context ) {
    return WillPopScope(onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
    child: Scaffold(
      appBar: AppBar(
        title: Text(widget.launch.name ?? ''),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: PageView.builder(
                      itemBuilder: (context, position) {
                        return Image.network(
                          widget.launch.links?.patch?.large ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, child, stack) {
                            return const ImagePlaceholder();
                          },
                        );
                      },
                  )
                  ),
                )],
            ),

            const SizedBox(
              height: 10,
            ),

       Center(

              child: Row(children: [
                  const Icon(
                    Icons.rocket,
                    color: Colors.blueAccent,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  Text(" ${widget.launch.rocket}", style: const TextStyle(fontSize: 10 ))
                ],)
      ),

            const SizedBox(
              height: 15,
            ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Description",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(widget.launch.details ?? "Pas de description")
          ],
        ),
          ],
        ),
      ),
    ),
    );
  }
}