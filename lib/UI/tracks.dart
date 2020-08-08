import 'package:flutter/material.dart';
import 'package:musictask/Core/viewmodels/widgets/album_model.dart';
import 'package:musictask/UI/playmusdic.dart';
import 'package:musictask/base_view.dart';

class TracksPage extends StatefulWidget {
   String idAlbumDeezer=null;
   String idAlbumSpotify=null;


  TracksPage({this.idAlbumDeezer, this.idAlbumSpotify});

  @override
  _TracksPageState createState() => _TracksPageState();
}

class _TracksPageState extends State<TracksPage> {
  @override
  Widget build(BuildContext context) {

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    // if data get Deezer flag true otherwise false
    bool flag =widget.idAlbumSpotify==null;
    return Scaffold(

          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Tracks"),
            centerTitle: true,
            backgroundColor: Colors.black,
            elevation: 0,
          ),
          body: Container(
            height: height,
            width: width,
//            decoration: BoxDecoration(
//                image: DecorationImage(image: AssetImage("assets/backhom4.jpg"),fit: BoxFit.contain)
//            ),
            padding: EdgeInsets.only(top: height*.02,),
            child: BaseView<AlbumModel>(
              onModelReady: (model) async{


                if (flag)
                  return   model.getSingleAlbumIDDeezer(widget.idAlbumDeezer);
                else
                  return  model.getSingleAlbumsSpotify(widget.idAlbumSpotify);},
              builder: (context, model, child) =>((flag)?(model.singlealbumDeezer==null):(model.singleAlbumSpotify==null))?Container(
                  width: width,
                  height:height,
                     child: Center(child: CircularProgressIndicator())): Container(
              width: width,
              child: (flag)? ListView.builder(
                itemBuilder: (context, index) {

                  return InkWell(
                    onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicPage(model.singlealbumDeezer.tracks.data[index].title,model.singlealbumDeezer.tracks.data[index].preview),));
                    },
                    child: ListTile(
                      title:Text(model.singlealbumDeezer.tracks.data[index].title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),) ,
                      subtitle:Wrap(
                        alignment: WrapAlignment.spaceBetween,
                          children: <Widget>[
                            Text(model.singlealbumDeezer.tracks.data[index].artist.name,style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500),),
                            Text("${((model.singlealbumDeezer.tracks.data[index].duration)~/60)} : ${(model.singlealbumDeezer.tracks.data[index].duration)%60}"),
                          ],
                          ) ,
                      leading: Image.network(model.singlealbumDeezer.coverMedium,fit: BoxFit.contain,),


//                          child: Image.network(model.albums[index].coverMedium,fit: BoxFit.contain,),
                    ),
                  );

                },itemCount: model.singlealbumDeezer.tracks.data.length,):
              ListView.builder(
                itemBuilder: (context, index) {

                  return InkWell(
                    onTap: (){
                      print(model.singleAlbumSpotify.tracks.items[index].externalUrls.spotify);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicPage(model.singleAlbumSpotify.tracks.items[index].name,model.singleAlbumSpotify.tracks.items[index].externalUrls.spotify+".mp3"),));

                    },
                    child: ListTile(
                      title:Text(model.singleAlbumSpotify.tracks.items[index].name) ,
                      subtitle:Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: <Widget>[
                          Text(model.singleAlbumSpotify.tracks.items[index].artists[0].name),
                          Text("${((model.singleAlbumSpotify.tracks.items[index].durationMs)~/60000)} : ${(model.singleAlbumSpotify.tracks.items[index].durationMs)%60}"),

                        ],
                      ) ,


//                          child: Image.network(model.albums[index].coverMedium,fit: BoxFit.contain,),
                    ),
                  );

                },itemCount: model.singleAlbumSpotify.tracks.items.length,),
            ),
          ),
        )
    );
  }
}
