import 'package:flutter/material.dart';
import 'package:learn_flutter/models/Account.dart';
import 'package:learn_flutter/views/screen/password_register_ig.dart';

class UsernameRegisterPage extends StatefulWidget {
  const UsernameRegisterPage({super.key});

  @override
  State<UsernameRegisterPage> createState() => _UsernameRegisterPageState();
}

class _UsernameRegisterPageState extends State<UsernameRegisterPage> {

  bool isButtonActive = false;
  final myController = TextEditingController();

  Account? account = Account('','','','');
  String? message = 'Chào';

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    final text = myController.text.isNotEmpty;
    setState(() => this.isButtonActive = text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 50,),
          const Center(
            child: Text(
              "Chọn tên người dùng",
              style: TextStyle(fontSize: 34, color: Colors.white, fontWeight: FontWeight.w600),),
          ),
          const Center(
            child: Text(
              "Bạn luôn có thể thay đổi vào lúc khác",
              style: TextStyle(fontSize: 18, color: Colors.white38, fontWeight: FontWeight.w600),
            ),
          ),
          Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: SizedBox(
                      width: 350,
                      height: 60,
                      child: TextField(
                        controller: myController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white10,
                          hintText: 'Tên người dùng',
                          hintStyle: const TextStyle(fontSize: 18),
                          enabledBorder: OutlineInputBorder(
                            // borderSide:
                            // const BorderSide(width: 1, color: Colors.blueGrey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
          )),
          Center(
            child: SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: isButtonActive
                    ? () {
                      setState(() {
                        isButtonActive = false;
                        account!.username = myController.text.toString();
                      });
                      myController.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PasswordRegisterScreen(account: account, message: message,))
                      );
                    } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  //foregroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ), disabledForegroundColor: Colors.blue.withOpacity(0.38), disabledBackgroundColor: Colors.blue.withOpacity(0.12)
                ),
                child: const Text('Tiếp', style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.w500),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
