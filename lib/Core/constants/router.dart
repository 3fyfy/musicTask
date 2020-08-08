

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musictask/Core/constants/app_contstant.dart';
import 'package:musictask/UI/home.dart';
import 'package:musictask/UI/splash.dart';
import 'package:musictask/UI/tracks.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Splash:
        return MaterialPageRoute(builder: (_) => Splash());
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => Home());

      case RoutePaths.TracksPage:
        var idAlbumDeezer = settings.arguments as String;
        var idAlbumSpotify = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => TracksPage(idAlbumDeezer: idAlbumDeezer,idAlbumSpotify: idAlbumSpotify,));

       // var id = settings.arguments;
        //return MaterialPageRoute(builder: (_) => Address( );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}