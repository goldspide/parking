import 'package:flutter/material.dart';
import 'package:fsearch/fsearch.dart';
import 'package:park/components/screen_buttom.dart';
import 'package:park/pages/widget/big_text.dart';
import 'package:park/pages/widget/small_text.dart';
import 'package:park/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final parking = [
    {
      'nom': 'Parking Confiance',
      'localisation': 'Makepe',
      'rating': 3.2,
      'distance': '14km',
      'image':'non.jpg',
      'status': 'ouvert',
      'etat' : 'verifier',
      'information': 'nous offrent des stationement de nuit'
    },
    {
      'nom': 'PARKING KOTTO CARREFOUR DES IMMEUBLES',
      'localisation': 'Kotto',
      'rating': 3.2,
      'distance': '4.4km',
      'image':'tous.jpg',
      'status': 'ferme',
      'etat' : 'verifier',
      'information': 'Nos parking disponible 24/24 sonr a votre service'
    },
    {
      'nom': 'Parking communal payant',
      'localisation': 'Bonamoussadi',
      // 'rating': 4.2,
      'distance': '7,9km',
      'image':'default.png',
      'status': 'ouvert',
      'etat' : 'verifier',
      'information': 'Nous avons des place pour tous type de vehicle'
    },
    {
      'nom': 'Bonabéri Car Parking ',
      'localisation': 'Bonaberi',
      'rating': 3.1,
      'distance': '11km',
      'image':'default.png',
      'status': 'ouvert',
      'etat' : 'verifier',
      'information': 'les meilleur parking dans votre localite ce trouve chez nous'
    },
    {
      'nom': 'Parking Bolloré',
      'localisation': 'Kassalafam II',
      'rating': 3.7,
      'distance': '7,9km',
      'image':'default.png',
      'status': 'ouvert',
      'etat' : 'verifier',
      'information': 'Nous gardons votre vehicle pendant votre sommeil pour vous facilite la vie'
    },

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
                  prefixes: const [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    )
                  ],
                  hints: const [
                    "Recherche la parking le plus proche",
                    "Vous ete votre prope guide",
                    "Vous choisissez votre route"
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
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(right: 230),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.only(right: 10, left: 10, bottom: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("categorie",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.backGround.withOpacity(0.7),
                      ),
                      height: 40,
                      width: 40,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.directions_bike_rounded,
                            color: AppColors.pureColor,
                          ))),
                  SmallText(
                    text: "Velo",
                    color: Colors.black,
                  )
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.backGround.withOpacity(0.7),
                      ),
                      height: 40,
                      width: 40,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.motorcycle_outlined,
                            color: AppColors.pureColor,
                          ))),
                  SmallText(
                    text: "Moto",
                    color: Colors.black,
                  )
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.backGround.withOpacity(0.7),
                      ),
                      height: 40,
                      width: 40,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.car_repair,
                            color: AppColors.pureColor,
                          ))),
                  SmallText(
                    text: "voiture",
                    color: Colors.black,
                  )
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.backGround.withOpacity(0.7),
                      ),
                      height: 40,
                      width: 40,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.directions_bus_sharp,
                            color: AppColors.pureColor,
                          ))),
                  SmallText(
                    text: "Bus",
                    color: Colors.black,
                  )
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.backGround.withOpacity(0.7),
                      ),
                      height: 40,
                      width: 40,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.fire_truck_outlined,
                            color: AppColors.pureColor,
                          ))),
                  SmallText(
                    text: "Camion",
                    color: Colors.black,
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(right: 110, left: 25),
          decoration: BoxDecoration(),
          padding: const EdgeInsets.only(right: 10, left: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Les parking les plus proche",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ],
          ),
        ),
        Container(
          height: 700,
          child: ListView.builder(
              itemCount: parking.length,
              //shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final parks = parking[index];
                final nom =  parks['nom'];
                final image = parks['image'];
                final distance = parks['distance'];
                final Object? rating = parks['rating'];
                final local = parks['localisation'];
                final status =  parks['status'];
                final etat = parks['etat'];
                final info = parks['information'];
                final int A = 4;


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
                          color: AppColors.pureColor,
                          image:  DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/$image"),
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
                                    text: "$nom"),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(
                                      text: "$local",
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                    // SizedBox(width: 76,),
                                    // SmallText(text: "$etat",color:AppColors.pureColor ,)
                                  ],
                                ),
                                const  SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Wrap(
                                      children: List.generate(4, (index) => Icon(Icons.star,color: AppColors.pureColor, size:10))
                                      ),
                                    const SizedBox(width: 80,),
                                    SmallText(text: "$status",color: Colors.green,size: 9,),
                                      ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.location_pin,
                                            size: 22,
                                            color: AppColors.pureColor,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, right: 30),
                                      child: SmallText(text: "$distance"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: IconButton(
                                          onPressed: () {
                                            showDialog(context: context, builder: (context) =>   AlertDialog(
                                              title:  const Text('information sur le parking'),
                                              content:  Text('$info'),
                                              actions: [
                                                TextButton(onPressed: () {
                                                  Navigator.pop(context);
                                                }, child: Text('quite'))
                                              ],
                                            )
                                            );

                                          },
                                          icon: Icon(
                                            Icons.schema_rounded,
                                            color: AppColors.pureColor,
                                          )),
                                    )
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
