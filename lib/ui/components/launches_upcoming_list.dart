import 'package:app_spacex/core/model/launches.dart';
import 'package:flutter/material.dart';

import 'image_placeholder.dart';

class LaunchesUpcomingList extends StatelessWidget{
  final List<Launches> launches;

  const LaunchesUpcomingList({Key? key, required this.launches}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return launches.isNotEmpty ? ListView.builder(
        itemBuilder: (context, position) {
          Launches launche = launches[position];
          return InkWell(
            onTap: () async{

            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network(
                      launche.links?.patch?.small ?? '',
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
                      launche.name ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("Date de lancement : ${launche.dateLocal ?? 'Inconnue'}")
                  ],
                ),
                ),
                IconButton(
                //TODO à faire
                  icon: const Icon(false
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: () {
                    //onFavoriteChanged?.call(spot, true);
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