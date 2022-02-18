import 'package:app_spacex/core/model/launches.dart';
import 'package:flutter/material.dart';

import 'components/image_placeholder.dart';

class LaunchDetailArguments {
  Launches launch;

  LaunchDetailArguments({required this.launch});
}


class LaunchDetail extends StatefulWidget {
static const route = "/launchDetail";

final Launches launch;

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
            )
          ],
        ),



      ),
    ),

    );
  }

}