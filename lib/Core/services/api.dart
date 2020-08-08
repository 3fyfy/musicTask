import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:musictask/Core/models/album.dart';
import 'package:musictask/Core/models/albumspootfy.dart';


/// The service responsible for networking requests
class Api {
  static const _api_deezer = 'https://api.deezer.com/album/';
  static const _api_Spotify = 'https://api.spotify.com/v1/albums?ids=41MnTivkwTO3UUJ8DrqEJJ,6JWc4iAiJ9FjyK0B59ABb4,6UXCm6bOO4gFlDQZV5yL37';

  static String _token_spotify = "BQD86nkUIICwdBCfE4pGkKycAfzQNKFldSSsJIsmoEfNf--D8m-x5msjKkV7001PSAyas-m6LOH8_TIMbzOm632WtPBgODaTvGW9MBLyy_jTdtgExec3S1_0CA5GE02IwGS8kFZ5xKOFx2Vc-vF39aAHJjQR4YyMWpCIte_YwSik-G6NU9OZzOHlVYU7dM5Y1oDK06OJUf2w8U0eB-VWnl7GX_oNlduaJ1r8X0jG5xi0dd2lQVOd_5w-4ock5WOrKaS2LSgymK9X5bNIfBWdE6ZVy3qYgWbrJsD1";





  
  
  var client = new http.Client();

  Future<List<AlbumDeezer>> getAlbumsDeezer() async {

    List<AlbumDeezer> albums=[];
for(int idalbum=302127;idalbum<302132;idalbum++){
  var response = await client.get('${_api_deezer+idalbum.toString()}');
  albums.add(AlbumDeezer.fromJson(json.decode(response.body)));

}
    return albums ;

  }
  
  
  Future<AlbumDeezer> getSingleAlbumIDDeezer(String idalbum) async {

    var response = await client.get('${_api_deezer+idalbum.toString()}');

    return AlbumDeezer.fromJson(json.decode(response.body));

  }

  
  
  
  Future<AlbumsSpotify> getAlbumsSpotify() async {

    final response = await http.get(_api_Spotify, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token_spotify',
    });
    print(response.body);
    return AlbumsSpotify.fromJson(json.decode(response.body)); ;

  }

  Future<AlbumSpotify> getSingleAlbumIDSpotify(String idalbum) async {

  var response= await client.get('https://api.spotify.com/v1/albums/${idalbum}',headers: {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer $_token_spotify',
  });
print(response.body);
  AlbumSpotify singlealbum= AlbumSpotify.fromJson(json.decode(response.body));
    print(singlealbum.id);
    return singlealbum ;

  }



}
