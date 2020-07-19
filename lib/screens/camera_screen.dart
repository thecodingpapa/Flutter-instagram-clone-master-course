import 'package:flutter/material.dart';
import 'package:instagramtworecord/models/camera_state.dart';
import 'package:instagramtworecord/models/gallery_state.dart';
import 'package:instagramtworecord/widgets/my_gallery.dart';
import 'package:instagramtworecord/widgets/take_photo.dart';
import 'package:provider/provider.dart';

class CameraScreen extends StatefulWidget {
  CameraState _cameraState = CameraState();
  GalleryState _galleryState = GalleryState();
  @override
  _CameraScreenState createState() {
    _cameraState.getReadyToTakePhoto();
    _galleryState.initProvider();
    return _CameraScreenState();
  }
}

class _CameraScreenState extends State<CameraScreen> {
  int _currentIndex = 1;
  PageController _pageController = PageController(initialPage: 1);
  String _title = "Photo";

  @override
  void dispose() {
    _pageController.dispose();
    widget._cameraState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CameraState>.value(value: widget._cameraState),
        ChangeNotifierProvider<GalleryState>.value(value: widget._galleryState),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            MyGallery(),
            TakePhoto(),
            Container(
              color: Colors.greenAccent,
            ),
          ],
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
              switch (_currentIndex) {
                case 0:
                  _title = 'Gallery';
                  break;
                case 1:
                  _title = 'Photo';
                  break;
                case 2:
                  _title = 'Video';
                  break;
              }
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 0,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.radio_button_checked), title: Text('GALLERY')),
            BottomNavigationBarItem(
                icon: Icon(Icons.radio_button_checked), title: Text('PHOTO')),
            BottomNavigationBarItem(
                icon: Icon(Icons.radio_button_checked), title: Text('VIDEO')),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTabbed,
        ),
      ),
    );
  }

  void _onItemTabbed(index) {
    print(index);
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(_currentIndex,
          duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
    });
  }
}
