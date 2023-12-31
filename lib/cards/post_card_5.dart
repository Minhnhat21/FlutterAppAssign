import 'package:flutter/material.dart';

class PostCard5 extends StatefulWidget {
  const PostCard5({
    super.key,
  });

  @override
  State<PostCard5> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard5> {
  final List<String> imagesPost = [
    'assets/images/post/xeesoxee_1.jpg',
    'assets/images/post/xeesoxee_2.jpg',
  ];

  int currentIndex = 0;

  // Add a ScrollController
  final ScrollController controller =
      ScrollController(initialScrollOffset: 0.0);

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
                    backgroundImage: AssetImage('assets/images/xeesoxee.jpg'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text("xeesoxee",
                      style: TextStyle(fontSize: 18, fontFamily: 'Nunito')),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
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
                              leading: Icon(
                                Icons.report_gmailerrorred_outlined,
                                color: Colors.red,
                              ),
                              title: Text(
                                'Báo cáo',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                )),
          ],
        ),
        // Media Post
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: imagesPost.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                imagesPost[index],
                width: MediaQuery.of(context).size.width,
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
                  icon: const Icon(
                    Icons.send_outlined,
                    color: Colors.white70,
                    size: 30,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),
                if (imagesPost.length > 1) ...[
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
                            color: index == currentIndex
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: Colors.white70,
                      size: 32,
                    ))
              ],
            ),
            //Footer Post
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // const Padding(
                      //   padding: EdgeInsets.only(right: 8.0),
                      //   child: CircleAvatar(
                      //     radius: 12,
                      //     backgroundImage: AssetImage('assets/images/blackckk_cat11.jpg'),
                      //   ),
                      // ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                            TextSpan(
                                text: '1.714.851 lượt thích',
                                style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '@DiorBeauty #디올뷰티 #디올포에버 #디올쿠션',
                    style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
                  ),
                  TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Bình luận',
                                        style: TextStyle(fontSize: 26),
                                      ),
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
                                                backgroundImage: AssetImage(
                                                    'assets/images/blackckk_cat11.jpg'),
                                              ),
                                            ),
                                            Text(
                                              'My lady😍',
                                              style: TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundImage: AssetImage(
                                                    'assets/images/blackckk_cat11.jpg'),
                                              ),
                                            ),
                                            Text(
                                              '웅니 밥 잘 챙겨 묵어요 ♡',
                                              style: TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundImage: AssetImage(
                                                    'assets/images/blackckk_cat11.jpg'),
                                              ),
                                            ),
                                            Text(
                                              '진짜..... 내 이상형이 존재 했구나...🥺',
                                              style: TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundImage: AssetImage(
                                                    'assets/images/blackckk_cat11.jpg'),
                                              ),
                                            ),
                                            Text(
                                              'how r u even real omg ur the prettiest \n person',
                                              style: TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundImage: AssetImage(
                                                    'assets/images/blackckk_cat11.jpg'),
                                              ),
                                            ),
                                            Text(
                                              'My lady😍',
                                              style: TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundImage: AssetImage(
                                                    'assets/images/blackckk_cat11.jpg'),
                                              ),
                                            ),
                                            Text(
                                              '웅니 밥 잘 챙겨 묵어요 ♡',
                                              style: TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Text('Xem tất cả 3.284 bình luận',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Nunito',
                              color: Colors.grey))),
                  Text(
                    '6 tháng 10',
                    style: TextStyle(
                        fontSize: 14, fontFamily: 'Nunito', color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
