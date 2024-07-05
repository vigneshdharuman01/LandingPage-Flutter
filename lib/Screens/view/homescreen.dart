import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view model/imageprovider.dart' as custom;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isDay = true;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => custom.ImageProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDay ? Colors.white : Colors.black,
          title: Text(
            "Landing Page",
            style: TextStyle(color: isDay ? Colors.black : Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(
                isDay ? Icons.brightness_3 : Icons.wb_sunny,
                color: isDay ? Colors.black : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  isDay = !isDay;
                });
              },
            ),
          ],
        ),
        backgroundColor: isDay ? Colors.white : Colors.black,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 12,
                child: ImageCarousel(
                  isDay: isDay,
                ),
              ),
              Expanded(
                flex: 1,
                child: DotIndicator(isDay: isDay),
              ),
              Expanded(
                flex: 2,
                child: ButtonRow(isDay: isDay),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  final bool isDay;
  const ImageCarousel({super.key, required this.isDay});

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<custom.ImageProvider>(context);

    return PageView.builder(
      itemCount: imageProvider.images.length,
      onPageChanged: (index) {
        imageProvider.setCurrentIndex(index);
      },
      itemBuilder: (context, index) {
        final imageData = imageProvider.images[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.55,
                child: Image.asset(
                  imageData.imageUrl,
                  fit: BoxFit.fill,
                )),
            Text(
              imageData.title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDay ? Colors.black : Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                imageData.description,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: isDay ? Colors.black : Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool isDay;
  const DotIndicator({super.key, required this.isDay});

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<custom.ImageProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        imageProvider.images.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: imageProvider.currentIndex == index
                ? isDay
                    ? Colors.black
                    : Colors.white
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  final bool isDay;
  const ButtonRow({super.key, required this.isDay});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 120,
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(12)),
          child: TextButton(
              onPressed: () {},
              child: Text(
                'Login In',
                style: TextStyle(color: Colors.white),
              )),
        ),
        Container(
          width: 120,
          decoration: BoxDecoration(
              color: isDay ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(12)),
          child: TextButton(
              onPressed: () {},
              child: Text(
                'Sign Up',
                style: TextStyle(color: isDay ? Colors.white : Colors.black),
              )),
        ),
      ],
    );
  }
}
