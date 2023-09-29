import 'package:flutter/material.dart';

class ClassRoomPage extends StatelessWidget {
  ClassRoomPage({super.key});

  List<String> popMenu = [
    "Làm mới",
    "Gửi ý kiến phản hồi cho Google",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Google Lớp học",
          style: TextStyle(fontFamily: "Google Sans", fontSize: 30),
        ),
        actions: [
          PopupMenuButton(
              surfaceTintColor: Colors.white,
              constraints: const BoxConstraints.expand(width: 300, height: 100),
              itemBuilder: (context) => popMenu
                  .map((option) => PopupMenuItem(
                        value: option,
                        child: Text(
                          option,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ))
                  .toList())
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 150,
              child: DrawerHeader(
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/googleLogo1.png',
                    ),
                    const Text(
                      'Lớp học',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 20.0),
                    child: Icon(Icons.home),
                  ),
                  Text(
                    'Lớp học',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              onTap: () {
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 20.0),
                    child: Icon(Icons.calendar_today),
                  ),
                  Text(
                    'Lịch',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              onTap: () {
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 20.0),
                    child: Icon(Icons.notifications),
                  ),
                  Text(
                    'Thông báo',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            const ListBody(
              children: [
                Divider(
                  color: Colors.black26,
                ),
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Đã đăng ký",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                )
                // Padding(
                //   padding: EdgeInsets.all(25.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Row(
                //         children: [
                //           Icon(Icons.circle),
                //           Column(
                //             children: [
                //               Text("Java nâng cao")
                //             ],
                //           ),
                //         ],
                //       ),
                //       Text('Item 1'),
                //       Text('Item 2'),
                //       Text('Item 3'),
                //     ],
                //   ),
                // )
              ],
            ),
            const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 20.0),
                        child: Icon(Icons.offline_pin_outlined),
                      ),
                      Text(
                        'Tệp ngoại tuyến',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 20.0),
                        child: Icon(Icons.archive_outlined),
                      ),
                      Text(
                        'Lớp học lưu trữ',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 20.0),
                        child: Icon(Icons.folder_outlined),
                      ),
                      Text(
                        'Thư mục lớp học',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Update the state of the app
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 20.0),
                        child: Icon(Icons.settings_outlined),
                      ),
                      Text(
                        'Cài đặt',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 20.0),
                        child: Icon(Icons.help_outline),
                      ),
                      Text(
                        'Trợ giúp',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardBody(
              title: "Lập trình web",
              description: "2021-2022.2.TIN3042.001",
              teacher: "Trần Nguyên Phong",
              backgroundImage: "img_backtoschool.jpg",
            ),
            CardBody(
              title: "Thực tập viết niên luận",
              description: "2021-2022.2.TIN3042.001",
              teacher: "Lương Trần Thanh",
              backgroundImage: "img_graduation.jpg",
            ),
            CardBody(
              title: "Java nâng cao",
              description: "2021-2022.2.TIN3042.001",
              teacher: "Nguyễn Hoàng Hà",
              backgroundImage: "img_code.jpg",
            ),
            CardBody(
              title: "Xã hội học đại cương",
              description: "2021-2022.2.TIN3042.001",
              teacher: "Trần Thị Phương",
              backgroundImage: "img_bookclub.jpg",
            ),
            CardBody(
              title: "Trí tuệ nhân tạo",
              description: "2021-2022.2.TIN3042.001",
              teacher: "Đoàn Thị Hồng Phước",
              backgroundImage: "img_graduation.jpg",
            ),
          ],
        ),
      ),
    );
  }
}

class CardBody extends StatelessWidget {
  CardBody(
      {super.key,
      required this.title,
      required this.description,
      required this.teacher,
      this.backgroundImage});

  dynamic title;
  dynamic description;
  dynamic teacher;
  dynamic backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 150,
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/$backgroundImage'),
                fit: BoxFit.cover),
            shape: BoxShape.rectangle,
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  title.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Google Sans",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  description.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Google Sans",
                  ),
                ),
              ),
              Container(
                child: Text(
                  teacher.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Google Sans",
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
