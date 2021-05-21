import 'package:flutter/material.dart';
import '../../models/hospital.dart';
import '../../services/api.dart';

class ListHospital extends StatelessWidget {
  final border = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Daftar Rumah Sakit",
            style: TextStyle(fontSize: 27, color: Colors.black)),
        centerTitle: true,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
          onPressed: () {},
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder(
          future: fetchHospital(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Hospital>> snapshot) {
            if (snapshot.hasData) {
              List<Hospital> hospital = snapshot.data;
              return ListView.separated(
                // padding:  const EdgeInsets.all(10),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Card(
                      shape: border,
                      color: Colors.blue[300],
                      child: ListTile(
                        title: Column(
                          children: [
                            Text(hospital[index].name,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center),
                            Text(hospital[index].address,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center),
                            Text(hospital[index].region,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center),
                            // Text(hospital[index].phone,
                            //     style: TextStyle(fontSize: 10),
                            //     textAlign: TextAlign.left),
                            Text(hospital[index].province,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center),
                          ],
                        ),
                        leading: Image.asset('assets/images/rs3.png'),
                        // leading: Icon(Icons.house_outlined),
                      ),
                    ),
                  );
                },
                itemCount: hospital.length,
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
