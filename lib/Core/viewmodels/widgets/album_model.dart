


import 'package:musictask/Core/models/album.dart';
import 'package:musictask/Core/models/albumspootfy.dart';
import 'package:musictask/Core/services/api.dart';
import 'package:musictask/Core/viewmodels/base_model.dart';
import 'package:musictask/Core/viewmodels/viewstate.dart';
import 'package:musictask/locator.dart';

class AlbumModel extends BaseModel {
  Api _api = locator<Api>();

 List< AlbumDeezer> albumsDeezer;
 AlbumsSpotify albumsSpotify;
  AlbumDeezer singlealbumDeezer;
  AlbumSpotify singleAlbumSpotify;
  Future getAlbumsDeezer() async {
    setState(ViewState.Busy);
    albumsDeezer = await _api.getAlbumsDeezer();
    setState(ViewState.Idle);
  }


  Future getAlbumIDDeezer(String idalbum) async {
    setState(ViewState.Busy);
    singlealbumDeezer = await _api.getAlbumIDDeezer(idalbum);
    setState(ViewState.Idle);
  }


Future getAlbumsSpotify() async {
    setState(ViewState.Busy);
    albumsSpotify = await _api.getAlbumsSpotify();
    setState(ViewState.Idle);
  }

  Future getAlbumIDSpotify(String idalbum) async {
    setState(ViewState.Busy);
    singleAlbumSpotify = await _api.getAlbumIDSpotify( idalbum);
    setState(ViewState.Idle);
  }


}

