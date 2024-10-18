import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintin/providers/reading_list_provider.dart';
import 'package:tintin/screens/album_details.dart';
import '../services/album_service.dart';
import '../models/album.dart';

class AlbumsMaster extends StatefulWidget {
  const AlbumsMaster({Key? key}) : super(key: key);

  @override
  State<AlbumsMaster> createState() => _AlbumsMasterState();
}

class _AlbumsMasterState extends State<AlbumsMaster> {
  var jsonData;
  
  @override
  void initState(){
    super.initState();
    jsonData = AlbumService.fetchAlbums();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Albums"),
      ),
      body: FutureBuilder<List<Album>>(
        future: AlbumService.fetchAlbums(), 
        builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator();
            } else if (snapshot.hasError){
              return const Text("Erreur");
            } else if (snapshot.hasData);{
              final albums = snapshot.data!;
            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                return Padding(padding: const EdgeInsets.all(5),
                child:ListTile(
                    shape: RoundedRectangleBorder( 
                    side: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(20),),
                  contentPadding: const EdgeInsets.all(10),
                  leading: Image.asset("images/${album.image}" , height: 70,),
                  title: Text(album.title),
                  trailing:  Consumer<LikesProvider>(
                    builder: (context, likesProvider, child){
                      final isLiked = likesProvider.isLiked(album);
                      return FloatingActionButton(
                        backgroundColor: Colors.deepOrange,
                        child: Icon(isLiked? Icons.favorite : Icons.favorite_border, color: Colors.white),
                        onPressed: (){
                          if (isLiked){
                            likesProvider.unlikeAlbum(album);
                          } else {
                            likesProvider.likeAlbum(album);
                          }
                        },
                      );
                    }),
                  tileColor: Colors.brown,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AlbumDetails(album: album,)));
                  }
                  ),
                );

              },
            );
          }
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}
