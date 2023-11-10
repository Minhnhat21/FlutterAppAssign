import 'package:flutter/material.dart';
import 'package:learn_flutter/models/Account.dart';
import 'package:learn_flutter/views/screen/successfull_register_ig.dart';

class ConfirmCodeScreen extends StatefulWidget {
  ConfirmCodeScreen({super.key, required this.account});
  Account? account;
  @override
  State<ConfirmCodeScreen> createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  bool isButtonActive = false;
  final confirmCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    confirmCodeController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    confirmCodeController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    final text = confirmCodeController.text.isNotEmpty;
    setState(() => this.isButtonActive = text);
  }

  String locateRecieveCofirmCode() {
    String locate = '';
    if(widget.account!.phone.isNotEmpty) {
      locate = widget.account!.phone.toString();
    } else {
      locate = widget.account!.email.toString();
    }
    return locate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 50,),
          const Center(
            child: Text(
              "Nhập mã xác nhận",
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),),
          ),
          Center(
            child: Text(
              "Hãy nhập mã xác nhận mà chúng tôi \n đã gửi đến ${locateRecieveCofirmCode()}",
              style: const TextStyle(fontSize: 18, color: Colors.white38, fontWeight: FontWeight.w600), textAlign: TextAlign.center,
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
                        keyboardType: TextInputType.number,
                        controller: confirmCodeController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white10,
                          hintText: 'Mã xác nhận',
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
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessRegisterScreen(account: widget.account,))
                  );
                  confirmCodeController.clear();
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
