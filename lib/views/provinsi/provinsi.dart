import 'package:flutter/material.dart';
// import '../../services/api.dart';
import '../hospital/hospital.dart';
import 'caseProv.dart';

class Listprovinsi extends StatelessWidget {
  static int tappedGestureDetector = 0;

  final border = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://cdn-2.tstatic.net/tribunnews/foto/bank/images/grafis-update-covid-19_.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Informasi Kasus Covid 19 Per-Provinsi",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 5),
                Column(
                  children: [
                    Container(
                      // color: Colors.green,
                      height: 400,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE3F2FD),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 35, left: 12, right: 12),
                        child: Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Listprivonsi_app()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF4DB6AC),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  SafeArea(
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              "https://cdn.iconscout.com/icon/free/png-256/stop-coronavirus-2332166-1938991.png",
                                            ),
                                            radius: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Text(
                                            "Jumlah Kasus Per Daerah",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              height: 150,
                            ),
                          ),
                          SizedBox(height: 25),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListHospital()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF42A5F5),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                children: [
                                  SafeArea(
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              "https://cdn.icon-icons.com/icons2/1465/PNG/512/588hospital_100778.png",
                                            ),
                                            radius: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Text(
                                            "RS Rujukan Covid 19",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              height: 150,
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.home),
      //       label: 'Beranda',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.check_box),
      //       label: 'Add Topik',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.list),
      //       label: 'Topik',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Akun',
      //     )
      //   ],
      // ),
    );
  }
}
