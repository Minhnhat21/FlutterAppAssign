import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
class StoryCard extends StatefulWidget {
  StoryCard({
    super.key,
  });

  @override
  State<StoryCard> createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  final List<String> igProfileImages = [
    'assets/images/_seorina.jpg',
    'assets/images/aespa_official.jpg',
    'assets/images/hanni_ssi.jpg',
    'assets/images/katarinabluu.jpg',
    'assets/images/lalalalisa_m.jpg',
    'assets/images/sontungmtp.jpg',
    'assets/images/sooyaaa__.jpg',
    'assets/images/twicetagram.jpg',
    'assets/images/xeesoxee.jpg',
  ];

  final List<String> igProfileTitle = [
    '_seorina',
    'aespa_official',
    'hanni_ssi',
    'katarinabluu',
    'lalalalisa_m',
    'sontungmtp',
    'sooyaaa__',
    'twicetagram',
    'xeesoxee',
  ];

  List<String> _story = [];



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            9,
                (index) => Container(
                padding: EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage(
                          'assets/images/ig_colourful_r.jpg'),
                      radius: 35,
                      child: CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage(
                          igProfileImages[index],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(igProfileTitle[index],style: const TextStyle(fontSize: 16, fontFamily: 'Nunito'),)
                  ],
                )),
          ),
        ));
  }
}