import 'package:flutter/material.dart';
import 'package:learn_flutter/cards/post_card_2.dart';
import 'package:learn_flutter/cards/story_card.dart';
import 'package:learn_flutter/models/Account.dart';
import 'package:learn_flutter/views/screen/profile_account_ig.dart';

import '../../cards/post_card.dart';
import '../../cards/post_card_3.dart';
import '../../cards/post_card_4.dart';
import '../../cards/post_card_5.dart';


class MyInstagramApp extends StatefulWidget {
  MyInstagramApp({super.key,required this.account});
  final Account? account;

  @override
  State<MyInstagramApp> createState() => _MyInstagramAppState();
}

class _MyInstagramAppState extends State<MyInstagramApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(
                color: Colors.black12, width: 1.0, style: BorderStyle.solid)),
        title: const Text(
          "Instagram",
          style: TextStyle(
            fontSize: 32,
              fontFamily: 'Billabong',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: Image.asset('assets/images/messenger_32.png'),
            onPressed: () {
              print("Hello, Message");
            },
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Story IG
            StoryCard(),
            const Divider(color: Colors.white10,),
            const SizedBox(height: 10.0,),
            // Post 1
            PostCard(),
            const SizedBox(height: 10.0,),
            // Post 2
            PostCard2(),
            const SizedBox(height: 10.0,),
            // Post 3
            PostCard3(),
            const SizedBox(height: 10.0,),
            // Post 4
            const PostCard4(),
            const SizedBox(height: 10.0,),
            // Post 4
            const PostCard5(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.black12,
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: const Icon(
                  Icons.ondemand_video,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              IconButton(
                icon: const CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage('assets/images/nhatnhm02.jpg'),
                ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountProfile(account: widget.account,))
                    );
                  },
              ),
            ],
          ),
      )
    );
  }
}

