import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musictask/Core/viewmodels/widgets/album_model.dart';
import 'package:musictask/UI/tracks.dart';
import 'package:musictask/base_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Albums"),
        centerTitle: true,
        leading: Icon(null),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
     // backgroundColor: Colors.black26,
      body: Container(
        height: height,
        width: width,
//        decoration: BoxDecoration(
//          image: DecorationImage(image: AssetImage("assets/backhome4.jpg"),fit: BoxFit.contain)
//        ),
        padding: EdgeInsets.only(top: height*.02,),
        child: ListView(
          children: <Widget>[

            Container(
              padding:  EdgeInsets.only(right: width*.04,left: width*.04),
              margin: EdgeInsets.only(bottom: 10),
              child: Text("DEEZER",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ),

      BaseView<AlbumModel>(
        onModelReady: (model) async{
          return model.getAlbumsDeezer();},
        builder: (context, model, child) => (model.albumsDeezer==null)?Container(
            height: 100,
            width: width,
             child: Center(child: CircularProgressIndicator())):  Container(
              height: 100,
              width: width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index) {

                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TracksPage(idAlbumDeezer: model.albumsDeezer[index].id.toString(),),));

                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left: 8,right: 8),
                      child: Image.network(model.albumsDeezer[index].coverMedium,fit: BoxFit.contain,),
                    ),
                  );

                },itemCount: model.albumsDeezer.length,),
            ),
      ),


            Container(
              padding:  EdgeInsets.only(right: width*.04,left: width*.04),
              margin: EdgeInsets.only(bottom: 10,top: 10),
              child: Text("Spotify",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ),


            BaseView<AlbumModel>(
              onModelReady: (model) async{
                return model.getAlbumsSpotify();},
              builder: (context, model, child) => (model.albumsSpotify==null||model.albumsSpotify.albums==null)?Container(
                  height: 100,
                  width: width,
                   child: Center(child: CircularProgressIndicator())):  Container(
                height: 100,
                width: width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TracksPage(idAlbumSpotify: model.albumsSpotify.albums[index].id),));
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.only(left: 8,right: 8),
                        child: Image.network(model.albumsSpotify.albums[index].images[1].url,fit: BoxFit.contain,),
                      ),
                    );

                  },itemCount: model.albumsSpotify.albums.length,),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
