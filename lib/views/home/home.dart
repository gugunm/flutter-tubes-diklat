import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constant/color.dart';
import '../../services/api.dart';
import '../../models/nasional.dart';
import '../provinsi/provinsi.dart';
import '../vaksin/vaksin.dart';

class Home extends StatefulWidget {
  final String username;
  final String password;

  const Home({Key key, this.username, this.password}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: HexColor(AppColor.biru),
              child: Column(
                children: [
                  Container(
                    color: HexColor(AppColor.biru),
                    width: double.infinity,
                    height: 200.0,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(top: 10, right: 20),
                      child: new Image.asset(
                        'assets/images/bg_home.png',
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // color: HexColor(AppColor.abumuda),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              // child: Text(dataNasional == null ? "" : dataNasional[0].countryRegion),
              child: FutureBuilder<List<CovidNasional>>(
                future: getCovidNasional(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<CovidNasional>> snapshot) {
                  if (snapshot.hasData) {
                    List<CovidNasional> data = snapshot.data;
                    CovidNasional dataNasional = data[0];
                    return Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      width: double.infinity,
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Halo, ${widget.username}",
                                  style: TextStyle(
                                    color: HexColor(AppColor.abumuda),
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.account_circle,
                                  color: HexColor(AppColor.abumuda),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20, bottom: 5),
                            // color: Colors.amber,
                            width: double.infinity,
                            child: Text(
                              "Kasus Terkini",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 5),
                            // color: HexColor(AppColor.birumuda),
                            width: double.infinity,
                            child: Text(
                              "Covid-19",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: HexColor(AppColor.birumuda),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 190,
                            width: double.infinity,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Update Kasus Covid-19",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Terakhir diperbarui pada ${dataNasional.lastUpdate}",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Icon(
                                                Icons.coronavirus_outlined,
                                                color: Colors.yellow[700],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                dataNasional.confirmed
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.yellow[700],
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Text(
                                                "Positif",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.yellow[700],
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Icon(
                                                Icons.healing_outlined,
                                                color: Colors.green,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                dataNasional.recovered
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Text(
                                                "Sembuh",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.green,
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Icon(
                                                Icons
                                                    .airline_seat_individual_suite_outlined,
                                                color: HexColor(AppColor.merah),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                dataNasional.deaths.toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: HexColor(
                                                        AppColor.merah),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Text(
                                                "Meninggal",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color:
                                                      HexColor(AppColor.merah),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Pencegahan Covid-19",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: new Image.asset(
                                            'assets/images/use_mask.png'),
                                      ),
                                      Container(
                                        child: Text(
                                          "Gunakan masker saat bepergian",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: new Image.asset(
                                            'assets/images/wash_hand.png'),
                                      ),
                                      Container(
                                        child: Text(
                                          "Selalu Mencuci tangan",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: new Image.asset(
                                            'assets/images/social_distance.png'),
                                      ),
                                      Container(
                                        child: Text(
                                          "Selalu menjaga jarak",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: HexColor(AppColor.ungu),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        stops: [
                                          0.2,
                                          0.8,
                                        ],
                                        colors: [
                                          HexColor(AppColor.biru),
                                          HexColor(AppColor.ungu)
                                        ]),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: new Image.asset(
                                          "assets/images/map_home.png",
                                          width: 100,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 30, right: 20, left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Informasi Penyebaran \n Covid-19 di Provinsi",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 20),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 10,
                                              ),
                                              // color: Colors.white,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Listprovinsi()),
                                                  );
                                                },
                                                child: Text(
                                                  "Lihat Detail",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                        HexColor(AppColor.ungu),
                                                  ),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: HexColor(AppColor.ungu),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        stops: [
                                          0.2,
                                          0.8,
                                        ],
                                        colors: [
                                          HexColor(AppColor.biru),
                                          HexColor(AppColor.ungu)
                                        ]),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: new Image.asset(
                                          "assets/images/map_home.png",
                                          width: 100,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 30, right: 20, left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Informasi Vaksinasi \n Covid-19 di Provinsi",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 20),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 10,
                                              ),
                                              // color: Colors.white,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoadVaksin()),
                                                  );
                                                },
                                                child: Text(
                                                  "Lihat Detail",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                        HexColor(AppColor.ungu),
                                                  ),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                // CardInfoHome(
                                //   linkImg: "assets/images/map_home.png",
                                //   judul:
                                //       "Informasi Penyebaran \n Covid-19 di Provinsi",
                                // ),
                                // CardInfoHome(
                                //   linkImg: "assets/images/map_home.png",
                                //   judul:
                                //       "Informasi Vaksinasi \n Covid-19 di Provinsi",
                                // ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CardInfoHome extends StatelessWidget {
//   final String judul;
//   final String linkImg;
//   // final Class

//   const CardInfoHome({
//     Key key,
//     this.judul,
//     this.linkImg,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 15),
//       height: 150,
//       decoration: BoxDecoration(
//         color: HexColor(AppColor.ungu),
//         borderRadius: BorderRadius.all(
//           Radius.circular(20),
//         ),
//         gradient: LinearGradient(
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//             stops: [
//               0.2,
//               0.8,
//             ],
//             colors: [
//               HexColor(AppColor.biru),
//               HexColor(AppColor.ungu)
//             ]),
//       ),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: new Image.asset(
//               linkImg,
//               width: 100,
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.only(top: 30, right: 20, left: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   judul,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 20),
//                   padding: EdgeInsets.symmetric(
//                     vertical: 5,
//                     horizontal: 10,
//                   ),
//                   // color: Colors.white,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoadVaksin()),
//                       );
//                     },
//                     child: Text(
//                       "Lihat Detail",
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: HexColor(AppColor.ungu),
//                       ),
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
