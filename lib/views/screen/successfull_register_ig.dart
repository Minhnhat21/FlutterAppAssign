import 'package:flutter/material.dart';
import 'package:learn_flutter/models/Account.dart';
import 'package:learn_flutter/views/screen/my_instagram_app.dart';

class SuccessRegisterScreen extends StatefulWidget {
  const SuccessRegisterScreen({super.key,required this.account});
  final Account? account;
  @override
  State<SuccessRegisterScreen> createState() => _SuccessRegisterScreenState();
}

class _SuccessRegisterScreenState extends State<SuccessRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 350,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyInstagramApp(account: widget.account,))
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    //foregroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ), disabledForegroundColor: Colors.blue.withOpacity(0.38), disabledBackgroundColor: Colors.blue.withOpacity(0.12)
                ),
                child: const Text('Hoàn tất đăng ký', style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.w500),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
