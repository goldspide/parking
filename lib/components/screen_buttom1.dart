import 'package:flutter/material.dart';
import 'package:park/pages/EditProfile.dart';
import 'package:park/pages/PagePrincipal.dart';
import 'package:park/pages/widget/big_text.dart';
import 'package:park/pages/widget/small_text.dart';
import 'package:park/utils/colors.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class CallButtom extends StatefulWidget {
  const CallButtom({Key? key}) : super(key: key);

  @override
  State<CallButtom> createState() => _CallButtomState();
}

class _CallButtomState extends State<CallButtom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4.2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.pureColor,
                AppColors.pureColor,
              ],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            margin: const EdgeInsets.only(top: 45, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: SizedBox(
                            height: 60,
                            width: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                image: AssetImage("assets/image/profile.png"),
                              ),
                            )),
                      ),
                      Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(right: 84),
                              child: BigText(
                                text: "Djenny",
                                color: Colors.white,
                              )),
                          Row(
                            children: [
                              SmallText(
                                text: "DjennyBrandy@gmail.com",
                                color: Colors.white,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            right: 10, bottom: 15, top: 7),
                        width: 40,
                        height: 45,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (
                                _,
                                __,
                                ___,
                              ) =>
                                      const ProfileScreen()
                              ),
                            );
                          },
                          icon: const Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 30),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
