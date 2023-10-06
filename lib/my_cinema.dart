import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCinema extends StatefulWidget {
  const MyCinema({super.key});

  @override
  State<MyCinema> createState() => _MyCinemaState();
}

class _MyCinemaState extends State<MyCinema> {

  final List<String> images = [
    'assets/images/Bietdoidanhthue.jpg',
    'assets/images/kekientao.jpg',
    'assets/images/kemongdu.jpg',
  ];

  int currentIndex = 0;

  late Timer timer;

  // Add a ScrollController
  final ScrollController controller = ScrollController(initialScrollOffset: 0.0);

  @override
  void initState() {
    super.initState();

    // Add a listener to the controller to update currentIndex.
    controller.addListener(() {
      final index = (controller.offset / 350).round();
      if (index != currentIndex) {
        setState(() {
          currentIndex = index;
        });
      }
    });

    // Update current index by time duration
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % images.length;
        _scrollToCurrentSlide();
      });
    });
  }

  // Move new Image using animateTo
  void _scrollToCurrentSlide() {
    controller.animateTo(
      currentIndex * MediaQuery.of(context).size.width,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        centerTitle: true,
        //leading: const Icon(Icons.home, color: Color(0xFFEF9595), size: 50),
        title: const Text("My Cinema",
            style:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFEFB495),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              child: const Text("Phim đang chiếu:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                          images[index],
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        );
                    },
                  controller: controller,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((image) {
                int index = images.indexOf(image);
                return Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == currentIndex ? Colors.blue : Colors.grey
                  )
                );
              }).toList() ,
            ),
            // List movie
            const SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(4.0),
              child: const Text("Danh sách phim:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width / 3,
                    height: 200,
                    child: Image.network("https://media.lottecinemavn.com/Media/MovieFile/MovieImg/202310/11271_103_100001.jpg", fit: BoxFit.fill,)
                ),
                Container(
                    padding: EdgeInsets.all(8.0),
                    height: 200,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image.network("https://media.lottecinemavn.com/Media/MovieFile/MovieImg/202310/11272_103_100001.jpg", fit: BoxFit.fill,)
                ),
                Container(
                    padding: EdgeInsets.all(8.0),
                    height: 200,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image.network("https://media.lottecinemavn.com/Media/MovieFile/MovieImg/202310/11273_103_100001.jpg", fit: BoxFit.fill,)
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width / 3,
                    height: 200,
                    child: Image.network("https://media.lottecinemavn.com/Media/MovieFile/MovieImg/202310/11277_103_100001.jpg", fit: BoxFit.fill,)
                ),
                Container(
                    padding: EdgeInsets.all(8.0),
                    height: 200,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image.network("https://media.lottecinemavn.com/Media/MovieFile/MovieImg/202310/11278_103_100002.jpg", fit: BoxFit.fill,)
                ),
                Container(
                    padding: EdgeInsets.all(8.0),
                    height: 200,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image.network("https://media.lottecinemavn.com/Media/MovieFile/MovieImg/202309/11165_103_100002.jpg", fit: BoxFit.fill,)
                ),
              ],
            ),
          ],
        ),
      ),


    );
  }

  @override
  void dispose() {
    //Dispose of the controller when done.
    timer.cancel();
    controller.dispose();
    super.dispose();
  }
}
