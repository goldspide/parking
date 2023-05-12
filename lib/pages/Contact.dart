import 'package:flutter/material.dart';
import 'package:park/components/screen_buttom.dart';
import 'package:park/pages/widget/big_text.dart';
import 'package:park/pages/widget/small_text.dart';
import 'package:park/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    final Uri phoneNumber = Uri.parse("tel:+237676155500");
    final Uri whatsapp = Uri.parse("https://wa.me/670440605");
    return Column(
      children: [
        CallButtom(),
        Container(
          height: 700,
          child: ListView.builder(
              itemCount: 5,
              //shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin:
                  const EdgeInsets.only(left: 25, right: 20, bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/profile.png"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          // width: 195,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(
                                    text: "Santa Parking Area ville bikoko"),
                                const SizedBox(
                                  height: 10,
                                ),
                                SmallText(
                                  text: "Bounamoussadi",
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 2, left: 1),
                                      child: IconButton(
                                          onPressed: () async {
                                            print( canLaunchUrl(phoneNumber));
                                          },
                                          icon: const Icon(
                                            Icons.phone,
                                            size: 22,
                                            color: Colors.green,
                                          )),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 15, right: 30),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: IconButton(
                                          onPressed: () async {
                                            launchUrl(whatsapp);
                                          },
                                          icon: Icon(
                                            Icons.message,
                                            color: Colors.green,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
