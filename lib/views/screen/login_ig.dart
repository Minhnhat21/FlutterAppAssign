import 'package:flutter/material.dart';
import 'package:learn_flutter/models/Account.dart';
import 'package:learn_flutter/views/screen/username_register_ig.dart';

import 'my_instagram_app.dart';

class LoginInstagram extends StatefulWidget {
  const LoginInstagram({super.key});

  @override
  State<LoginInstagram> createState() => _LoginInstagramState();
}

class _LoginInstagramState extends State<LoginInstagram> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Account account = Account("","","","");


  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text("Instagram", style: TextStyle(fontSize: 45, fontFamily: 'Billabong'))),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white10,
                            hintText: 'Tên người dùng, email/số di động',
                            hintStyle: const TextStyle(fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 2, color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            ),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white10,
                            hintText: 'Mật khẩu',
                            hintStyle: const TextStyle(fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 2, color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(20.0),
                            )
                        ),
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                //background color of button
                                backgroundColor: Colors.blue,
                                //side: const BorderSide(width:3, color:Colors.brown), //border width and color
                                elevation: 3, //elevation of button
                                shape: RoundedRectangleBorder( //to set border radius to button
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                padding: const EdgeInsets.all(15.0) //content padding inside button
                            ),
                          onPressed: () {
                              setState(() {
                                account.username = usernameController.text.toString();
                                account.password = passwordController.text.toString();
                              });
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyInstagramApp(account: account,))
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Đăng Nhập", style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.w800),)
                            ],
                          ),
                        ),
                      ),

                      TextButton(
                          onPressed: () {},
                          child:
                            const Text(
                              "Bạn quên mật khẩu ư ?",
                              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                            )
                      ),
                      //Spacer(),
                      const SizedBox(height: 120,),
                      //Register Button
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            //background color of button
                              backgroundColor: Colors.transparent,
                              side: const BorderSide(width:2, color:Colors.blue), //border width and color
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder( //to set border radius to button
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              padding: const EdgeInsets.all(15.0) //content padding inside button
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UsernameRegisterPage(),
                                )
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Tạo tài khoản mới", style: TextStyle(fontSize: 20,color: Colors.blue, fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ),
                      ),
                  ]
                ),
              )
            )
          ],
      ),
    );
  }
}
