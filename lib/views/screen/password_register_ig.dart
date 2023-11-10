import 'package:flutter/material.dart';
import 'package:learn_flutter/models/Account.dart';
import 'package:learn_flutter/views/screen/mailandphone_register_ig.dart';

class PasswordRegisterScreen extends StatefulWidget {
  PasswordRegisterScreen({super.key,required this.account,required this.message});
  Account? account;
  String? message;
  @override
  State<PasswordRegisterScreen> createState() => _PasswordRegisterScreenState();
}

class _PasswordRegisterScreenState extends State<PasswordRegisterScreen> {

  bool isButtonActive = false;
  bool checkboxActive = false;
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_chaneButtonState);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _chaneButtonState() {
    final inputState = myController.text.isNotEmpty;
    setState(() => this.isButtonActive = inputState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 50,),
          const Center(
            child: Text(
              "Tạo mật khẩu",
              style: TextStyle(fontSize: 34, color: Colors.white, fontWeight: FontWeight.w600),),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Vì lý do bảo mật, mật khẩu của bạn phải chứa 6 ký tự trở lên",
                style: TextStyle(fontSize: 18, color: Colors.white38, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
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
                        obscureText: true,
                        controller: myController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white10,
                          hintText: 'Mật khẩu',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.blue,
                    value: checkboxActive,
                    onChanged: (bool? value) {
                      setState(() {
                        checkboxActive = !checkboxActive;
                      });
                    }),
                Text("Nhớ mật khẩu", style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: isButtonActive
                    ? () {
                  setState(() {
                    isButtonActive = false;
                    widget.account!.password = myController.text.toString();
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MailOrPhoneRegisterIg(account: widget.account,))
                  );
                  myController.clear();
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
