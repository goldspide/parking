import 'package:flutter/material.dart';
import 'package:park/pages/PagePrincipal.dart';
import 'package:park/pages/widget/ProfileParameters.dart';
import 'package:park/pages/widget/big_text.dart';
import 'package:park/pages/widget/small_text.dart';
import 'package:park/utils/colors.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.pureColor.withOpacity(0.3),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_outlined)),
          title: Text(
            "Parametre",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(isDark ? Icons.nightlight : Icons.sunny))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage("assets/image/profile.png"),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                BigText(text: "Djenny Brandy"),
                SmallText(text: "DjennyBrandy@gmail.com"),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  // height: 445,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (
                                _,
                                __,
                                ___,
                                ) =>
                               const  PagePrincipal()),
                        // MaterialPageRoute(builder: (__){return ProfileScreen();}),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child:const Text("Edit Profile",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 30),
                ProfileParameters(title: "parametre",icon: Icons.settings,onPress: (){}),
                ProfileParameters(title: "Detail des transaction",icon: Icons.wallet,onPress: (){}),
                ProfileParameters(title: "Gestion",icon: Icons.manage_accounts_outlined,onPress: (){}),
                const Divider(color: Colors.grey,),
                const SizedBox(height: 10),
                ProfileParameters(title: "Information",icon: Icons.perm_device_information_sharp,onPress: (){}),
                ProfileParameters(title: "Quitte",icon: Icons.logout,textColor:Colors.red,endIcon:false,onPress: (){}),
              ],
            ),
          ),
        )
    );
  }
}


