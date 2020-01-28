import '../view/homepage.dart';

class HomePageController{

  HomePageState state;

  HomePageController(this.state);

  void onTap(int index){
    print('Tapped on index = $index');
  }

  void onLongPress(int index){
    print('Long pressed on index = $index');
  }
}