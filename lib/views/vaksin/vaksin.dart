import 'dart:async';
import 'package:flutter/material.dart';
import '../../models/vaksin.dart';
import '../../services/api.dart';

class LoadVaksin extends StatefulWidget {
  @override
  _LoadVaksinState createState() => _LoadVaksinState();
}

class _LoadVaksinState extends State<LoadVaksin> {
  Future<Vaksin> futureVaksin;
  @override
  void initState() {
    super.initState();
    futureVaksin = fetchVaksin();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Data Vaksin di Indonesia',
          style: TextStyle(fontSize: 27, color: Colors.black),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
            onPressed: () {}),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpeg"), fit: BoxFit.cover)),
        child: FutureBuilder<Vaksin>(
          future: futureVaksin,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(children: [
                GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      //crossAxisSpacing: 10
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Color.fromRGBO(11, 109, 100, 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '  ' +
                                        snapshot.data.totalsasaran.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                        color: Color.fromRGBO(
                                            255, 255, 255, 0.38)),
                                    child: Icon(
                                      Icons.coronavirus_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 10, top: 20),
                                  child: Text(
                                    'Total Sasaran Vaksin',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ))
                            ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Color.fromRGBO(11, 109, 150, 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '  ' +
                                        snapshot.data.sasaranvaksinsdmk
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                        color: Color.fromRGBO(
                                            255, 255, 255, 0.38)),
                                    child: Icon(
                                      Icons.coronavirus_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 10, top: 20),
                                  child: Text(
                                    'Sasaran Vaksin Sumber Daya Manusia Kesehatan (SDMK)',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ))
                            ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Color(0xFF3CAEA3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '  ' +
                                        snapshot.data.sasaranvaksinlansia
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                        color: Color.fromRGBO(
                                            255, 255, 255, 0.38)),
                                    child: Icon(
                                      Icons.coronavirus_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 10, top: 20),
                                  child: Text(
                                    'Sasaran Vaksin Lansia',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ))
                            ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Color.fromRGBO(11, 109, 207, 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '  ' +
                                        snapshot.data.sasaranvaksinpetugaspublik
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                        color: Color.fromRGBO(
                                            255, 255, 255, 0.38)),
                                    child: Icon(
                                      Icons.coronavirus_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 10, top: 20),
                                  child: Text(
                                    'Sasaran Vaksin Petugas Publik',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ))
                            ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.blue[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '  ' + snapshot.data.vaksinasi1.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                        color: Color.fromRGBO(
                                            255, 255, 255, 0.38)),
                                    child: Icon(
                                      Icons.coronavirus_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 10, top: 20),
                                  child: Text(
                                    'Vaksinasi Tahap Pertama',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ))
                            ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Color.fromRGBO(51, 204, 153, 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '  ' + snapshot.data.vaksinasi2.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                        color: Color.fromRGBO(
                                            255, 255, 255, 0.38)),
                                    child: Icon(
                                      Icons.coronavirus_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 10, top: 20),
                                  child: Text(
                                    'Vaksinasi Tahap Kedua',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ))
                            ]),
                          ),
                        ),
                      ),
                    ]),
                Align(
                    alignment: Alignment(0, 0.97),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Last Update @ ' +
                              snapshot.data.lastUpdate.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    )),
                Align(
                  alignment: Alignment(0, 0.85),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/masker2.png"),
                            fit: BoxFit.cover)),
                  ),
                )
              ]);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
