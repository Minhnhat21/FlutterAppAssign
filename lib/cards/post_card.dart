import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  PostCard({
    super.key,
  });


  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final List<String> imagesPost = [
    'assets/images/post/_seorina_1.jpg',
    'assets/images/post/_seorina_2.jpg',
    'assets/images/post/_seorina_3.jpg',
  ];

  int currentIndex = 0;
  // Add a ScrollController
  final ScrollController controller = ScrollController(initialScrollOffset: 0.0);

  @override
  void initState() {
    super.initState();

    // Add a listener to the controller to update currentIndex.
    controller.addListener(() {
      final index = (controller.offset / 350).round();
      print(controller.offset);
      print("Index: $index");
      if (index != currentIndex) {
        setState(() {
          currentIndex = index;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/_seorina.jpg'),
                  ),
                  SizedBox(width: 10.0,),
                  Text("_seorina", style: TextStyle(fontSize: 18, fontFamily: 'Nunito')),
                ],
              ),
            ),

            IconButton(
                onPressed: () {
                  showModalBottomSheet(context: context, builder: (context) {
                    return const Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.share),
                          title: Text('Share'),
                        ),
                        ListTile(
                          leading: Icon(Icons.copy),
                          title: Text('Create Sticker'),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_circle),
                          title: Text('Giới thiệu về tài khoản này'),
                        ),
                        ListTile(
                          leading: Icon(Icons.report_gmailerrorred_outlined, color: Colors.red,),
                          title: Text('Báo cáo',style: TextStyle(color: Colors.red),),
                        ),
                      ],
                    );
                  });
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                )
            ),
          ],
        ),
        // Media Post
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: imagesPost.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                imagesPost[index],
                fit: BoxFit.fill,
              );
            },
            controller: controller,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: Colors.white70,
                    size: 32,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/images/icons8-comment-32.png',
                  ),
                  onPressed: () {
                    print("Hello, Message");
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/send_24.png',),
                  onPressed: () {
                    // do something
                  },
                ),
                if(imagesPost.length > 1) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imagesPost.map((image) {
                        int index = imagesPost.indexOf(image);
                        return Container(
                          width: 5,
                          height: 5,
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == currentIndex ? Colors.blue : Colors.grey,
                          ),
                        );
                      }).toList(),
                    ),
                  )  ,
                ],
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: Colors.white70,
                      size: 32,)
                )
              ],
            ),
            //Footer Post
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1.212.937 lượt thích', style: TextStyle(fontSize: 16,fontFamily: 'Nunito'),),
                  Text('스쿠터이름 : 꾸로미', style: TextStyle(fontSize: 16,fontFamily: 'Nunito'),),
                  TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Bình luận', style: TextStyle(fontSize: 26),),
                                    ],
                                  ),
                                  Divider(),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundImage: AssetImage('assets/images/blackckk_cat11.jpg'),
                                              ),
                                            ),
                                            Text('My lady😍', style: TextStyle(fontSize: 18),)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundImage: AssetImage('assets/images/blackckk_cat11.jpg'),
                                              ),
                                            ),
                                            Text('웅니 밥 잘 챙겨 묵어요 ♡', style: TextStyle(fontSize: 18),)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundImage: AssetImage('assets/images/blackckk_cat11.jpg'),
                                              ),
                                            ),
                                            Text('진짜..... 내 이상형이 존재 했구나...🥺', style: TextStyle(fontSize: 18),)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundImage: AssetImage('assets/images/blackckk_cat11.jpg'),
                                              ),
                                            ),
                                            Text('how r u even real omg ur the prettiest \n person', style: TextStyle(fontSize: 18),)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundImage: AssetImage('assets/images/blackckk_cat11.jpg'),
                                              ),
                                            ),
                                            Text('My lady😍', style: TextStyle(fontSize: 18),)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundImage: AssetImage('assets/images/blackckk_cat11.jpg'),
                                              ),
                                            ),
                                            Text('웅니 밥 잘 챙겨 묵어요 ♡', style: TextStyle(fontSize: 18),)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),


                                ],
                              );
                            });
                      },
                      child: const Text('Xem tất cả 1.217 bình luận', style: TextStyle(fontSize: 16,fontFamily: 'Nunito', color: Colors.grey))),
                  Text('10 tháng 10', style: TextStyle(fontSize: 14,fontFamily: 'Nunito', color: Colors.grey),),
                ],
              ),
            )

          ],
        )
      ],
    );
  }
}