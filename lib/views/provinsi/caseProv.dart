import 'package:flutter/material.dart';
// import 'package:covid_19/main.dart';
import '../../models/provinsi.dart';
import '../../services/api.dart';

class Listprivonsi_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Listprovinsi(),
    );
  }
}

class Listprovinsi extends StatelessWidget {
  final border = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Kasus PerProvinsi"),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder(
          future: fetchprovinsi(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Provinsi>> snapshot) {
            if (snapshot.hasData) {
              List<Provinsi> provinsi = snapshot.data;
              return ListView.separated(
                // padding:  const EdgeInsets.all(10),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: border,
                    color: Colors.blue[100],
                    child: Column(children: [
                      ListTile(
                        title: Text(
                          provinsi[index].attributes.provinsi,
                          style: TextStyle(fontSize: 25),
                        ),
                        // subtitle: Text(provinsi[index].attributes.kasusPosi),
                        leading: Image.asset('assets/images/loc.png'),
                      ),
                      SizedBox(height: 10),
                      // Text("test"),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Text(
                              "Positif: ${provinsi[index].attributes.kasusPosi}",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 20),
                            Row(
                              children: [
                                Text(
                                  "Meninggal: ${provinsi[index].attributes.kasusMeni}",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 20),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Sembuh: ${provinsi[index].attributes.kasusSemb}",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ]),
                  );
                },
                itemCount: provinsi.length,
                separatorBuilder: (BuildContext context, int index) =>
                    // const Divider()
                    Container(height: 0, color: Colors.white),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
