import 'package:flutter/material.dart';
import 'package:lesson4/model/fakecloudstorage.dart';
import '../controller/homepage_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';


class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>{

  HomePageController controller;
  BuildContext context;

  HomePageState(){
    controller = HomePageController(this);
  }

  void stateChanged(Function fn){
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson4'),
      ),
      body: ListView.builder(
        itemCount: MyCloud.booksDB.length,
        itemBuilder: (BuildContext context, int index){
          Book book = MyCloud.booksDB[index];
          return ListTile(
            title: Text(book.title),
            leading: CachedNetworkImage(
              imageUrl: book.imageURL,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error_outline),
            ),
            subtitle: Text(book.author + ' ' + book.price.toString()),
            onTap: (){controller.onTap(index);},
            onLongPress: () => controller.onLongPress(index),
          );
        },
      ),
    );
  }

}