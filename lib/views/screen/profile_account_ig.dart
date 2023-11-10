import 'package:flutter/material.dart';
import 'package:learn_flutter/models/Account.dart';

class AccountProfile extends StatefulWidget {
  AccountProfile({super.key, required this.account});

  Account? account;
  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.greenAccent,
            radius: 100,
            child: CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage('assets/images/nhatnhm02.jpg'),
            ),
          ),
          const Divider(color: Colors.cyan, height: 20,),
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(10.0),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(color: Colors.white),
              children: [
                TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Tên đăng nhập: ', style: TextStyle(fontSize: 20),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          widget.account!.username, style: TextStyle(fontSize: 20)),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Mật khẩu: ', style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(widget.account!.password, style: TextStyle(fontSize: 20)),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Số điện thoại: ', style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(widget.account!.phone, style: TextStyle(fontSize: 20)),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Email: ', style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(widget.account!.email, style: TextStyle(fontSize: 20)),
                      ),
                    ]
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
