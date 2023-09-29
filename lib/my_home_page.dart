import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  List<String> popMenu = [
    "Setting", "About", "Logout"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient:
            const LinearGradient(colors: [Colors.green, Colors.blue]),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        centerTitle: true,
        //leading: const Icon(Icons.home, color: Color(0xFFEF9595), size: 50),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) =>
                popMenu.map((option) =>
                    PopupMenuItem(
                        value: option,
                        child: Text(option)),
                ).toList(),
          ),

        ],
        title: const Text("Hello App",
            style:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFEFB495),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      backgroundColor: const Color(0xFFEBEF95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Aiza, Welcome Flutter",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const Text(
            "Minh Nhat",
            style: TextStyle(
              fontSize: 20,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,
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
              label: "Account",
              icon: Icon(Icons.account_circle)
          ),

          BottomNavigationBarItem(
              label: "Logout",
              icon: Icon(Icons.logout)
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFEF9595),
        shape: const CircleBorder(),
          onPressed: () => {

        },
        child: const Icon(Icons.add)
        ),
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
              }
          ),
        ],
      ),
    );
  }
}
