import 'package:chat_app_project/database/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../../widgets/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/textformfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  String? validateEmail(String value) {
    if (value == '') {
      return "Empty Field !";
    } else if (!isValidEmail(value)) {
      return "Wrong Email !";
    } else {
      return null;
    }
  }

  doRegister(BuildContext context) {
    if(validate()){
      AuthService.registerFetch(
        context: context,
        email: emailController.text,
        password: passwordController.text,
        fullName: nameController.text,
        uid: ''
      );
    }
  }

  bool validate() {
    if (nameController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  String? validatePassword(String value) {
    if (value == '') {
      return "Empty Field !";
    } else if (value.length <= 5) {
      return "Your password is so short !";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String value) {
    if (value == '') {
      return "Empty Field !";
    } else if (value != passwordController.text) {
      return "Your confirmation password does not match !";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.west,
            color: Colors.grey,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            info(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  doRegister(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: const Text("Confirm"),
              ),
            )
          ],
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Container(
          //       height: MediaQuery.of(context).size.height,
          //       width: MediaQuery.of(context).size.width,
          //       child: Stack(
          //         children: [
          //           Container(
          //             height: MediaQuery.of(context).size.height / 2,
          //             width: MediaQuery.of(context).size.width,
          //             decoration: const BoxDecoration(
          //                 // borderRadius: new BorderRadius.only(
          //                 //   bottomRight: const Radius.circular(40.0),
          //                 //   bottomLeft: const Radius.circular(40.0),
          //                 // ),
          //                 ),
          //             child: Image.asset(
          //               'assets/images/peachflowerblossom.png',
          //               fit: BoxFit.fill,
          //             ),
          //           ),
          //           Positioned(
          //             top: 20,
          //             right: 0,
          //             child: IconButton(
          //               icon: const Icon(
          //                 Icons.backspace,
          //                 color: Colors.black,
          //               ),
          //               onPressed: () {
          //                 Navigator.pop(context);
          //               },
          //             ),
          //           ),
          //           Positioned(
          //             bottom: MediaQuery.of(context).size.height / 12,
          //             child: Container(
          //               height: MediaQuery.of(context).size.height / 3,
          //               width: MediaQuery.of(context).size.width,
          //               decoration: const BoxDecoration(
          //                   // borderRadius: new BorderRadius.only(
          //                   //   bottomRight: const Radius.circular(40.0),
          //                   //   bottomLeft: const Radius.circular(40.0),
          //                   // ),
          //                   ),
          //               child: Image.asset(
          //                 'assets/images/pinkbird.png',
          //                 fit: BoxFit.fill,
          //               ),
          //             ),
          //           ),
          //           Positioned(
          //             bottom: 0,
          //             child: Container(
          //               height: MediaQuery.of(context).size.height / 4,
          //               width: MediaQuery.of(context).size.width,
          //               decoration: const BoxDecoration(
          //                   // borderRadius: new BorderRadius.only(
          //                   //   bottomRight: const Radius.circular(40.0),
          //                   //   bottomLeft: const Radius.circular(40.0),
          //                   // ),
          //                   ),
          //               child: Image.asset(
          //                 'assets/images/pinkwater.png',
          //                 fit: BoxFit.fill,
          //               ),
          //             ),
          //           ),
          //           Positioned(
          //             top: MediaQuery.of(context).size.height / 4,
          //             child: Padding(
          //               padding: const EdgeInsets.all(16.0),
          //               child: Container(
          //                 height: MediaQuery.of(context).size.height * 4 / 6,
          //                 width: MediaQuery.of(context).size.width - 32,
          //                 child: Form(
          //                   key: _registerFormKey,
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.start,
          //                     crossAxisAlignment: CrossAxisAlignment.center,
          //                     children: [
          //                       CustomTextFormField(
          //                           controller: nameController,
          //                           text: 'Full-Name',
          //                           hint: 'Nguyen Huu Canh',
          //                           onSave: (value) {
          //                             //controller.userPwd = value!;
          //                           },
          //                           validator: (value) {
          //                             return validatePassword(value!);
          //                           }),
          //                       const SizedBox(height: 20),
          //                       CustomTextFormField(
          //                           controller: emailController,
          //                           text: 'E-mail',
          //                           hint: 'nguyenduylong@gmail.com',
          //                           onSave: (value) {
          //                             //controller.userName = value!;
          //                           },
          //                           validator: (value) {
          //                             return validateEmail(value!);
          //                           }),
          //                       const SizedBox(height: 20),
          //                       CustomTextFormField(
          //                           controller: passwordController,
          //                           passCheck: true,
          //                           text: 'Password',
          //                           hint: '************',
          //                           onSave: (value) {
          //                             //controller.userPwd = value!;
          //                           },
          //                           validator: (value) {
          //                             return validatePassword(value!);
          //                           }),
          //                       const SizedBox(height: 20),
          //                       CustomTextFormField(
          //                           controller: confirmPasswordController,
          //                           passCheck: true,
          //                           text: 'Confirm Password',
          //                           hint: '************',
          //                           onSave: (value) {
          //                             //controller.userPwd = value!;
          //                           },
          //                           validator: (value) {
          //                             return validateConfirmPassword(value!);
          //                           }),
          //                       const SizedBox(height: 20),
          //                       CustomButton(
          //                         onPress: () {
          //                           doRegister(context);
          //                         },
          //                         text: 'SIGN UP',
          //                         color: MyColors.thirdColor,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
        ),
      ),
    );
  }

  Widget info() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(margin: EdgeInsets.symmetric(vertical: 20),
              child: const Text('Sign up for TikTok',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              hintText: "Full name",
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              hintText: "Email",
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              hintText: "Password",
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: confirmPasswordController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              hintText: "Confirm Password",
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
