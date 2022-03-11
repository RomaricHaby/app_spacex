import 'package:app_spacex/core/manager/launches_manager.dart';
import 'package:app_spacex/core/model/launch.dart';
import 'package:app_spacex/ui/launch_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'image_placeholder.dart';

class LaunchesUpcomingList extends StatelessWidget{
  final List<Launch> launches;
  final Function(Launch, bool)? onFavoriteChanged;

  const LaunchesUpcomingList({Key? key, required this.launches, this.onFavoriteChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return launches.isNotEmpty ? ListView.builder(
        itemBuilder: (context, position) {
          Launch launch = launches[position];
          return InkWell(
            onTap: () async{
              bool oldFavorite = LaunchesManager().isLaunchFavorite(launch.id!);

              var newFavorite = await Navigator.of(context).pushNamed(LaunchDetail.route,
                  arguments: LaunchDetailArguments(launch: launch));

              if (newFavorite is bool && newFavorite != oldFavorite) {
                onFavoriteChanged?.call(launch, false);
              }

              },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network(
                      launch.links?.patch?.small ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, child, stack) {
                        return const ImagePlaceholder();
                      },
                    )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      launch.name ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),


                    Text("Date de lancement : \n${DateFormat.yMMMEd().format(launch.dateLocal!)}")
                  ],
                ),
                ),
                IconButton(
                  icon: Icon(LaunchesManager().isLaunchFavorite(launch.id!)
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: () {
                    onFavoriteChanged?.call(launch, true);
                  },
                ),
                const SizedBox(width: 16,)
              ],
            )
          );
    },
      itemCount: launches.length,
    ) : const Center(child: Text("Aucun lancements"),);
  }
}