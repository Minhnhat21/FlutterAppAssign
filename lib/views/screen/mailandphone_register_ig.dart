import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:learn_flutter/models/Account.dart';
import 'package:learn_flutter/views/screen/confirmCode_register_ig.dart';

class MailOrPhoneRegisterIg extends StatefulWidget {
  MailOrPhoneRegisterIg({super.key,required this.account});
  
  Account? account;
  @override
  State<MailOrPhoneRegisterIg> createState() => _MailOrPhoneRegisterIgState();
}

class _MailOrPhoneRegisterIgState extends State<MailOrPhoneRegisterIg> with TickerProviderStateMixin {
  late final TabController _tabController;

  bool isButtonActive = false;
  final phoneInputController = TextEditingController();
  final emailInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    emailInputController.addListener(_chaneButtonState);
    phoneInputController.addListener(_chaneButtonState);
  }

  @override
  void dispose() {
    emailInputController.dispose();
    phoneInputController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _chaneButtonState() {
    final inputState = (emailInputController.text.isNotEmpty || phoneInputController.text.isNotEmpty);
    print(inputState);
    setState(() => this.isButtonActive = inputState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title:  const Center(
            child: Text(
              'Thêm số điện thoại \n hoặc email', textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),)
        ),
        bottom: PreferredSize(
          preferredSize: Size(50.0, 50.0),
          child: Container(
            width: 350,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              labelStyle: const TextStyle(fontSize: 22),
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  SizedBox(
                    height: 50.0,
                    child: Tab(text: 'Số điện thoại'),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: Tab(text: 'Email'),
                  ),
                ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  <Widget>[
          Center(
            child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: SizedBox(
                        width: 350,
                        height: 100,
                        child: IntlPhoneField(
                          controller: phoneInputController,
                          decoration: const InputDecoration(
                            hintText: 'Số điện thoại',
                            hintStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          initialCountryCode: 'VN',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
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
                                    widget.account!.phone = phoneInputController.text.toString();
                                    });
                                    phoneInputController.clear();

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ConfirmCodeScreen(account: widget.account,))
                                    );
                                    phoneInputController.clear();
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
                )),
          ),
          Center(
            child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SizedBox(
                        width: 350,
                        height: 100,
                        child: TextFormField(
                          validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email",
                          controller: emailInputController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white10,
                            hintText: 'Địa chỉ Email',
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
                    Center(
                      child: SizedBox(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: isButtonActive
                                      ? () {
                                        setState(() {
                                        isButtonActive = false;
                                        widget.account!.email = emailInputController.text.toString();
                                        });

                                        emailInputController.clear();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => ConfirmCodeScreen(account: widget.account,))
                                        );
                                        emailInputController.clear();
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
                )),
          ),
        ],
      ),
    );
  }
}
