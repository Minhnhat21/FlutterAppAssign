import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  List<String> popMenu = ["Setting", "About", "Logout"];
  String urlImage = 'https://images.unsplash.com/photo-1568160193496-8d92de3c9e76?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Colors.green, Colors.blue]),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        centerTitle: true,
        //leading: const Icon(Icons.home, color: Color(0xFFEF9595), size: 50),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => popMenu
                .map(
                  (option) => PopupMenuItem(value: option, child: Text(option)),
                )
                .toList(),
          ),
        ],
        title: const Text("Hello App",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFEFB495),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      backgroundColor: const Color(0xFFEBEF95),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const Text(
            "Aiza, Welcome Flutter",
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.red, fontFamily: 'Fuggles'),
            textAlign: TextAlign.center,
          ),
          Image(
              image: NetworkImage(urlImage)
          ),
          const Text(
            "Nguyễn Hữu Minh Nhật",
            style: TextStyle(
              fontSize: 40,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,
              fontFamily: 'Fuggles'
            ),
          ),
          const Image(
            image: AssetImage(
              'assets/images/dog_super_hero.jpg'
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.cyan,
                gradient:
                    const LinearGradient(colors: [Colors.green, Colors.blue]),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.red, size: 50),
                  onPressed: () {
                    print("Hello cc");
                    var snackBar = const SnackBar(content: Text("Hello CC"));
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.inbox_sharp,
                      color: Colors.amber, size: 50),
                  onPressed: () {
                    print("Push your hand up");
                    var snackBar =
                        const SnackBar(content: Text("Push your hand up"));
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    ;
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share,
                      color: Colors.deepPurple, size: 50),
                  onPressed: () {
                    print("Push your hand up");
                    var snackBar = const SnackBar(
                        content: Text("FFFF*****KKKK! My heard is broken"));
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    ;
                  },
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              label: "Account", icon: Icon(Icons.account_circle)),
          BottomNavigationBarItem(label: "Logout", icon: Icon(Icons.logout)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFEF9595),
          shape: const CircleBorder(),
          onPressed: () => {},
          child: const Icon(Icons.add)),
      drawer: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
              title: Text('Closed'),
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
