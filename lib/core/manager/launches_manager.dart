
import 'package:app_spacex/core/manager/api_manager.dart';
import 'package:app_spacex/core/manager/database_manager.dart';
import 'package:app_spacex/core/model/company.dart';

import 'package:flutter/material.dart';
import 'package:app_spacex/core/model/launch.dart';

import '../model/landpad.dart';


class LaunchesManager{
  List<Launch>? _launchesUpcoming;
  List<Launch> get launchesUpcoming => _launchesUpcoming ?? [];

  List<Landpad>? _landpad;
  List<Landpad> get landpad => _landpad ?? [];

  List<Launch>? _launchesLatest;
  List<Launch> get launchesLatest => _launchesLatest ?? [];

  List<Launch>? _favoriteLaunches;
  List<Launch> get favoriteLaunches => _favoriteLaunches ?? [];

  static final LaunchesManager _instance = LaunchesManager._internal();

  factory LaunchesManager() => _instance;

  LaunchesManager._internal();

  int get _launchListLength => _launchesUpcoming?.length ?? 0;

  Future<bool> initData() async {
    await Future.wait([loadLaunchesUpcoming(), loadFavoriteLaunch(), loadLaunchesLatest(), loadLandpads()]);
    return true;
  }

  Future<void> loadLaunchesUpcoming() async {
    try{
      var response = await ApiManager().getAllUpcomingLaunches();

      if(response.data != null){
        _launchesUpcoming = List<dynamic>.from(response.data!).map((json) => Launch.fromJson(json)).toList();
      }
    } catch(e){
      debugPrint("Erreur : $e");
    }
  }

  Future<void> loadLaunchesLatest() async {
    try{
      var response = await ApiManager().getAllLatestLaunches();

      if(response.data != null){
        _launchesLatest = List<dynamic>.from(response.data!).map((json) => Launch.fromJson(json)).toList().reversed.toList();
      }
    } catch(e){
      debugPrint("Erreur : $e");
    }
  }

  Future<void> loadLandpads() async {
    try{
      var response = await ApiManager().getAllLandpads();

      if(response.data != null){
        _landpad = List<dynamic>.from(response.data!).map((json) => Landpad.fromJson(json)).toList();
      }
    } catch(e){
      debugPrint("Erreur : $e");
    }
  }

  Future<void> loadFavoriteLaunch() async {
    _favoriteLaunches = await DatabaseManager().getFavoriteLaunch();
  }

  bool isLaunchFavorite(String idSpot) {
    try {
      return _favoriteLaunches?.firstWhere((spot) => spot.id == idSpot) != null;
    } catch (e) {
      // Launch not found
      return false;
    }
  }


  Future<void> toggleFavorite(Launch launchToUpdate) async {
    bool isFavorite = await DatabaseManager().isFavorite(launchToUpdate.id);
    await DatabaseManager().toggleFavorite(isFavorite, launchToUpdate);
    if (isFavorite) {
      _favoriteLaunches?.removeWhere((Launch launch) => launch.id == launchToUpdate.id);
    } else {
      _favoriteLaunches ??= [];
      _favoriteLaunches?.add(launchToUpdate);
    }
  }

  Future<Company?> getInfoCompany() async {
   Company? company;
   try{
     var response = await ApiManager().getCompanyInfo();
     if (response.data != null) {
       company = Company.fromJson(response.data ?? {});
     }
   } catch (error){
     debugPrint("Erreur : $error}");
   }
   return company;
  }
}