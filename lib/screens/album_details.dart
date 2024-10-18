import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/providers/reading_list_provider.dart';

class AlbumDetails extends StatelessWidget {
  const AlbumDetails({super.key, required this.album});
  final Album album;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title, style: const TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Text("Album n° : ${album.numero}", style: const TextStyle(
              color: Colors.white,
            ),),
            const SizedBox(height: 10,),
            Text(album.resume, style: const TextStyle(
              color: Colors.white,
            ),),
            const SizedBox(height: 10,),
            Text("Année de parution : ${album.year}", style: const TextStyle(
              color: Colors.white,
            ),),
            const SizedBox(height: 10,),
            Text("Numéro : ${album.numero}", style: const TextStyle(
              color: Colors.white,
            ),),
            Image.asset("images/${album.image}", height: 450,),
          ],
        )),
        floatingActionButton: Consumer<LikesProvider>(
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
        backgroundColor: Colors.black,
    );
  }
}