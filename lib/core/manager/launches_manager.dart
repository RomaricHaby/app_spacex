
import 'package:app_spacex/core/manager/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:app_spacex/core/model/launch.dart';

class LaunchesManager{
  List<Launch>? _launches;
  List<Launch> get launches => _launches ?? [];
  List<Launch>? _favoriteLaunches;
  List<Launch> get favoriteLaunches => _favoriteLaunches ?? [];



  static final LaunchesManager _instance = LaunchesManager._internal();

  factory LaunchesManager() => _instance;

  LaunchesManager._internal();

  //int get _spotListLength => _launches?.length ?? 0;

  Future<List<Launch>?> loadLaunchesUpcoming() async {
    try{
      var response = await ApiManager().getAllUpcomingLaunches();

      if(response.data != null){
        _launches = List<dynamic>.from(response.data!).map((json) => Launch.fromJson(json)).toList();
      }
      return _launches;
    } catch(e){
      debugPrint("Erreur : $e");
      return null;
    }
  }

  bool isLaunchesFavorite(Launch launches){
    return launches.isFav;
  }

  void toggleFavorite(Launch launchToUpdate){
    if(launchToUpdate.isFav){
      launchToUpdate.isFav = false;
      _favoriteLaunches?.removeWhere((Launch launch) => launch.id == launchToUpdate.id);
    }
    else{
      launchToUpdate.isFav = true;
      _favoriteLaunches ??= [];
      _favoriteLaunches?.add(launchToUpdate);
    }
  }

}