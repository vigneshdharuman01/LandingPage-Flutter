import 'package:flutter/material.dart';
import '../model class/imagedata.dart';

class ImageProvider with ChangeNotifier {
  final List<ImageData> _images = [
    ImageData(
      imageUrl: 'assets/img1.png',
      title: 'Welcome to our shop!',
      description:
          'We can Provide more Product with Affordable Price With Exciting Offers',
    ),
    ImageData(
      imageUrl: 'assets/img2.png',
      title: 'We\'re ALways Open for Business',
      description: 'Shop Anything,Anywhere  With Our Easy-to-Use Mobile App',
    ),
    ImageData(
      imageUrl: 'assets/img3.png',
      title: 'Shop With Confidence',
      description:
          'We are give the best Products so you don\'t worrey about it',
    ),
  ];

  int _currentIndex = 0;

  List<ImageData> get images => _images;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  bool _isDay = true;

  void setDay() {
    _isDay = !_isDay;
    notifyListeners();
  }

  bool get getcurrentThem => _isDay;
}
