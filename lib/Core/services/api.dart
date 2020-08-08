import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:musictask/Core/models/album.dart';
import 'package:musictask/Core/models/albumspootfy.dart';


/// The service responsible for networking requests
class Api {
  static const _api_deezer = 'https://api.deezer.com/album/';
  static const _api_Spotify = 'https://api.spotify.com/v1/albums?ids=41MnTivkwTO3UUJ8DrqEJJ,6JWc4iAiJ9FjyK0B59ABb4,6UXCm6bOO4gFlDQZV5yL37';

  static String _token_spotify = "BQCHG8avZk0XXDoaqxnRBn6QaStTqCwzaDdCcAgZ4AXb8UbmHF3dlkBCWGPEWqIsqHXRNDBUnita3jWtSI-eonTWFF5o0NaIlsUjjiMtV4R9Pb943dvpkTfOlwaBEgz6L5N3BgGxFthrHK9FwxJZptv-OMF0rFfgw1C7k2BSzDmgWzdFuQtHPqWcXklt4AomwaQKZ6IWs4iWILE3QzlIE1IB3wxdN5DSWlZ_nargbxkn7M-Tx3REHLGJUumwkdRYGHJudAG3EeAq8G_r_pdiWQQwvYXQNN56gz-w";
  
  var client = new http.Client();

  Future<List<AlbumDeezer>> getAlbumsDeezer() async {

    List<AlbumDeezer> albums=[];
for(int idalbum=302127;idalbum<302132;idalbum++){
  var response = await client.get('${_api_deezer+idalbum.toString()}');
  albums.add(AlbumDeezer.fromJson(json.decode(response.body)));

}
    return albums ;

  }


  Future<AlbumDeezer> getAlbumIDDeezer(String idalbum) async {

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

  Future<AlbumSpotify> getAlbumIDSpotify(String idalbum) async {

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
