import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: const Icon(Icons.arrow_back),
          title: const Text("Praktikum 4"),
        ),
        body: ListView(
          children: [
            //pertama
            Container(
              height: 250,
              color: Colors.red,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //image profile
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightBlueAccent),
                      child: const Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    //Teks Nama
                    const Text(
                      "Puspita",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "2010xxxxxx",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Mahasiswa",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ]),
            ),

            //kedua
            Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffFEF4F3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Data Diri",
                    style: TextStyle(
                        color: Colors.pinkAccent, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Nama "), Text("Puspita")],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Kelas "), Text("TI 1")],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Program Studi"),
                      Text("Teknik Informatika")
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Dosen Wali "), Text("NAP")],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Angkatan "), Text("2021")],
                  ),
                  Image.asset("assets/Icon.png")
                ],
              ),
            ),

            //ketiga
            Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffFEF4F3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pusat Bantuan",
                    style: TextStyle(
                        color: Colors.pinkAccent, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Bantuan "),
                      Image.asset(
                        "assets/Icon.png",
                        width: 60,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Laporkan Masalah "),
                      Image.network(
                        "https://i0.wp.com/pmb.ittelkom-pwt.ac.id/wp-content/uploads/2021/03/LOGO-ITTP.png?ssl=1",
                        width: 100,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
