
import 'package:app_spacex/core/manager/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:app_spacex/core/model/launches.dart';

class LaunchesManger{
  List<Launches>? _launches;
  List<Launches> get launches => _launches ?? [];


  static final LaunchesManger _instance = LaunchesManger._internal();

  factory LaunchesManger() => _instance;

  LaunchesManger._internal();

  //int get _spotListLength => _launches?.length ?? 0;

  Future<List<Launches>?> loadLaunchesUpcoming() async {
    try{
      var response = await ApiManager().getAllUpcomingLaunches();

      if(response.data != null){
        _launches = List<dynamic>.from(response.data!).map((json) => Launches.fromJson(json)).toList();
      }
      return _launches;
    } catch(e){
      debugPrint("Erreur : $e");
      return null;
    }
  }
}