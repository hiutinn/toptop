
import 'package:chat_app_project/views/pages/auth/login_phone_screen.dart';
import 'package:chat_app_project/views/pages/auth/login_screen.dart';
import 'package:chat_app_project/views/pages/auth/register_screen.dart';
import 'package:chat_app_project/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_text.dart';
import '../../widgets/colors.dart';
import '../../widgets/text.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body(context);
    // return Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Container(
    //         height: MediaQuery.of(context).size.height,
    //         width: MediaQuery.of(context).size.width,
    //         child: Stack(
    //           children: [
    //             Container(
    //               height: MediaQuery.of(context).size.height / 2,
    //               width: MediaQuery.of(context).size.width,
    //               decoration: const BoxDecoration(
    //                   // borderRadius: new BorderRadius.only(
    //                   //   bottomRight: const Radius.circular(40.0),
    //                   //   bottomLeft: const Radius.circular(40.0),
    //                   // ),
    //                   ),
    //               child: Image.asset(
    //                 'assets/images/sakura.png',
    //                 fit: BoxFit.fill,
    //               ),
    //             ),
    //             Positioned(
    //               top: MediaQuery.of(context).size.height / 4,
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Container(
    //                   height: MediaQuery.of(context).size.height * 1 / 2,
    //                   width: MediaQuery.of(context).size.width - 16,
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       const SizedBox(
    //                         height: 10,
    //                       ),
    //                       CustomText(
    //                         text: 'Chat App',
    //                         fontsize: 50,
    //                         color: Colors.black,
    //                         alignment: Alignment.center,
    //                         fontFamily: 'SquarePeg',
    //                       ),
    //                       const SizedBox(
    //                         height: 20,
    //                       ),
    //                       CustomButton(
    //                         onPress: () {
    //                           Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => LoginScreen()),
    //                           );
    //                         },
    //                         text: 'LOGIN',
    //                         color: MyColors.thirdColor,
    //                       ),
    //                       const SizedBox(
    //                         height: 20,
    //                       ),
    //                       CustomButton(
    //                         onPress: () {
    //                           Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => RegisterScreen()),
    //                           );
    //                         },
    //                         text: 'SIGN UP',
    //                         color: MyColors.thirdColor,
    //                       ),
    //                       const SizedBox(
    //                         height: 10,
    //                       ),
    //                       Container(
    //                         width: MediaQuery.of(context).size.width - 16,
    //                         alignment: Alignment.centerRight,
    //                         child: ButtonTextCustom(
    //                           onPress: () {},
    //                           text: 'Forgot Password ?',
    //                           fontsize: 20,
    //                           color: Colors.black,
    //                           alignment: Alignment.centerRight,
    //                           fontFamily: 'DancingScript',
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Positioned(
    //               bottom: MediaQuery.of(context).size.height / 12,
    //               child: Container(
    //                 height: MediaQuery.of(context).size.height / 3,
    //                 width: MediaQuery.of(context).size.width,
    //                 decoration: const BoxDecoration(
    //                     // borderRadius: new BorderRadius.only(
    //                     //   bottomRight: const Radius.circular(40.0),
    //                     //   bottomLeft: const Radius.circular(40.0),
    //                     // ),
    //                     ),
    //                 child: Image.asset(
    //                   'assets/images/pinkbird.png',
    //                   fit: BoxFit.fill,
    //                 ),
    //               ),
    //             ),
    //             Positioned(
    //               bottom: 0,
    //               child: Container(
    //                 height: MediaQuery.of(context).size.height / 4,
    //                 width: MediaQuery.of(context).size.width,
    //                 decoration: const BoxDecoration(
    //                     // borderRadius: new BorderRadius.only(
    //                     //   bottomRight: const Radius.circular(40.0),
    //                     //   bottomLeft: const Radius.circular(40.0),
    //                     // ),
    //                     ),
    //                 child: Image.asset(
    //                   'assets/images/pinkwater.png',
    //                   fit: BoxFit.fill,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
  Widget body(BuildContext context){
    return SafeArea(
      child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: const Text(
                    "Log in to TopTop",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 20,bottom: 20),

                  child: const Text(
                    "Manage your account, check notifications,\ncomment on videos, and more",
                    style: TextStyle(fontSize: 16,color: Colors.grey),
                  )),
              login(context)
            ],
          )),
    );
  }
  Widget login(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginWithPhoneNumber()),
              );
            },
            style: ElevatedButton.styleFrom(// Màu nền của nút
              backgroundColor: Colors.white38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5), // Độ bo tròn góc của nút
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: const [
                  Icon(Icons.phone,color: Colors.black,),
                  SizedBox(width: 20),
                  Text("Login with Phone number", style: TextStyle(fontSize: 16,color: Colors.black)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            style: ElevatedButton.styleFrom(// Màu nền của nút
              backgroundColor: Colors.white38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5), // Độ bo tròn góc của nút
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: const [
                  Icon(Icons.email,color: Colors.black,),
                  SizedBox(width: 20),
                  Text("Login with Email", style: TextStyle(fontSize: 16,color: Colors.black)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
