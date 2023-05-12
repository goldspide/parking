import 'package:flutter/material.dart';
import 'package:fsearch/fsearch.dart';
import 'package:park/components/screen_buttom.dart';
import 'package:park/pages/widget/big_text.dart';
import 'package:park/pages/widget/small_text.dart';
import 'package:park/utils/colors.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class Liste extends StatefulWidget {
  const Liste({Key? key}) : super(key: key);

  @override
  State<Liste> createState() => _ListeState();
}

class _ListeState extends State<Liste> {
  final events = [
    // {
    //   'statut': 'parking',
    //   'nom': 'Parking Confiance',
    //   'imatriculation': 'CM 450 LT',
    //   'parkingid': 'B250',
    //   'image': 'images1',
    //   'images': 'B250',
    //   'hwure arrive': '12:00',
    //   'heure depart': '02:00'
    // },
    // {
    //   'statut': 'parking',
    //   'nom': 'PARKING KOTTO CARREFOUR DES IMMEUBLES',
    //   'imatriculation': 'CM 450 LT',
    //   'parkingid': 'B250',
    //   'image': 'images2',
    //   'images': 'B250',
    //   'hwure arrive': '12:00',
    //   'heure depart': '02:00'
    // },
    // {
    //   'statut': 'parking',
    //   'nom': 'Parking communal payant',
    //   'imatriculation': 'CM 450 LT',
    //   'parkingid': 'B250',
    //   'image': 'profile1',
    //   'images': 'B250',
    //   'hwure arrive': '12:00',
    //   'heure depart': '02:00'
    // },
    // {
    //   'statut': 'parking',
    //   'nom': 'Parking communal payant',
    //   'imatriculation': 'CM 450 LT',
    //   'parkingid': 'B250',
    //   'image': 'images',
    //   'images': 'B250',
    //   'hwure arrive': '12:00',
    //   'heure depart': '02:00'
    // },
    // {
    //   'statut': 'parking',
    //   'nom': 'Bonabéri Car Parking ',
    //   'imatriculation': 'CM 450 LT',
    //   'parkingid': 'B250',
    //   'image': 'images1',
    //   'images': 'B250',
    //   'hwure arrive': '12:00',
    //   'heure depart': '02:00'
    // },
    // {
    //   'statut': 'parking',
    //   'nom': 'le parking ma gloire',
    //   'imatriculation': 'CM 450 LT',
    //   'parkingid': 'B250',
    //   'image': 'images',
    //   'images': 'B250',
    //   'hwure arrive': '12:00',
    //   'heure depart': '02:00'
    // },
    // {
    //   'statut': 'parking',
    //   'nom': 'le parking ma gloire',
    //   'imatriculation': 'CM 450 LT',
    //   'parkingid': 'B250',
    //   'image': 'images1',
    //   'images': 'B250',
    //   'hwure arrive': '12:00',
    //   'heure depart': '02:00'
    // },
    // {
    //   'statut': 'parking',
    //   'nom': 'le parking ma gloire',
    //   'imatriculation': 'CM 450 LT',
    //   'parkingid': 'B250',
    //   'image': 'profile1',
    //   'images': 'B250',
    //   'hwure arrive': '12:00',
    //   'heure depart': '02:00'
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const CallButtom(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 165),
                child: FSearch(
                  height: 45,
                  width: 300,
                  backgroundColor: Colors.white,
                  prefixes: const[
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    )
                  ],
                  hints: const [
                    "Recherche une reservation recente",
                    "Revenez ou Vous etiez",
                    "Retracer votre chemin"
                  ],
                  hintSwitchAnimDuration: SelectionOverlay.fadeDuration,
                  hintSwitchEnable: true,
                  hintSwitchType: FSearchAnimationType.Fade,
                  stopHintSwitchOnFocus: true,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  corner: FSearchCorner.all(25),
                  cornerStyle: FSearchCornerStyle.round,
                ),
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 52),
          height: 30,
          width: 300,
          decoration: BoxDecoration(
            color: AppColors.pureColor,
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.only(top: 10, right: 10),
          child: const Text(
            "Liste des Reservation",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(),
        Container(
          height: 50,
          decoration: BoxDecoration(color: AppColors.pureColor.withOpacity(0.5),),
          padding: const EdgeInsets.only(left: 50,right: 50),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   PageRouteBuilder(
                  //       pageBuilder: (
                  //           _,
                  //           __,
                  //           ___,
                  //           ) =>
                  //       const  PagePrincipal()),
                  //   // MaterialPageRoute(builder: (__){return ProfileScreen();}),
                  // );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child:const Text("Historique",
                    style: TextStyle(color: Colors.black)),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   PageRouteBuilder(
                  //       pageBuilder: (
                  //           _,
                  //           __,
                  //           ___,
                  //           ) =>
                  //       const  PagePrincipal()),
                  //   // MaterialPageRoute(builder: (__){return ProfileScreen();}),
                  // );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child:const Text("Actif",
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ) ,
        ),
        Container(
          margin:const EdgeInsets.only(bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 500,
                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: events.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        // Declaration des element de recuperation pour afficharge
                        final event = events[index];
                        final image = event['image'];
                        final heureA = event['heure arrive'];
                        final heureD = event['heure depart'];
                        final matricule = event['imatriculation'];
                        final nom = event['nom'];
                        final statut = event['statut'];
                        final parkingId = event['images'];

                        return Card(
                          child: ListTile(
                            leading: SizedBox(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("assets/image/$image.jpeg"),
                            )),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 3),
                                  margin: const EdgeInsets.only(right: 7),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.yellow),
                                  child: SmallText(
                                    text: "$statut",
                                    color: Colors.grey.withOpacity(0.7),
                                  ),
                                ),
                                BigText(text: "$nom", size: 16),
                                SmallText(text: "Parking ID   " "    $parkingId"),
                                BigText(
                                  text: "$matricule    "
                                      "   $heureA am - $heureD pm",
                                  size: 12,
                                )
                              ],
                            ),
                            trailing: const Icon(Icons.more_vert),
                          ),
                        );
                      })),
            ],
          ),
        )
      ],
    );
  }
}
